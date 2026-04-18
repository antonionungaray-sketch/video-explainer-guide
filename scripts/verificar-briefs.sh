#!/usr/bin/env bash
# verificar-briefs.sh — detecta drift entre briefs y pilares.
#
# Para cada brief en docs/briefs/**/*.md, compara su `sync:` con la fecha
# del último commit que tocó la línea específica donde vive cada ID del
# pilar listado en `fuentes:`. Reporta briefs potencialmente stale.
#
# Adicional: valida que cada ID listado en `fuentes:` exista realmente
# en el pilar citado (detecta typos tempranos).
#
# Zero-dependency: bash + git + grep + awk.
# Exit 0 siempre (es reporte, no gate) salvo error de entorno.

set -euo pipefail

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "ERROR: no estás dentro de un repo git" >&2
  exit 1
}
cd "$REPO_ROOT"

# Mapea prefijo de ID a archivo del pilar.
map_fuente_to_file() {
  local fuente="$1"
  case "$fuente" in
    P1-*) echo "docs/pilares/01-fundamentos-cognitivos.md" ;;
    P2-ficha-*)
      for f in docs/casos-de-exito/tutoriales-tecnicos.md \
               docs/casos-de-exito/divulgacion-corta.md \
               docs/casos-de-exito/onboarding-corporativo.md; do
        if grep -q "\[$fuente\]" "$f" 2>/dev/null; then
          echo "$f"
          return
        fi
      done
      echo ""
      ;;
    P2-*) echo "docs/pilares/02-tendencias-y-casos.md" ;;
    P3-*) echo "docs/pilares/03-herramientas.md" ;;
    *) echo "" ;;
  esac
}

STALE_COUNT=0
MISSING_COUNT=0
INLINE_MISSING_COUNT=0

while IFS= read -r brief; do
  sync_date=$(awk '/^sync:/ {print $2; exit}' "$brief" 2>/dev/null || echo "")
  if [[ -z "$sync_date" ]]; then
    echo "WARN: $brief sin frontmatter sync:" >&2
    continue
  fi

  # Extraer bloque fuentes: del frontmatter
  fuentes=$(awk '
    /^fuentes:/ { in_fuentes=1; next }
    /^[a-z]+:/ && in_fuentes { exit }
    in_fuentes && /^  -/ { gsub(/^  - /,""); gsub(/ +#.*$/,""); print }
  ' "$brief")

  # Cross-check: IDs citados inline en el cuerpo deben estar en fuentes:
  # (Detecta drift opuesto: cuerpo cita algo que frontmatter no declara,
  # lo que rompe la detección de drift para ese ID.)
  body_ids=$(awk 'BEGIN{in_front=0; dashes=0}
    /^---$/ { dashes++; if (dashes==2) in_front=1; next }
    in_front { print }
  ' "$brief" | grep -oE "\[P[123]-[^]]+\]" | tr -d '[]' | sort -u)

  front_ids=$(echo "$fuentes" | sort -u)

  while IFS= read -r bid; do
    [[ -z "$bid" ]] && continue
    if ! echo "$front_ids" | grep -qxF "$bid"; then
      echo "WARN: $brief cita [$bid] inline pero no lo declara en fuentes:"
      INLINE_MISSING_COUNT=$((INLINE_MISSING_COUNT + 1))
    fi
  done <<< "$body_ids"

  # Verificación de drift por fuente declarada
  while IFS= read -r fuente; do
    [[ -z "$fuente" ]] && continue
    pilar_file=$(map_fuente_to_file "$fuente")
    if [[ -z "$pilar_file" ]]; then
      echo "WARN: $brief cita $fuente — pilar no mapeado" >&2
      continue
    fi
    if [[ ! -f "$pilar_file" ]]; then
      echo "WARN: $brief cita $fuente en $pilar_file — archivo no existe" >&2
      continue
    fi

    # Validar que el ID existe en el archivo citado
    line=$(grep -n "\[$fuente\]" "$pilar_file" 2>/dev/null | head -1 | cut -d: -f1)
    if [[ -z "$line" ]]; then
      echo "WARN: $brief cita $fuente — ID no encontrado en $pilar_file"
      MISSING_COUNT=$((MISSING_COUNT + 1))
      continue
    fi

    # Drift per-line: última fecha de commit que tocó ESTA línea específica
    last_edit=$(git log -1 --format=%cs -L "$line,+1:$pilar_file" 2>/dev/null | head -1 || echo "")
    [[ -z "$last_edit" ]] && continue

    if [[ "$last_edit" > "$sync_date" ]]; then
      echo "STALE: $brief cita $fuente ($pilar_file:$line editado $last_edit, sync $sync_date)"
      STALE_COUNT=$((STALE_COUNT + 1))
    fi
  done <<< "$fuentes"
done < <(find docs/briefs -type f -name '*.md' 2>/dev/null | sort)

echo ""
echo "Total briefs stale: $STALE_COUNT"
echo "Total IDs no encontrados en pilar: $MISSING_COUNT"
echo "Total IDs inline no declarados en fuentes: $INLINE_MISSING_COUNT"
exit 0
