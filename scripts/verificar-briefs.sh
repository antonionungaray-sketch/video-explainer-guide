#!/usr/bin/env bash
# verificar-briefs.sh — detecta drift entre briefs y pilares.
#
# Para cada brief en docs/briefs/**/*.md, compara su `sync:` con la fecha
# del último commit que tocó cada sección del pilar listada en `fuentes:`.
# Reporta briefs potencialmente stale.
#
# Zero-dependency: bash + git + grep + awk.
# Sale con código 0 siempre (es reporte, no gate). Código 1 solo si error.

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
      # Buscar en los 3 archivos de fichas
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

    # Última fecha de commit que tocó este archivo (proxy: cualquier cambio)
    last_edit=$(git log -1 --format=%cs -- "$pilar_file" 2>/dev/null || echo "")
    [[ -z "$last_edit" ]] && continue

    if [[ "$last_edit" > "$sync_date" ]]; then
      echo "STALE: $brief cita $fuente ($pilar_file editado $last_edit, sync $sync_date)"
      STALE_COUNT=$((STALE_COUNT + 1))
    fi
  done <<< "$fuentes"
done < <(find docs/briefs -type f -name '*.md' 2>/dev/null | sort)

echo ""
echo "Total briefs stale: $STALE_COUNT"
exit 0
