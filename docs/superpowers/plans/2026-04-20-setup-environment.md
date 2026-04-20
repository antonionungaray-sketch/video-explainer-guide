# Setup Environment + Renombrado de Skills Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Hacer el plugin `video-explainer-guide` portable entre OS vía perfil de entorno persistente (`setup-environment`) que los skills de etapa leen para filtrar recomendaciones de herramientas; más un fallback a WebSearch que cierra el ciclo incorporando nuevas herramientas al catálogo; más el renombrado colateral de los 3 skills de mantenimiento a slugs en inglés.

**Architecture:** Skills markdown-only (sin runtime), consume briefs que citan Pilar 3. Añadimos metadata estructurada por herramienta en Pilar 3 (bloque `<!-- meta: <slug> -->` indented debajo de cada bullet), un skill nuevo `setup-environment` que construye un perfil global (`~/.claude/video-explainer/profile.md`) con override opcional por proyecto (`./video-explainer-profile.md`), y un Paso 0.5 compartido en los 4 skills de etapa (concept/record/edit/publish) que filtra las herramientas candidatas contra el perfil y dispara WebSearch si no quedan candidatos.

**Tech Stack:** Markdown puro, YAML frontmatter, bash POSIX para scripts de validación, WebSearch/WebFetch para fallback externo. No hay código ejecutable más allá de scripts en `scripts/`.

**Spec:** [docs/superpowers/specs/2026-04-20-setup-environment-design.md](../specs/2026-04-20-setup-environment-design.md)

---

## File Structure

**Skills a renombrar (Fase A):**
- `skills/actualizar-herramientas/` → `skills/update-tools/`
- `skills/actualizar-tendencias/` → `skills/update-trends/`
- `skills/sincronizar-briefs/` → `skills/sync-briefs/`

**Archivos a modificar (todas las fases):**
- `docs/pilares/03-herramientas.md` — metadata estructurada por herramienta (Fase B)
- `skills/concept-explainer/SKILL.md` — Paso 0.5 (Fase D)
- `skills/record-explainer/SKILL.md` — Paso 0.5 (Fase D)
- `skills/edit-explainer/SKILL.md` — Paso 0.5 (Fase D)
- `skills/publish-explainer/SKILL.md` — Paso 0.5 (Fase D)
- `skills/create-explainer/SKILL.md` — mención opcional a setup-environment (Fase D)
- `skills/update-tools/SKILL.md` — acepta payload estructurado (Fase E)
- `CLAUDE.md` — nombres de skills nuevos + arquitectura del perfil (Fases A+F)
- `ROADMAP.md` — cerrar fase (Fase F)
- `.claude-plugin/plugin.json` — bump a 1.2.0 (Fase F)
- `.claude-plugin/marketplace.json` — bump a 1.2.0 (Fase F)

**Archivos a crear:**
- `skills/setup-environment/SKILL.md` — skill nuevo (Fase C)
- `scripts/validar-metadata-pilar3.sh` — validación de integridad de metadata (Fase B)

**Archivos que se consultan (read-only):**
- `docs/pilares/03-herramientas.md` (para mapping)
- `docs/briefs/*/` (para confirmar que citas `[P3-*]` no cambian)
- `scripts/verificar-briefs.sh` (no se modifica, se ejecuta)
- `scripts/regenerar-vistas.sh` (no se modifica, se ejecuta)

---

## Fase A — Renombrado de skills de mantenimiento

**Criterio de done:**
- `grep -r "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" .` devuelve 0 hits en código (ignorando changelog/git history).
- Los 3 skills responden bajo sus nombres nuevos sin errores.
- `CLAUDE.md` actualizado.

### Task A1: Renombrar carpeta `actualizar-herramientas` → `update-tools` y actualizar frontmatter

**Files:**
- Rename: `skills/actualizar-herramientas/` → `skills/update-tools/`
- Modify: `skills/update-tools/SKILL.md` (frontmatter + cuerpo donde se menciona a sí mismo)

- [ ] **Step 1: Renombrar la carpeta**

```bash
cd /home/antonio/Proyectos_local/video-explainer-guide
git mv skills/actualizar-herramientas skills/update-tools
```

- [ ] **Step 2: Actualizar frontmatter del SKILL.md**

Leer `skills/update-tools/SKILL.md`. Cambiar:

```yaml
---
name: actualizar-herramientas
description: "Use when the user wants to refresh, update, or revisit the tools knowledge layer (pilar 3) of the video-explainer-guide. Busca releases, deprecations y alternativas nuevas, y actualiza el documento con aprobación del usuario."
---
```

Por:

```yaml
---
name: update-tools
description: "Use when the user wants to refresh, update, or revisit the tools knowledge layer (pilar 3) of the video-explainer-guide. Busca releases, deprecations y alternativas nuevas, y actualiza el documento con aprobación del usuario. Also accepts structured payloads from setup-environment's external fallback to incorporate newly-discovered tools with full ficha metadata."
---
```

- [ ] **Step 3: Actualizar referencia auto-referencial en el cuerpo**

En el mismo archivo, buscar:

```
el skill `actualizar-herramientas` busca releases
```

Y su equivalente en el cuerpo (ver línea ~7 y ~180 del Pilar 3 también). En el SKILL.md auto-referencias: cambiar cualquier mención `actualizar-herramientas` → `update-tools`.

- [ ] **Step 4: Verificar que no queda referencia vieja en la carpeta renombrada**

```bash
grep -rn "actualizar-herramientas" skills/update-tools/
```

Expected: 0 hits.

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "refactor(skills): rename actualizar-herramientas to update-tools"
```

### Task A2: Renombrar carpeta `actualizar-tendencias` → `update-trends`

**Files:**
- Rename: `skills/actualizar-tendencias/` → `skills/update-trends/`
- Modify: `skills/update-trends/SKILL.md` (frontmatter + cuerpo)

- [ ] **Step 1: Renombrar la carpeta**

```bash
git mv skills/actualizar-tendencias skills/update-trends
```

- [ ] **Step 2: Actualizar frontmatter del SKILL.md**

Leer `skills/update-trends/SKILL.md` y cambiar el campo `name:` en el frontmatter:

```yaml
name: actualizar-tendencias
```

Por:

```yaml
name: update-trends
```

Ajustar el `description:` si menciona el nombre viejo.

- [ ] **Step 3: Actualizar referencias auto-referenciales en el cuerpo**

Buscar menciones `actualizar-tendencias` dentro del archivo y cambiarlas a `update-trends`.

- [ ] **Step 4: Verificar carpeta limpia**

```bash
grep -rn "actualizar-tendencias" skills/update-trends/
```

Expected: 0 hits.

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "refactor(skills): rename actualizar-tendencias to update-trends"
```

### Task A3: Renombrar carpeta `sincronizar-briefs` → `sync-briefs`

**Files:**
- Rename: `skills/sincronizar-briefs/` → `skills/sync-briefs/`
- Modify: `skills/sync-briefs/SKILL.md`

- [ ] **Step 1: Renombrar la carpeta**

```bash
git mv skills/sincronizar-briefs skills/sync-briefs
```

- [ ] **Step 2: Actualizar frontmatter y referencias en el SKILL.md**

Cambiar `name: sincronizar-briefs` → `name: sync-briefs` en frontmatter.
Cambiar todas las menciones `sincronizar-briefs` en el cuerpo → `sync-briefs`.

- [ ] **Step 3: Verificar carpeta limpia**

```bash
grep -rn "sincronizar-briefs" skills/sync-briefs/
```

Expected: 0 hits.

- [ ] **Step 4: Commit**

```bash
git add -A
git commit -m "refactor(skills): rename sincronizar-briefs to sync-briefs"
```

### Task A4: Actualizar referencias cruzadas entre skills

Los 3 skills renombrados se citan unos a otros (ej. `update-tools` recomienda invocar `sync-briefs` al final). Corregir.

**Files:**
- Modify: `skills/update-tools/SKILL.md`
- Modify: `skills/update-trends/SKILL.md`
- Modify: `skills/sync-briefs/SKILL.md`
- Modify: `skills/create-explainer/SKILL.md` (si menciona alguno)

- [ ] **Step 1: Mapear referencias cruzadas**

```bash
grep -rn "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" skills/
```

Expected: lista de archivos + líneas donde aparece algún nombre viejo. Ejemplo esperado en `skills/update-tools/SKILL.md` línea ~59: `> "...invoca la skill sincronizar-briefs."`

- [ ] **Step 2: Corregir cada referencia**

Para cada hit del paso 1:
- `actualizar-herramientas` → `update-tools`
- `actualizar-tendencias` → `update-trends`
- `sincronizar-briefs` → `sync-briefs`

Usar `Edit` tool por archivo. Si el texto aparece varias veces en un mismo archivo, usar `replace_all: true`.

- [ ] **Step 3: Verificar 0 hits en skills/**

```bash
grep -rn "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" skills/
```

Expected: 0 hits.

- [ ] **Step 4: Commit**

```bash
git add skills/
git commit -m "refactor(skills): update cross-references to renamed maintenance skills"
```

### Task A5: Actualizar CLAUDE.md con nombres nuevos

**Files:**
- Modify: `CLAUDE.md`

- [ ] **Step 1: Identificar las menciones**

```bash
grep -n "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" CLAUDE.md
```

Expected: varias líneas (al menos en la sección "Skills layout" y en "Working on this repo").

- [ ] **Step 2: Reemplazar cada ocurrencia**

Usar `Edit` con `replace_all: true` para cada nombre. Ejemplo de cambio:

Antes (línea ~~100 de CLAUDE.md):
```
`actualizar-tendencias` / `actualizar-herramientas` — mantenimiento de pilares 2 y 3. Tras aplicar cambios, cierran llamando a `scripts/verificar-briefs.sh` y sugieren `sincronizar-briefs` si hay stale.
```

Después:
```
`update-trends` / `update-tools` — mantenimiento de pilares 2 y 3. Tras aplicar cambios, cierran llamando a `scripts/verificar-briefs.sh` y sugieren `sync-briefs` si hay stale.
```

- [ ] **Step 3: Verificar 0 hits en CLAUDE.md**

```bash
grep -n "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" CLAUDE.md
```

Expected: 0 hits.

- [ ] **Step 4: Commit**

```bash
git add CLAUDE.md
git commit -m "docs(claude-md): update skill names to English slugs"
```

### Task A6: Auditar ROADMAP.md, Pilar 3, y otros docs

**Files:**
- Modify: `ROADMAP.md` (si tiene menciones)
- Modify: `docs/pilares/03-herramientas.md` (menciona `actualizar-herramientas` en prefacio)
- Modify: otros docs en `docs/` que mencionen los skills viejos

- [ ] **Step 1: Mapa de menciones fuera de skills/ y CLAUDE.md**

```bash
grep -rn "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" \
  --include="*.md" \
  --exclude-dir=skills --exclude-dir=.git --exclude-dir=node_modules \
  . | grep -v CLAUDE.md | grep -v "superpowers/specs\|superpowers/plans"
```

Expected: al menos `docs/pilares/03-herramientas.md` líneas 7 y 180 (prefacio y "Fuentes"). Posiblemente `ROADMAP.md`.

Nota: excluimos `docs/superpowers/specs/` y `docs/superpowers/plans/` — esos son artefactos de planificación congelados y no deben reescribirse.

- [ ] **Step 2: Corregir cada ocurrencia**

Para cada archivo del paso 1, abrir con `Edit` y reemplazar los 3 nombres viejos por los nuevos.

- [ ] **Step 3: Verificar fuera de skills/, CLAUDE.md, y superpowers/**

```bash
grep -rn "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" \
  --include="*.md" \
  --exclude-dir=skills --exclude-dir=.git --exclude-dir=node_modules \
  . | grep -v CLAUDE.md | grep -v "superpowers/specs\|superpowers/plans"
```

Expected: 0 hits.

- [ ] **Step 4: Commit**

```bash
git add -A
git commit -m "docs: update skill name references across repo docs"
```

### Task A7: Smoke test — invocar cada skill renombrado

- [ ] **Step 1: Listar los skills disponibles**

Ejecutar en Claude Code:

```
/plugin installed-skills
```

O desde shell:

```bash
ls skills/
```

Expected stdout: incluye `update-tools`, `update-trends`, `sync-briefs`. No incluye los nombres viejos.

- [ ] **Step 2: Invocar `update-tools` en dry-run**

El usuario invoca manualmente en Claude Code: `/update-tools` (o el equivalente). El skill debe cargar sin errores (el prompt de descripción aparece).

Si falla: revisar frontmatter y estructura del SKILL.md.

- [ ] **Step 3: Smoke test idem para update-trends y sync-briefs**

Invocar cada uno. Verificar que cargan.

Nota: este test se confirma con un humano en el loop (Antonio). No se automatiza.

---

## Fase B — Metadata estructurada en Pilar 3

**Criterio de done:**
- Cada bullet de herramienta en `docs/pilares/03-herramientas.md` tiene un bloque `<!-- meta: <slug> -->` con campos válidos.
- `scripts/validar-metadata-pilar3.sh` corre sin errores.
- `scripts/verificar-briefs.sh --strict` sigue pasando (IDs de sección preservados).
- `scripts/regenerar-vistas.sh` corre sin errores.

### Task B1: Crear script `scripts/validar-metadata-pilar3.sh`

**Files:**
- Create: `scripts/validar-metadata-pilar3.sh`

- [ ] **Step 1: Escribir el script**

Contenido completo (todo este bloque va al archivo):

```bash
#!/usr/bin/env bash
# validar-metadata-pilar3.sh — verifica que cada herramienta en docs/pilares/03-herramientas.md
# tenga un bloque <!-- meta: <slug> --> con los campos requeridos.
#
# Exit codes:
#   0 — todos los bullets tienen metadata válida
#   1 — al menos un bullet no tiene metadata, o metadata malformada

set -euo pipefail

PILAR="docs/pilares/03-herramientas.md"

if [ ! -f "$PILAR" ]; then
  echo "ERROR: $PILAR no existe" >&2
  exit 2
fi

# Campos obligatorios en cada bloque meta
CAMPOS_OBLIGATORIOS=(plataformas licencia modo)

# Encuentra líneas que son bullets de herramienta (empiezan con "- **Nombre**")
# y verifica que tengan un bloque meta asociado en las siguientes 12 líneas.

errores=0
total_bullets=0
total_con_meta=0

awk '
  /^- \*\*[^*]+\*\*/ {
    # Es un bullet de herramienta
    print "BULLET:" NR ":" $0
    en_bullet=1
    meta_encontrado=0
    next
  }
  /<!-- meta: [a-z0-9-]+ -->/ {
    if (en_bullet) {
      print "META:" NR ":" $0
      meta_encontrado=1
    }
  }
  /^- / || /^##/ || /^###/ {
    # Nuevo bullet o sección — cierra el anterior
    if (en_bullet && !meta_encontrado) {
      print "FALTA_META:" NR
    }
    en_bullet=0
  }
' "$PILAR" | while IFS=: read -r tipo linea resto; do
  case "$tipo" in
    BULLET) total_bullets=$((total_bullets+1)); echo "Bullet en línea $linea: $resto" ;;
    META) total_con_meta=$((total_con_meta+1)) ;;
    FALTA_META) errores=$((errores+1)); echo "ERROR: bullet sin meta cerca de línea $linea" >&2 ;;
  esac
done

echo "Total bullets: $total_bullets" >&2
echo "Con meta: $total_con_meta" >&2
echo "Errores: $errores" >&2

if [ "$errores" -gt 0 ]; then
  exit 1
fi

echo "OK: todas las herramientas tienen metadata válida" >&2
exit 0
```

**Nota importante:** este script usa un AWK pipeline que puede no ser 100% robusto con bullets multi-línea. La regla operativa para este plan es: un bloque meta DEBE ir en las 12 líneas siguientes al bullet, indented con 2 espacios o como sub-lista del propio bullet. Ver formato canónico en Task B2.

- [ ] **Step 2: Hacerlo ejecutable**

```bash
chmod +x scripts/validar-metadata-pilar3.sh
```

- [ ] **Step 3: Correrlo sobre el Pilar 3 actual (pre-migración)**

```bash
bash scripts/validar-metadata-pilar3.sh
```

Expected: exit 1 con muchos "FALTA_META" (el Pilar aún no tiene metadata). Eso es **esperado** en este punto. El script queda en su lugar como guard para las siguientes tareas.

- [ ] **Step 4: Commit**

```bash
git add scripts/validar-metadata-pilar3.sh
git commit -m "feat(scripts): add pilar3 metadata validator"
```

### Task B2: Definir formato canónico de bloque meta (documentar en el Pilar 3)

**Files:**
- Modify: `docs/pilares/03-herramientas.md` (prefacio)

- [ ] **Step 1: Agregar subsección "Formato de metadata" al inicio del documento**

Insertar después del bloque "Frescura" (línea ~20), antes del primer `## Idea → Guión`:

```markdown
---

## Formato de metadata por herramienta

Cada bullet de herramienta lleva un bloque `<!-- meta: <slug> -->` indented debajo con los siguientes campos. El slug es un identificador kebab-case único dentro de la sección (ej. `davinci-resolve` bajo `[P3-edicion-editores]`). Los skills de etapa usan estos campos para filtrar recomendaciones según el perfil de entorno del usuario (ver skill `setup-environment`).

**Campos obligatorios:**
- `plataformas: [linux, mac, windows, wsl, cloud]` — lista de plataformas soportadas (`cloud` para SaaS puros).
- `licencia: open-source | free-tier | paid | subscription` — modelo de licencia.
- `modo: local | cloud | híbrido` — dónde se ejecuta el trabajo real.

**Campos opcionales:**
- `hardware-min:` — sólo cuando la herramienta tiene requisitos restrictivos. Ej: `{gpu: any-discrete, ram-gb: 16}`.
- `equivalentes:` — lista de slugs (de esta misma sección u otras) que pueden sustituir a esta herramienta en plataformas donde no corre. Ej: `[premiere, kdenlive]`.

**Ejemplo:**

```markdown
- **DaVinci Resolve** — gratuito (versión Studio de pago), nivel profesional. Requiere GPU competente.
  <!-- meta: davinci-resolve -->
  - plataformas: [linux, mac, windows]
  - licencia: free-tier
  - modo: local
  - hardware-min: {gpu: any-discrete, ram-gb: 16}
  - equivalentes: [premiere, kdenlive, capcut]
```

**Validación:** `bash scripts/validar-metadata-pilar3.sh` reporta errores si falta metadata o tiene campos malformados.

---
```

- [ ] **Step 2: Verificar que el formato renderiza correctamente**

```bash
head -80 docs/pilares/03-herramientas.md
```

Leer a ojo — el bloque de formato debe aparecer antes de `## Idea → Guión`.

- [ ] **Step 3: Commit**

```bash
git add docs/pilares/03-herramientas.md
git commit -m "docs(pilar3): document metadata block format for tools"
```

### Task B3: Agregar metadata a sección "Idea → Guión" (≈5 herramientas)

**Files:**
- Modify: `docs/pilares/03-herramientas.md` líneas ~24-36

- [ ] **Step 1: Leer la sección actual**

Leer líneas 24-36 de `docs/pilares/03-herramientas.md`. Las herramientas son:
- Claude / GPT
- Notion / Obsidian / plain Markdown
- Perplexity / Claude con WebSearch
- Google Scholar

Nota: los bullets tipo "A / B / C" deben separarse en bullets individuales si cada una tiene metadata distinta, O mantenerse agrupados si comparten metadata. Regla: si los atributos (plataformas, licencia, modo) son idénticos, un solo bullet con slug compuesto (ej. `notion-obsidian-markdown`). Si difieren, separarlos.

- [ ] **Step 2: Reemplazar la sección**

Usar `Edit` para cambiar:

```markdown
### Asistentes de escritura [P3-idea-guion-asistentes]
- **Claude / GPT** — generación y refinado de guiones, brainstorm de hooks, conversión bullet→prosa hablada. *Status: estable. Verificado: 2026-04-17.*
- **Notion / Obsidian / plain Markdown** — almacenamiento y versionado de guiones. Markdown es el formato más portátil y diff-friendly.

### Investigación y validación [P3-idea-guion-investigacion]
- **Perplexity / Claude con WebSearch** — investigación rápida con citaciones.
- **Google Scholar** — verificar claims científicos antes de afirmar algo en un explainer.
```

Por:

```markdown
### Asistentes de escritura [P3-idea-guion-asistentes]
- **Claude / GPT** — generación y refinado de guiones, brainstorm de hooks, conversión bullet→prosa hablada. *Status: estable. Verificado: 2026-04-17.*
  <!-- meta: claude-gpt -->
  - plataformas: [linux, mac, windows, cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: []
- **Notion** — almacenamiento y versionado de guiones en cloud con UI rica.
  <!-- meta: notion -->
  - plataformas: [linux, mac, windows, cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [obsidian, plain-markdown]
- **Obsidian** — almacenamiento local de guiones en Markdown con graph view y plugins.
  <!-- meta: obsidian -->
  - plataformas: [linux, mac, windows]
  - licencia: free-tier
  - modo: local
  - equivalentes: [notion, plain-markdown]
- **Plain Markdown** — archivos `.md` en cualquier editor. Formato más portátil y diff-friendly.
  <!-- meta: plain-markdown -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - equivalentes: [obsidian, notion]

### Investigación y validación [P3-idea-guion-investigacion]
- **Perplexity** — búsqueda web con síntesis y citaciones automáticas.
  <!-- meta: perplexity -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [claude-websearch]
- **Claude con WebSearch** — investigación con tool use, citaciones inline.
  <!-- meta: claude-websearch -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [perplexity]
- **Google Scholar** — verificar claims científicos antes de afirmar algo en un explainer.
  <!-- meta: google-scholar -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: []
```

- [ ] **Step 3: Verificar que los briefs que citan esta sección no se rompen**

```bash
grep -n "P3-idea-guion" docs/briefs/**/*.md
```

Expected: las citas siguen apuntando a `P3-idea-guion-asistentes` y `P3-idea-guion-investigacion` (IDs de sección). Los nuevos slugs internos (`claude-gpt`, `notion`, etc.) NO rompen estas citas.

- [ ] **Step 4: Commit**

```bash
git add docs/pilares/03-herramientas.md
git commit -m "feat(pilar3): add structured metadata to Idea→Guión tools"
```

### Task B4: Agregar metadata a sección "Pre-producción y grabación" (≈10 herramientas)

**Files:**
- Modify: `docs/pilares/03-herramientas.md` sección `[P3-preprod]` (líneas ~40-64)

- [ ] **Step 1: Leer la sección actual**

Leer `docs/pilares/03-herramientas.md` líneas 40-64. Sub-secciones:
- Captura de pantalla y cámara: OBS Studio, Loom, Riverside, Descript Recorder, Streamlabs Desktop
- Audio: Shure MV7, Samson Q9U, Rode PodMic USB, Audacity, Krisp, NVIDIA Broadcast
- Iluminación: genérico (no es herramienta software — se deja sin metadata, marcado como N/A en el bullet).
- Teleprompter: Descript, BIGVU

- [ ] **Step 2: Aplicar metadata a cada bullet**

Seguir el patrón de Task B3. Ejemplos clave:

```markdown
- **OBS Studio** — open source, cross-platform, scenes, encoders por hardware. Status: estable, líder de facto en captura.
  <!-- meta: obs-studio -->
  - plataformas: [linux, mac, windows]
  - licencia: open-source
  - modo: local
  - equivalentes: [streamlabs, loom, riverside]
- **Loom** — capturas rápidas con sincronización a cloud.
  <!-- meta: loom -->
  - plataformas: [mac, windows, cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [riverside, descript-recorder]
- **Riverside** — grabación multi-participante con local recording.
  <!-- meta: riverside -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [squadcast, loom]
- **Descript Recorder** — captura integrada con Descript para edit by transcription.
  <!-- meta: descript-recorder -->
  - plataformas: [mac, windows]
  - licencia: free-tier
  - modo: híbrido
  - equivalentes: [loom]
- **Streamlabs Desktop** — fork de OBS con UI amigable.
  <!-- meta: streamlabs -->
  - plataformas: [mac, windows]
  - licencia: free-tier
  - modo: local
  - equivalentes: [obs-studio]
```

Para Audio, separar los mics individualmente (o agrupar si tienen mismas plataformas). Shure MV7, Samson Q9U, Rode PodMic USB son hardware USB — `plataformas: [linux, mac, windows]`, `licencia: paid`, `modo: local`. Usar slug `shure-mv7`, `samson-q9u`, `rode-podmic-usb`.

Para Audacity:

```markdown
- **Audacity** — edición y limpieza de audio offline, gratuito.
  <!-- meta: audacity -->
  - plataformas: [linux, mac, windows]
  - licencia: open-source
  - modo: local
  - equivalentes: []
```

Para Krisp / NVIDIA Broadcast:

```markdown
- **Krisp** — supresión de ruido en vivo con IA.
  <!-- meta: krisp -->
  - plataformas: [mac, windows]
  - licencia: free-tier
  - modo: local
  - equivalentes: [nvidia-broadcast]
- **NVIDIA Broadcast** — supresión de ruido + efectos vía GPU NVIDIA RTX.
  <!-- meta: nvidia-broadcast -->
  - plataformas: [windows]
  - licencia: free-tier
  - modo: local
  - hardware-min: {gpu: NVIDIA-RTX}
  - equivalentes: [krisp]
```

Para Iluminación: dejar el bullet de "Cualquier panel LED bicolor con difusor" sin bloque meta (es hardware genérico, no software). Agregar un comentario inline:

```markdown
- **Cualquier panel LED bicolor con difusor** — el principio importa más que la marca: luz suave, frontal, balance de blancos consistente.
  <!-- meta: N/A (hardware genérico, no software filtrable por OS) -->
```

Ajustar el script `validar-metadata-pilar3.sh` para aceptar bloques `<!-- meta: N/A ... -->` como válidos (ver Task B1 si requiere ajuste — preferible agregar una pattern `<!-- meta: N\/A` en el script como escape).

Para Teleprompter:

```markdown
- **Descript — teleprompter + Eye Contact AI** — teleprompter integrado + corrección de mirada en post.
  <!-- meta: descript-teleprompter -->
  - plataformas: [mac, windows]
  - licencia: subscription
  - modo: híbrido
  - equivalentes: [bigvu]
- **BIGVU** — mobile-first, teleprompter + Eye Contact Fix + captions + Brand Kit.
  <!-- meta: bigvu -->
  - plataformas: [mac, windows, cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [descript-teleprompter]
```

- [ ] **Step 3: Correr validador y verificador de briefs**

```bash
bash scripts/validar-metadata-pilar3.sh
bash scripts/verificar-briefs.sh --strict
```

Expected:
- `validar-metadata-pilar3.sh`: menos errores que antes (sección Pre-producción ahora con meta), pero aún errores en secciones futuras. OK.
- `verificar-briefs.sh --strict`: exit 0 (IDs de sección preservados).

- [ ] **Step 4: Commit**

```bash
git add docs/pilares/03-herramientas.md
git commit -m "feat(pilar3): add metadata to Pre-producción tools"
```

### Task B5: Agregar metadata a sección "Edición y post" (≈17 herramientas)

**Files:**
- Modify: `docs/pilares/03-herramientas.md` sección `[P3-edicion]` (líneas ~66-100)

- [ ] **Step 1: Aplicar metadata siguiendo patrón de B4**

Sub-secciones: Editores de video, Composición programática, Post-procesado puntual, Subtítulos, Voiceover IA.

Ejemplos clave (aplicar a TODAS las herramientas listadas):

```markdown
- **DaVinci Resolve** — gratuito (versión Studio de pago), nivel profesional.
  <!-- meta: davinci-resolve -->
  - plataformas: [linux, mac, windows]
  - licencia: free-tier
  - modo: local
  - hardware-min: {gpu: any-discrete, ram-gb: 16}
  - equivalentes: [kdenlive, premiere, capcut]
- **Kdenlive** — open source, multiplataforma, trabaja bien sin GPU dedicada.
  <!-- meta: kdenlive -->
  - plataformas: [linux, mac, windows]
  - licencia: open-source
  - modo: local
  - equivalentes: [davinci-resolve]
- **Adobe Premiere Pro** — estándar industrial, suscripción mensual.
  <!-- meta: premiere -->
  - plataformas: [mac, windows]
  - licencia: subscription
  - modo: local
  - equivalentes: [davinci-resolve, kdenlive]
- **CapCut Desktop** — edición rápida con plantillas.
  <!-- meta: capcut -->
  - plataformas: [mac, windows]
  - licencia: free-tier
  - modo: local
  - equivalentes: [davinci-resolve]
- **Descript** — edición por transcripción.
  <!-- meta: descript-edit -->
  - plataformas: [mac, windows]
  - licencia: subscription
  - modo: híbrido
  - equivalentes: []
```

Para composición programática (Remotion, Motion Canvas, Revideo, HyperFrames, Manim) — todas cross-platform (Node.js / Python), categorizar bien:

```markdown
- **Remotion** — videos como código React.
  <!-- meta: remotion -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: free-tier  # gratis personal, comercial paid ≥3 personas
  - modo: local
  - equivalentes: [motion-canvas, revideo]
- **Motion Canvas** — MIT, TypeScript con generator functions.
  <!-- meta: motion-canvas -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - equivalentes: [remotion, revideo]
- **Revideo** — MIT, fork de Motion Canvas con rendering headless.
  <!-- meta: revideo -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - equivalentes: [motion-canvas, remotion]
- **HyperFrames (HeyGen)** — Apache 2.0, HTML/CSS/JS para agentes IA.
  <!-- meta: hyperframes -->
  - plataformas: [linux, mac, windows, wsl, cloud]
  - licencia: open-source
  - modo: híbrido
  - equivalentes: [remotion]
- **Manim** — animación matemática Python.
  <!-- meta: manim -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - equivalentes: []
```

Post-procesado:

```markdown
- **FFmpeg** — cuchillo suizo.
  <!-- meta: ffmpeg -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - equivalentes: []
- **Handbrake** — frontend gráfico de FFmpeg.
  <!-- meta: handbrake -->
  - plataformas: [linux, mac, windows]
  - licencia: open-source
  - modo: local
  - equivalentes: [ffmpeg]
```

Subtítulos (Whisper, WhisperX, Aegisub, Subtitle Edit):

```markdown
- **Whisper (OpenAI)** — transcripción.
  <!-- meta: whisper -->
  - plataformas: [linux, mac, windows, wsl, cloud]
  - licencia: open-source
  - modo: local  # vía API es cloud; versión pip es local
  - hardware-min: {gpu: NVIDIA-CUDA-or-Metal}  # para velocidad
  - equivalentes: [whisperx]
- **WhisperX** — Whisper + diarization + word-level alignment.
  <!-- meta: whisperx -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - hardware-min: {gpu: NVIDIA-CUDA}
  - equivalentes: [whisper]
- **Aegisub** — editor de subtítulos SRT/ASS.
  <!-- meta: aegisub -->
  - plataformas: [linux, mac, windows]
  - licencia: open-source
  - modo: local
  - equivalentes: [subtitle-edit]
- **Subtitle Edit** — editor con buena UX.
  <!-- meta: subtitle-edit -->
  - plataformas: [windows]
  - licencia: open-source
  - modo: local
  - equivalentes: [aegisub]
```

Voiceover (ElevenLabs, Coqui, Piper):

```markdown
- **ElevenLabs** — voces realistas, clonación, Dubbing Studio.
  <!-- meta: elevenlabs -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [coqui-tts, piper]
- **Coqui TTS** — TTS open source local.
  <!-- meta: coqui-tts -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - hardware-min: {gpu: any-discrete}
  - equivalentes: [piper, elevenlabs]
- **Piper** — TTS lightweight local.
  <!-- meta: piper -->
  - plataformas: [linux, mac, windows, wsl]
  - licencia: open-source
  - modo: local
  - equivalentes: [coqui-tts]
```

- [ ] **Step 2: Correr validador**

```bash
bash scripts/validar-metadata-pilar3.sh
```

Expected: menos errores que antes, aún quedan errores en secciones de Publicación y Modalidades ampliadas.

- [ ] **Step 3: Commit**

```bash
git add docs/pilares/03-herramientas.md
git commit -m "feat(pilar3): add metadata to Edición y post tools"
```

### Task B6: Agregar metadata a sección "Publicación y medición" (≈9 herramientas)

**Files:**
- Modify: `docs/pilares/03-herramientas.md` sección `[P3-publicacion]` (líneas ~104-126)

- [ ] **Step 1: Aplicar metadata**

Ejemplos:

```markdown
- **YouTube** — ecosistema formativo maduro.
  <!-- meta: youtube -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [vimeo]
- **Vimeo** — alojamiento privado, transcoding premium.
  <!-- meta: vimeo -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [youtube]
- **Loom Library** — conocimiento interno corporativo.
  <!-- meta: loom-library -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: []
- **LMS corporativos (Synthesia, Articulate, TalentLMS, Moodle)** — tracking + evaluaciones.
  <!-- meta: lms-corporativos -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: []
- **YouTube Studio Analytics** — retention + APV + CTR.
  <!-- meta: youtube-studio-analytics -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: []
- **TubeBuddy** — SEO de video, A/B de thumbnails.
  <!-- meta: tubebuddy -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [vidiq]
- **VidIQ** — análogo a TubeBuddy.
  <!-- meta: vidiq -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [tubebuddy]
- **Hotjar / FullStory** — heatmaps sobre video embebido propio.
  <!-- meta: hotjar-fullstory -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: []
- **Figma** — composición rápida con plantillas.
  <!-- meta: figma -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [canva, photopea]
- **Canva** — composición rápida con plantillas.
  <!-- meta: canva -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [figma, photopea]
- **Photopea** — alternativa web gratuita a Photoshop.
  <!-- meta: photopea -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [figma, canva]
- **Generadores IA de imagen (Midjourney, DALL·E, Imagen)** — base para thumbnails creativos.
  <!-- meta: generadores-ia-imagen -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: []
```

- [ ] **Step 2: Correr validador**

```bash
bash scripts/validar-metadata-pilar3.sh
```

Expected: errores solo en Modalidades ampliadas.

- [ ] **Step 3: Commit**

```bash
git add docs/pilares/03-herramientas.md
git commit -m "feat(pilar3): add metadata to Publicación tools"
```

### Task B7: Agregar metadata a sección "Modalidades ampliadas" (≈20 herramientas)

**Files:**
- Modify: `docs/pilares/03-herramientas.md` sección `[P3-modalidades]` (líneas ~129-174)

- [ ] **Step 1: Aplicar metadata a las 4 sub-secciones**

Sub-secciones: Live streaming, Podcast audiovisual, Documental narrativo, Periodismo de datos.

Herramientas en Live streaming (OBS ya tiene meta desde B4 — no duplicar, agregar solo las nuevas):

```markdown
- **OBS Studio** — (ya listado en [P3-preprod-captura]). En contexto live: 2-3 escenas + transiciones + browser sources.
  <!-- meta: obs-studio-live -->
  - plataformas: [linux, mac, windows]
  - licencia: open-source
  - modo: local
  - equivalentes: [streamlabs]
- **Stream Deck (Elgato)** — controlador físico programable.
  <!-- meta: stream-deck -->
  - plataformas: [mac, windows]
  - licencia: paid  # es hardware con software bundled
  - modo: local
  - equivalentes: []
- **StreamYard** — SaaS multi-plataforma.
  <!-- meta: streamyard -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [restream]
- **Restream** — SaaS multi-destination.
  <!-- meta: restream -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [streamyard]
```

Podcast audiovisual (todos hardware/SaaS):

```markdown
- **Rodecaster Pro II** — consola hardware con 4 canales mic.
  <!-- meta: rodecaster-pro-2 -->
  - plataformas: [linux, mac, windows]  # hardware USB, driver universal
  - licencia: paid
  - modo: local
  - equivalentes: [zoom-h6]
- **Shure SM7B + Cloudlifter** — mic dinámico + preamp.
  <!-- meta: shure-sm7b-cloudlifter -->
  - plataformas: [linux, mac, windows]
  - licencia: paid
  - modo: local
  - equivalentes: []
- **Zoom H6 / H8** — grabador portátil.
  <!-- meta: zoom-h6-h8 -->
  - plataformas: [linux, mac, windows]
  - licencia: paid
  - modo: local
  - equivalentes: [rodecaster-pro-2]
- **Riverside.fm** — SaaS grabación multi-participante.
  <!-- meta: riverside-fm -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [squadcast]
- **SquadCast (Descript)** — análogo a Riverside.
  <!-- meta: squadcast -->
  - plataformas: [cloud]
  - licencia: subscription
  - modo: cloud
  - equivalentes: [riverside-fm]
```

Documental narrativo:

```markdown
- **DaVinci Resolve Studio** — NLE + Color + Fairlight + Neural Engine.
  <!-- meta: davinci-resolve-studio -->
  - plataformas: [linux, mac, windows]
  - licencia: paid
  - modo: local
  - hardware-min: {gpu: any-discrete, ram-gb: 32}
  - equivalentes: [davinci-resolve, premiere]
- **Pro Tools (Avid)** — DAW estándar cinematográfico.
  <!-- meta: pro-tools -->
  - plataformas: [mac, windows]
  - licencia: subscription
  - modo: local
  - equivalentes: []
- **iZotope RX** — restauración de audio.
  <!-- meta: izotope-rx -->
  - plataformas: [mac, windows]
  - licencia: paid
  - modo: local
  - equivalentes: []
- **Kyno / Post Haste / Adobe Bridge** — gestión de archivo y metadata.
  <!-- meta: kyno-posthaste-bridge -->
  - plataformas: [mac, windows]
  - licencia: paid
  - modo: local
  - equivalentes: []
```

Periodismo de datos:

```markdown
- **Flourish** — SaaS para charts y scrollytelling interactivos.
  <!-- meta: flourish -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [datawrapper]
- **Datawrapper** — charts publication-grade.
  <!-- meta: datawrapper -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: [flourish]
- **After Effects + Data-Driven Animation** — AE alimentado por JSON.
  <!-- meta: after-effects-data -->
  - plataformas: [mac, windows]
  - licencia: subscription
  - modo: local
  - equivalentes: [lottie]
- **Lottie (dotLottie)** — animación vectorial JSON.
  <!-- meta: lottie -->
  - plataformas: [linux, mac, windows, wsl, cloud]
  - licencia: open-source
  - modo: híbrido
  - equivalentes: []
- **Mapbox / Mapbox Studio** — mapas custom.
  <!-- meta: mapbox -->
  - plataformas: [cloud]
  - licencia: free-tier
  - modo: cloud
  - equivalentes: []
- **D3.js / Observable** — JS data viz programable.
  <!-- meta: d3-observable -->
  - plataformas: [linux, mac, windows, wsl, cloud]
  - licencia: open-source
  - modo: híbrido
  - equivalentes: []
```

- [ ] **Step 2: Correr validador**

```bash
bash scripts/validar-metadata-pilar3.sh
```

Expected: 0 errores (todos los bullets tienen meta), exit 0.

- [ ] **Step 3: Correr verificador de briefs**

```bash
bash scripts/verificar-briefs.sh --strict
```

Expected: exit 0 (IDs de sección preservados).

- [ ] **Step 4: Correr regenerador de vistas**

```bash
bash scripts/regenerar-vistas.sh
```

Expected: exit 0, algunos archivos en `docs/vistas-por-etapa/` pueden cambiar (mostrar diff pequeño).

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat(pilar3): add metadata to Modalidades ampliadas tools"
```

---

## Fase C — Skill `setup-environment`

**Criterio de done:**
- `skills/setup-environment/SKILL.md` existe con frontmatter válido y contenido completo.
- Invocación manual genera `~/.claude/video-explainer/profile.md` con frontmatter válido.
- Re-invocación detecta perfil existente y ofrece actualizar secciones.

### Task C1: Crear el esqueleto del skill

**Files:**
- Create: `skills/setup-environment/SKILL.md`

- [ ] **Step 1: Crear el directorio**

```bash
mkdir -p skills/setup-environment
```

- [ ] **Step 2: Crear SKILL.md con frontmatter y estructura completa**

Escribir el archivo `skills/setup-environment/SKILL.md` con el siguiente contenido:

````markdown
---
name: setup-environment
description: "Use when the user wants to configure or update their personal environment profile for the video-explainer-guide plugin — OS, preferences, hardware, and tools they already use. Creates or updates a persistent profile (global at ~/.claude/video-explainer/profile.md, with optional per-project override at ./video-explainer-profile.md) that other skills read to filter tool recommendations by platform. Re-invocable: supports partial updates of specific sections (hardware, tools, preferences)."
---

# Setup Environment — perfil de entorno del usuario

Construye y actualiza el perfil de entorno del usuario vía diálogo. El perfil dicta qué herramientas recomiendan los skills de etapa (`concept-explainer`, `record-explainer`, `edit-explainer`, `publish-explainer`) al consultar el catálogo de Pilar 3.

## Concepto — por qué existe este skill

El plugin `video-explainer-guide` recomienda herramientas concretas (editores, grabadores, VoIP, etc.) en cada etapa de producción. Sin información del entorno del usuario, las recomendaciones se apoyan en el catálogo completo — lo que significa sugerir a veces herramientas que no corren en el OS del usuario o que no encajan con su modelo de licencia/costo.

Este skill construye un perfil persistente del usuario que responde a 5 dimensiones:

1. **Plataforma** (OS, shell) — qué herramientas son binariamente compatibles.
2. **Preferencias** (open-source vs. paid, local vs. cloud, idioma UI) — qué encajan con el modelo mental del usuario.
3. **Restricciones** (conectividad, licencia corporativa, requisitos legales) — qué queda fuera aunque fuese técnicamente posible.
4. **Hardware** (RAM, GPU, mic, cámara, resolución, tableta gráfica) — qué herramientas puede correr con calidad.
5. **Herramientas ya elegidas por etapa** — qué no re-recomendar.

## Archivos del perfil

El skill escribe **uno o dos** archivos según el contexto:

- **Global por máquina** (siempre): `~/.claude/video-explainer/profile.md`. Se crea si no existe. No se commitea a ningún repo.
- **Override por proyecto** (opcional): `./video-explainer-profile.md` en el directorio de trabajo actual. Se crea solo si el usuario lo pide. Útil cuando un proyecto específico tiene restricciones distintas al resto del setup personal (ej. "este cliente exige licencia corporativa Adobe"). El override gana **campo por campo** sobre el global, no reemplaza el archivo completo.

## Formato del perfil

Frontmatter YAML + cuerpo libre:

```yaml
---
os: linux | mac | windows | wsl
shell: bash | zsh | pwsh | cmd
ram-gb: 16
gpu: "NVIDIA RTX 3070" | null
mic: "Shure SM7B" | null
camera: "Sony A7C" | null
monitor-res: "3840x2160" | null
tablet: true | false
licencia-preferida: open-source | free-tier | paid | subscription | cualquiera
modo-preferido: local | cloud | híbrido | cualquiera
conectividad: online | offline | intermitente
idioma-ui: es | en | ambos
herramientas-por-etapa:
  concepto: []
  guion: []
  grabacion: []
  edicion: []
  publicacion: []
restricciones-libres: []
actualizado: YYYY-MM-DD
version: 1
---

# Notas libres

(Cualquier detalle que no cabe en frontmatter estructurado.)
```

## Flujo

### Primera invocación — perfil no existe

1. **Detectar ausencia de perfil.** Verificar `~/.claude/video-explainer/profile.md`:

   ```bash
   test -f ~/.claude/video-explainer/profile.md && echo EXISTS || echo ABSENT
   ```

2. **Introducir el concepto al usuario** en 2-3 líneas: qué vas a construir y por qué.

3. **Diálogo por secciones.** Hacer preguntas en este orden, **una sección a la vez**, confirmando con el usuario antes de avanzar:

   **Sección 1 — Plataforma y shell:**
   - Correr el comando apropiado al OS para confirmar (no adivinar):
     - Si aparenta Unix: `uname -a && echo $SHELL`
     - Si aparenta Windows: `systeminfo | findstr /C:"OS Name" /C:"OS Version"` o `ver`
   - Confirmar con el usuario: "detecté Linux con zsh — ¿correcto?"

   **Sección 2 — Preferencias:**
   - Preguntar: "¿prefieres herramientas open-source, free-tier (con tier gratuito), paid (compra única), o subscription?"
   - Preguntar: "¿prefieres trabajar local, cloud, híbrido, o no tienes preferencia?"
   - Preguntar: "¿idioma de UI preferido?" (español / inglés / ambos)

   **Sección 3 — Restricciones:**
   - "¿Tienes restricciones de conectividad?" (online siempre / offline / intermitente)
   - "¿Hay licencias o reglas corporativas que afecten tu elección?" (texto libre, lista)
   - "¿Algo más que deba saber del contexto?" (texto libre, lista → restricciones-libres)

   **Sección 4 — Hardware:**
   - RAM: preguntar o correr `free -g` (Linux), `sysctl hw.memsize` (Mac), `wmic OS get TotalVisibleMemorySize` (Windows).
   - GPU: preguntar "¿tienes GPU discreta? ¿qué modelo?" — no intentar detectar (demasiado OS-específico).
   - Mic, cámara, monitor-res, tablet: preguntar sin detectar.

   **Sección 5 — Herramientas ya elegidas por etapa:**
   - Preguntar por cada etapa (concepto, guion, grabación, edición, publicación): "¿hay herramientas que ya sabes que vas a usar?"
   - Ofrecer sugerencias del Pilar 3 si el usuario no sabe.

4. **Mostrar resumen** del perfil construido como YAML. Pedir confirmación final.

5. **Escribir el archivo:**

   ```bash
   mkdir -p ~/.claude/video-explainer
   # Escribir el contenido al archivo profile.md
   ```

6. **Preguntar por override por proyecto:** "¿quieres crear también un override específico para este proyecto en `./video-explainer-profile.md`?" — si sí, repetir diálogo solo para las secciones a overridear.

7. **Cerrar con resumen:** "perfil guardado en `~/.claude/video-explainer/profile.md`. Cuando invoques `record-explainer`, `edit-explainer` o `publish-explainer`, tus recomendaciones se filtrarán según este perfil."

### Re-invocación — perfil ya existe

1. **Leer perfil actual** y mostrarlo al usuario en resumen: secciones + fecha de `actualizado`.

2. **Detectar staleness:** si `actualizado` tiene más de 180 días, flaggearlo:

   > "Tu perfil tiene 7 meses sin actualizar. Recomiendo revisar al menos la sección de hardware y herramientas."

3. **Preguntar qué actualizar:**
   - Todo el perfil (repetir diálogo completo)
   - Sólo una sección (plataforma / preferencias / restricciones / hardware / herramientas)
   - Sólo un campo específico (ej. "agregar una licencia corporativa nueva")
   - Nada (cerrar)

4. **Actualizar el/los campos elegidos** via diálogo.

5. **Escribir el archivo** con `actualizado: <fecha de hoy>` y `version: <N+1>`.

## Reglas firmes

- **No empaquetar scripts OS-específicos.** Claude Code corre el comando apropiado al OS que detecta en el entorno del usuario. El skill describe *qué preguntar* y *qué verificar*, pero la ejecución es adaptativa.
- **Español de México** en prosa y preguntas, consistente con el resto del plugin.
- **No asumir.** Si un dato no es verificable sin molestar al usuario, preguntar antes que adivinar. Si es verificable con un comando rápido, confirmar con el usuario después de correr.
- **El perfil es declarativo.** No verificar activamente que las herramientas listadas estén realmente instaladas (ej. no correr `which ffmpeg`). El usuario declara, el plugin confía.
- **Herramientas fuera del catálogo Pilar 3:** si el usuario menciona una herramienta que no está en `docs/pilares/03-herramientas.md`, avisar "esa herramienta no está en mi catálogo curado; puedes invocar `update-tools` para agregarla con ficha formal. De todos modos la guardo en tu perfil."

## Después del setup

- Si detectaste herramientas mencionadas que no están en Pilar 3, listarlas al final y ofrecer invocar `update-tools`.
- Sugerir al usuario: "puedes re-invocar `setup-environment` en cualquier momento para actualizar secciones."

````

- [ ] **Step 3: Smoke check — verificar frontmatter**

```bash
head -5 skills/setup-environment/SKILL.md
```

Expected: empieza con `---`, tiene `name: setup-environment` y un `description:` con texto claro.

- [ ] **Step 4: Commit**

```bash
git add skills/setup-environment/
git commit -m "feat(skills): add setup-environment for building user profile"
```

### Task C2: Smoke test — invocar `setup-environment` en una máquina limpia

- [ ] **Step 1: Asegurarse de que NO existe perfil previo**

```bash
ls ~/.claude/video-explainer/ 2>/dev/null || echo "no existe aún"
```

Si existe, hacer backup antes de probar: `mv ~/.claude/video-explainer ~/.claude/video-explainer.backup`.

- [ ] **Step 2: Invocar el skill (humano en el loop)**

Antonio invoca en Claude Code: `/setup-environment` o el equivalente.

Expected: el skill introduce el concepto, pregunta por plataforma (correr `uname -a`), y sigue con las 5 secciones.

- [ ] **Step 3: Verificar que el archivo se creó**

```bash
cat ~/.claude/video-explainer/profile.md
```

Expected: frontmatter YAML válido + cuerpo con notas libres. Campos `os`, `shell`, `ram-gb`, `licencia-preferida`, `modo-preferido`, `herramientas-por-etapa`, `actualizado`, `version` presentes.

- [ ] **Step 4: Re-invocar el skill**

Expected: detecta el perfil existente, muestra resumen, ofrece actualizar solo secciones específicas.

- [ ] **Step 5: Restaurar backup si aplica**

Si hiciste backup en Step 1: `mv ~/.claude/video-explainer.backup ~/.claude/video-explainer`.

---

## Fase D — Integración en skills de etapa

**Criterio de done:**
- Los 4 skills (concept, record, edit, publish) tienen **Paso 0.5** explícito.
- Los 4 skills tienen lógica de filtrado por perfil documentada.
- Los 4 skills tienen lógica de fallback externo con WebSearch documentada.
- `create-explainer` menciona a `setup-environment` como paso opcional pre-flujo.
- Smoke test: invocar `edit-explainer` con un perfil Windows filtra recomendaciones correctamente.

### Task D1: Definir el bloque estándar "Paso 0.5 + filtrado + fallback"

Este bloque se copia textualmente a los 4 skills de etapa en Task D2-D5. Redactarlo una sola vez aquí para DRY.

**Files:**
- No modifica archivos directamente. Define el texto canónico que las siguientes tareas aplican.

- [ ] **Step 1: Redactar el bloque canónico**

Guardar el siguiente texto en un archivo temporal `/tmp/paso-0-5-canonico.md` para referencia (no se commitea):

````markdown
## Paso 0.5 — Leer perfil de entorno

Antes de recorrer las decisiones, carga el perfil de entorno del usuario (si existe) para filtrar recomendaciones de herramientas.

### Carga del perfil

1. **Perfil global** (siempre que exista):

   ```bash
   test -f ~/.claude/video-explainer/profile.md && cat ~/.claude/video-explainer/profile.md
   ```

2. **Override por proyecto** (opcional, en cwd del usuario):

   ```bash
   test -f ./video-explainer-profile.md && cat ./video-explainer-profile.md
   ```

3. **Si existen ambos, mergear campo por campo.** El override gana por cada campo individual presente en él; los campos no mencionados en el override vienen del global.

4. **Si no existe ninguno:**

   > "No encontré tu perfil de entorno. Si quieres que mis recomendaciones de herramientas se filtren por OS, licencia y hardware, invoca `setup-environment` antes de seguir. Continúo con recomendaciones generales."

   Continuar el flujo del skill sin filtrar.

### Filtrado de recomendaciones

En cada decisión que cite una herramienta del Pilar 3 (vía ID `[P3-<seccion>]`), antes de proponer:

1. **Cargar la sección del Pilar 3** y extraer todos los bullets de herramienta con sus bloques `<!-- meta: <slug> -->`.

2. **Filtrar por perfil:**
   - `os ∈ plataformas` (si el perfil tiene `os: windows` y la meta dice `plataformas: [linux, mac]`, descartar)
   - `licencia-preferida` compatible:
     - `open-source` exige `licencia: open-source`
     - `free-tier` acepta `open-source` o `free-tier`
     - `paid` acepta cualquiera con `paid` o `free-tier` (free-tier es un bonus, no una exclusión)
     - `subscription` acepta `subscription` o `free-tier`
     - `cualquiera` no filtra
   - `modo-preferido` compatible:
     - `local` exige `modo: local` o `híbrido`
     - `cloud` exige `modo: cloud` o `híbrido`
     - `híbrido` o `cualquiera` no filtran
   - Si la herramienta tiene `hardware-min:` y el perfil no cumple, descartar (ej. `hardware-min: {gpu: NVIDIA-CUDA}` y el perfil dice `gpu: null` → descartar).

3. **Si quedan ≥ 1 herramientas** → proponer esas al usuario con cita trazable al Pilar 3, igual que el flujo normal.

4. **Si quedan 0** → disparar fallback externo (abajo).

### Fallback externo

Cuando el filtrado deja 0 candidatos:

1. **Construir query estructurada** para WebSearch combinando:
   - Categoría de la herramienta (derivada del ID de sección, ej. "video editor" para `[P3-edicion-editores]`).
   - Campo `equivalentes:` de las herramientas filtradas fuera (para contexto).
   - Parámetros del perfil: OS + licencia + modo.

   Ejemplo: `"video editor for windows open-source with timeline and proxies similar to davinci-resolve kdenlive"`

2. **Invocar `WebSearch`** con la query.

3. **Parsear resultados y filtrar ruido.** Priorizar:
   - Resultados del desarrollador oficial de una herramienta nombrada.
   - Wikis de software (Wikipedia, AlternativeTo).
   - Comparativas de nichos conocidos (Tom's Hardware, PCMag, Reddit r/videography).

4. **Presentar 2-3 candidatos al usuario** en formato:

   ```
   - **<Nombre>** (<URL oficial>)
     - Ajuste al perfil: <por qué encaja — OS, licencia, modo>
     - Limitación conocida: <caveat relevante>
   ```

5. **El usuario elige 1 o rechaza todos.**
   - Si elige: preguntar "¿quieres incorporarla al catálogo curado invocando `update-tools`? Así la próxima vez el filtrado la encontrará directo."
   - Si rechaza todos: flaggear el gap ("no hay equivalente en tu entorno para esta decisión") y continuar con la siguiente decisión del brief sin recomendación en esta.

6. **Si el usuario acepta persistir:** invocar `update-tools` con payload estructurado (ver Fase E).

### Sin acceso a WebSearch

Si WebSearch falla, no devuelve resultados útiles, o el perfil tiene `conectividad: offline`:

> "No hay equivalente curado para tu entorno y no tengo búsqueda externa disponible. ¿Quieres nombrar tú una herramienta que uses o conozcas? Si la nombras, puedo ofrecerte incorporarla al catálogo."

Si el usuario nombra una herramienta, ofrecer invocar `update-tools` con los datos aportados.
````

- [ ] **Step 2: Verificar que se puede copiar**

```bash
wc -l /tmp/paso-0-5-canonico.md
```

Expected: ≥ 90 líneas.

### Task D2: Aplicar Paso 0.5 a `concept-explainer`

**Files:**
- Modify: `skills/concept-explainer/SKILL.md`

- [ ] **Step 1: Leer el SKILL actual**

Leer `skills/concept-explainer/SKILL.md` para identificar dónde insertar el Paso 0.5. Buscar el "Paso 0" existente (lectura de Concept Brief). El 0.5 va **después** del 0 y **antes** del "Paso 1" (primera decisión).

- [ ] **Step 2: Insertar el bloque canónico**

Usar `Edit` para insertar el bloque de Task D1 entre el Paso 0 y el Paso 1. Ajustar referencias a briefs específicos del skill (concept-explainer lee briefs de `docs/briefs/concepto/`).

Además, al inicio del Paso 0 actual, agregar una nota en el encabezado mencionando el nuevo Paso 0.5:

```markdown
## Paso 0 — Leer Concept Brief
[contenido existente...]

## Paso 0.5 — Leer perfil de entorno

[bloque canónico de Task D1]

## Paso 1 — [primera decisión existente del skill]
[contenido existente...]
```

- [ ] **Step 3: Commit**

```bash
git add skills/concept-explainer/SKILL.md
git commit -m "feat(concept-explainer): add environment profile filtering (Paso 0.5)"
```

### Task D3: Aplicar Paso 0.5 a `record-explainer`

**Files:**
- Modify: `skills/record-explainer/SKILL.md`

- [ ] **Step 1: Leer el SKILL actual**

Identificar dónde va el Paso 0.5 (después del Paso 0 existente que lee Production Brief).

- [ ] **Step 2: Insertar el bloque canónico**

Igual que Task D2 pero ajustado a `record-explainer` — los briefs que lee son de `docs/briefs/grabacion/`.

Nota especial: `docs/briefs/grabacion/05-captura-pantalla.md` ya tiene una tabla inline por OS. El Paso 0.5 es **adicional y compatible** — el filtrado sigue aplicando sobre los bullets globales; la tabla inline del brief es una orientación complementaria que el skill puede mostrar junto con las herramientas filtradas.

- [ ] **Step 3: Commit**

```bash
git add skills/record-explainer/SKILL.md
git commit -m "feat(record-explainer): add environment profile filtering (Paso 0.5)"
```

### Task D4: Aplicar Paso 0.5 a `edit-explainer`

**Files:**
- Modify: `skills/edit-explainer/SKILL.md`

- [ ] **Step 1: Leer y ubicar**

Identificar ubicación del Paso 0 existente.

- [ ] **Step 2: Insertar bloque canónico**

Igual que D2, ajustado a `edit-explainer` — briefs de `docs/briefs/edicion/`.

- [ ] **Step 3: Commit**

```bash
git add skills/edit-explainer/SKILL.md
git commit -m "feat(edit-explainer): add environment profile filtering (Paso 0.5)"
```

### Task D5: Aplicar Paso 0.5 a `publish-explainer`

**Files:**
- Modify: `skills/publish-explainer/SKILL.md`

- [ ] **Step 1: Leer y ubicar**

Identificar ubicación del Paso 0.

- [ ] **Step 2: Insertar bloque canónico**

Igual que D2, ajustado a `publish-explainer` — briefs de `docs/briefs/publicacion/`.

- [ ] **Step 3: Commit**

```bash
git add skills/publish-explainer/SKILL.md
git commit -m "feat(publish-explainer): add environment profile filtering (Paso 0.5)"
```

### Task D6: Actualizar `create-explainer` para mencionar `setup-environment`

**Files:**
- Modify: `skills/create-explainer/SKILL.md`

- [ ] **Step 1: Leer el SKILL actual**

Buscar la sección donde el orquestador introduce el flujo al usuario.

- [ ] **Step 2: Insertar mención opcional pre-flujo**

Agregar (antes del primer paso de flujo, después del scope filter):

```markdown
## Paso pre-flujo (opcional, recomendado en primera instalación): configurar entorno

Si el usuario nunca ha invocado `setup-environment` en esta máquina, sugerir:

> "¿Es tu primera vez usando el plugin en esta máquina? Puedo invocar `setup-environment` antes de entrar al flujo — construye un perfil de tu OS, preferencias y hardware, que los skills de etapa usan para adaptar recomendaciones de herramientas a tu entorno. Tarda 3-5 minutos. ¿Lo hacemos?"

Si el usuario acepta, invocar `setup-environment` primero. Si rechaza, seguir con el flujo normal — los skills de etapa funcionarán sin perfil (con recomendaciones generales).

**Señal de "primera vez":** `~/.claude/video-explainer/profile.md` no existe.
```

- [ ] **Step 3: Commit**

```bash
git add skills/create-explainer/SKILL.md
git commit -m "feat(create-explainer): suggest setup-environment on first-time install"
```

### Task D7: Smoke test de integración end-to-end

- [ ] **Step 1: Crear perfil de prueba con override**

Crear en un directorio de proyecto mock:

```bash
mkdir -p /tmp/smoke-edit-test && cd /tmp/smoke-edit-test
cat > ./video-explainer-profile.md <<'EOF'
---
os: windows
shell: pwsh
ram-gb: 16
gpu: null
licencia-preferida: paid
modo-preferido: local
conectividad: online
idioma-ui: es
herramientas-por-etapa:
  edicion: []
restricciones-libres: []
actualizado: 2026-04-20
version: 1
---
EOF
```

- [ ] **Step 2: Invocar `edit-explainer` en ese directorio**

Antonio invoca `/edit-explainer` en Claude Code desde `/tmp/smoke-edit-test`.

Expected:
1. Paso 0.5 se ejecuta: muestra que detectó el perfil (global + override) y que el override tiene `os: windows` + `licencia-preferida: paid`.
2. Al llegar a la decisión de "editor de video" (cita `[P3-edicion-editores]`), el filtrado debe:
   - Descartar Kdenlive (open-source — no cumple `paid`).
   - Descartar DaVinci Resolve free (free-tier, pero el usuario prefiere `paid` explícito — según las reglas de Task D1, `paid` acepta `free-tier` como bonus, entonces DaVinci Resolve free **pasa**; pero también cumple `paid` al ser free-tier + Studio paid). **Clarificación del comportamiento esperado**: DaVinci Resolve free pasa el filtro (porque `free-tier` es aceptable bajo `paid`). Premiere Pro también pasa (es `subscription` — ver abajo).
   - **Nota para el validador**: la regla "`paid` acepta free-tier como bonus" puede generar confusión. El comportamiento correcto según Task D1 es: `licencia-preferida: paid` acepta `[paid, free-tier]`. Si el usuario quiere excluir free-tier explícitamente, debe declarar otro campo (out of scope de este proyecto).
3. El skill propone las herramientas que pasan el filtro con cita trazable al Pilar 3.

Si el comportamiento es otro, diagnosticar: (a) el perfil no se leyó, (b) el filtrado tiene bug de lógica, (c) la metadata del Pilar 3 está mal. Arreglar y re-probar.

- [ ] **Step 3: Limpiar**

```bash
rm -rf /tmp/smoke-edit-test
```

---

## Fase E — Ampliación de `update-tools` para aceptar payload

**Criterio de done:**
- `skills/update-tools/SKILL.md` documenta cómo recibir payload desde fallback externo.
- El skill escribe la ficha nueva al Pilar 3 con metadata completa (formato canónico de Fase B).

### Task E1: Extender `update-tools` con sección "Invocación con payload"

**Files:**
- Modify: `skills/update-tools/SKILL.md`

- [ ] **Step 1: Agregar sección al final del SKILL**

Insertar después del bloque "Cierre — verificación de briefs":

```markdown
## Invocación con payload estructurado (desde fallback externo)

Cuando un skill de etapa (`record-explainer`, `edit-explainer`, `publish-explainer`) dispara su fallback externo y el usuario elige una herramienta nueva, puede invocar a este skill con un payload pre-poblado:

```yaml
payload:
  nombre: "Shotcut"
  url-oficial: "https://www.shotcut.org"
  seccion-destino: P3-edicion-editores
  plataformas: [linux, mac, windows]
  licencia: open-source
  modo: local
  hardware-min: null
  equivalentes: [kdenlive, davinci-resolve]
  contexto: "Fallback externo desde edit-explainer brief edicion/02-nle.md; perfil pedía windows + open-source y no había candidatos curados."
```

**Flujo con payload:**

1. Confirmar con el usuario los campos del payload (algunos pueden ser tentativos).
2. **Pedir los datos que faltan**:
   - Casos de uso concretos (2-3 proyectos donde encaja).
   - Cita a principio del Pilar 1 si aplica (ej. "encaja con [P1-§2.3-#8]").
   - Contraindicaciones conocidas (cuándo NO usarla).
3. **Escribir la ficha formal al Pilar 3** en la sección `seccion-destino`, con:
   - Bullet de herramienta con descripción breve.
   - Bloque `<!-- meta: <slug> -->` con todos los campos del payload.
   - Fecha de verificación: fecha de hoy.
4. **Correr verificaciones**:
   ```bash
   bash scripts/validar-metadata-pilar3.sh
   bash scripts/verificar-briefs.sh --strict
   ```
5. **Reportar al usuario**: "Agregada al catálogo como `<slug>` en `<seccion-destino>`. La próxima vez que un skill de etapa evalúe esa sección, la encontrará en el filtrado."
```

- [ ] **Step 2: Commit**

```bash
git add skills/update-tools/SKILL.md
git commit -m "feat(update-tools): accept structured payload from external fallback"
```

---

## Fase F — Documentación, verificación E2E y bump de versión

**Criterio de done:**
- `CLAUDE.md` documenta la arquitectura del perfil + `setup-environment` en la sección relevante.
- `ROADMAP.md` incluye esta fase marcada como cerrada.
- Plugin versioneado a 1.2.0 en `plugin.json` y `marketplace.json`.
- Verificaciones E2E del spec (items 1-7) pasan.

### Task F1: Actualizar `CLAUDE.md`

**Files:**
- Modify: `CLAUDE.md`

- [ ] **Step 1: Agregar sección "Perfil de entorno del usuario" después de "Skills layout"**

Insertar esta sección nueva en `CLAUDE.md`:

```markdown
## Perfil de entorno del usuario (setup-environment)

El skill `setup-environment` construye un perfil persistente del entorno del usuario (OS, preferencias, hardware, restricciones, herramientas ya elegidas) que los skills de etapa leen para filtrar recomendaciones de herramientas.

**Archivos:**
- Global por máquina: `~/.claude/video-explainer/profile.md` (no se commitea).
- Override por proyecto (opcional): `./video-explainer-profile.md` en la raíz del repo del usuario.

**Campos del perfil** (frontmatter YAML): `os`, `shell`, `ram-gb`, `gpu`, `mic`, `camera`, `monitor-res`, `tablet`, `licencia-preferida`, `modo-preferido`, `conectividad`, `idioma-ui`, `herramientas-por-etapa`, `restricciones-libres`, `actualizado`, `version`. Ver plantilla en el skill.

**Integración con skills de etapa (Paso 0.5):** `concept-explainer`, `record-explainer`, `edit-explainer` y `publish-explainer` leen ambos archivos (mergean campo-a-campo, override gana) al inicio de su flujo. Filtran las herramientas candidatas de cada decisión contra el perfil (OS + licencia + modo + hardware-min). Si el filtrado deja 0 candidatos, disparan **fallback externo** vía WebSearch, presentan 2-3 candidatos, y si el usuario elige uno, ofrecen invocar `update-tools` con payload estructurado para persistir al Pilar 3.

**Metadata en Pilar 3:** cada bullet de herramienta en `docs/pilares/03-herramientas.md` tiene un bloque `<!-- meta: <slug> -->` con campos estructurados (`plataformas`, `licencia`, `modo`, `hardware-min?`, `equivalentes`). Ver formato canónico documentado en el prefacio del Pilar 3.

**Re-invocación:** el usuario puede invocar `setup-environment` las veces que quiera. En re-invocaciones, muestra el perfil actual, ofrece actualizar solo secciones puntuales (plataforma / preferencias / restricciones / hardware / herramientas).
```

- [ ] **Step 2: Actualizar "Skills layout" para incluir `setup-environment`**

Insertar en la lista de skills del SKILL layout:

```markdown
- `setup-environment` — construye y actualiza el perfil de entorno del usuario (OS, preferencias, hardware, herramientas ya elegidas). Re-invocable. Leído por los skills de etapa para filtrar recomendaciones de herramientas.
```

- [ ] **Step 3: Verificar que los nombres `update-tools`, `update-trends`, `sync-briefs` ya están (de Task A5)**

```bash
grep -n "setup-environment\|update-tools\|update-trends\|sync-briefs" CLAUDE.md
```

Expected: todos los 4 nombres presentes. Sin menciones a los nombres viejos.

- [ ] **Step 4: Commit**

```bash
git add CLAUDE.md
git commit -m "docs(claude-md): document setup-environment and user profile architecture"
```

### Task F2: Actualizar `ROADMAP.md`

**Files:**
- Modify: `ROADMAP.md`

- [ ] **Step 1: Leer ROADMAP actual**

Buscar la sección "fase" más reciente cerrada y la siguiente en abierto.

- [ ] **Step 2: Agregar entrada para esta fase**

Insertar en la sección correspondiente:

```markdown
## Fase 7 — Portabilidad y perfil de entorno (2026-04-20)

**Estado:** completada.

- Skills de mantenimiento migrados a inglés: `actualizar-herramientas` → `update-tools`, `actualizar-tendencias` → `update-trends`, `sincronizar-briefs` → `sync-briefs`.
- Pilar 3 enriquecido con metadata estructurada por herramienta (bloque `<!-- meta: <slug> -->` con `plataformas`, `licencia`, `modo`, `hardware-min?`, `equivalentes`).
- Skill nuevo `setup-environment` — construye perfil de entorno del usuario (global + override por proyecto) vía diálogo.
- Integración en 4 skills de etapa (concept/record/edit/publish) con Paso 0.5 (lectura de perfil + filtrado de herramientas + fallback externo vía WebSearch).
- `update-tools` ampliado para aceptar payload estructurado desde fallback externo.
- Plugin versionado a 1.2.0.
```

- [ ] **Step 3: Commit**

```bash
git add ROADMAP.md
git commit -m "docs(roadmap): close fase 7 — portabilidad y perfil de entorno"
```

### Task F3: Bump de version a 1.2.0

**Files:**
- Modify: `.claude-plugin/plugin.json`
- Modify: `.claude-plugin/marketplace.json`

- [ ] **Step 1: Leer version actual en plugin.json**

```bash
cat .claude-plugin/plugin.json | grep '"version"'
```

Expected: `"version": "1.1.0"`.

- [ ] **Step 2: Cambiar a 1.2.0**

Usar `Edit` en `.claude-plugin/plugin.json`:

```json
"version": "1.1.0"
```

Por:

```json
"version": "1.2.0"
```

- [ ] **Step 3: Idem en marketplace.json**

```bash
cat .claude-plugin/marketplace.json | grep '"version"'
```

Y usar `Edit` para cambiarla a 1.2.0.

- [ ] **Step 4: Verificar ambos tienen 1.2.0**

```bash
grep '"version"' .claude-plugin/plugin.json .claude-plugin/marketplace.json
```

Expected: dos hits con `"version": "1.2.0"`.

- [ ] **Step 5: Commit**

```bash
git add .claude-plugin/
git commit -m "chore: bump version to 1.2.0 for setup-environment release"
```

### Task F4: Verificación E2E del spec (items 1-7)

**Files:** ninguno modificado — solo verificaciones.

- [ ] **Step 1: Smoke test del skill nuevo — Item 1 del spec**

Ejecutar Task C2 (ya hecha en Fase C), confirmar que el flujo re-validado sigue funcionando.

- [ ] **Step 2: Integración con skill de etapa — Item 2 del spec**

Ejecutar Task D7 (ya hecha en Fase D), confirmar que el filtrado por perfil funciona.

- [ ] **Step 3: Fallback externo — Item 3 del spec**

Antonio crea un perfil de prueba con combinación rara:

```bash
mkdir -p /tmp/fallback-test && cd /tmp/fallback-test
cat > ./video-explainer-profile.md <<'EOF'
---
os: windows
shell: pwsh
ram-gb: 8
gpu: null
licencia-preferida: open-source
modo-preferido: local
conectividad: online
idioma-ui: es
herramientas-por-etapa:
  edicion: []
restricciones-libres: []
actualizado: 2026-04-20
version: 1
---
EOF
```

Invoca `/edit-explainer`. En alguna decisión del skill (probablemente la de subtítulos con WhisperX que requiere NVIDIA-CUDA o la de composición programática), el filtrado puede dejar 0 candidatos y disparar fallback.

Expected: WebSearch se invoca, se presentan 2-3 candidatos. Si el usuario elige uno, se ofrece invocar `update-tools`.

Limpiar: `rm -rf /tmp/fallback-test`.

- [ ] **Step 4: Metadata de Pilar 3 — Item 4 del spec**

```bash
bash scripts/validar-metadata-pilar3.sh
bash scripts/verificar-briefs.sh --strict
bash scripts/regenerar-vistas.sh
```

Expected: los 3 ejecutan con exit 0.

Verificar manualmente que 5-10 herramientas representativas tienen metadata coherente:

```bash
grep -A 6 "meta: obs-studio\b" docs/pilares/03-herramientas.md
grep -A 6 "meta: davinci-resolve\b" docs/pilares/03-herramientas.md
grep -A 6 "meta: premiere\b" docs/pilares/03-herramientas.md
grep -A 6 "meta: whisper\b" docs/pilares/03-herramientas.md
grep -A 6 "meta: descript" docs/pilares/03-herramientas.md
grep -A 6 "meta: camcam" docs/pilares/03-herramientas.md  # si existe CapCut
grep -A 6 "meta: ffmpeg\b" docs/pilares/03-herramientas.md
```

Expected: cada grep muestra el bloque meta con campos poblados.

- [ ] **Step 5: Renombrado de skills — Item 5 del spec**

```bash
grep -rn "actualizar-herramientas\|actualizar-tendencias\|sincronizar-briefs" \
  --include="*.md" \
  --exclude-dir=.git --exclude-dir=superpowers/specs --exclude-dir=superpowers/plans \
  .
```

Expected: 0 hits.

Smoke invoke: Antonio invoca `/update-tools`, `/update-trends`, `/sync-briefs`. Expected: los 3 cargan y muestran su prompt de descripción.

- [ ] **Step 6: Plugin packaging — Item 6 del spec**

```bash
grep '"version"' .claude-plugin/plugin.json .claude-plugin/marketplace.json
```

Expected: ambos a 1.2.0.

Smoke check que el plugin carga sin errores: Antonio reinicia Claude Code y confirma que los skills siguen disponibles bajo sus nombres nuevos.

- [ ] **Step 7: Regression sanity — Item 7 del spec**

Antonio corre un flujo completo:
1. `/create-explainer` → introduce el flujo
2. `/concept-explainer` → construye Concept Brief
3. `/script-explainer` → construye guion (no modificado por esta reforma — regresión sanity)
4. `/edit-explainer` → aplica filtrado por perfil si el perfil existe
5. `/publish-explainer` → idem

Expected: todo el flujo completa sin regresiones. Cualquier anomalía se debug y se arregla antes de cerrar la fase.

- [ ] **Step 8: Commit final**

```bash
# Si hubo parches durante la verificación:
git add -A
git commit -m "fix: address E2E verification findings"
```

Si no hubo parches, este step se skip.

---

## Self-Review (ejecutada durante la redacción de este plan)

1. **Spec coverage:** verifiqué cada sección del spec contra tareas del plan:
   - Context → documentado en header del plan. OK.
   - Arquitectura (sección 1, skill nuevo) → Tasks C1-C2. OK.
   - Perfil archivos (sección 2) → Task C1. OK.
   - Metadata Pilar 3 (sección 3) → Tasks B1-B7. OK.
   - Skills de etapa (sección 4) → Tasks D1-D7. OK.
   - Fallback externo (sección 5) → Task D1 (bloque canónico). OK.
   - Renombrado (sección 6) → Tasks A1-A7. OK.
   - Payload update-tools (sección 7) → Task E1. OK.
   - Edge cases → cubiertos en los skills correspondientes (C1 documenta re-invocación con staleness; D1 documenta sin-WebSearch). OK.
   - Out of scope → no se implementa (correcto). OK.
   - Verificación E2E → Task F4 cubre los 7 items del spec. OK.

2. **Placeholder scan:** busqué TBD/TODO/"implement later". No encontré. El plan incluye código real en cada step de edición.

3. **Type consistency:**
   - Slugs de metadata: consistentes entre B3-B7 y referenciados en F4. Ej: `davinci-resolve`, `premiere`, `whisper` — los mismos en todas las tareas.
   - Campos del perfil: `os`, `shell`, `ram-gb`, `licencia-preferida`, `modo-preferido`, etc. — consistentes entre C1 (documentación), D1 (uso), D7/F4 (smoke tests).
   - IDs de sección Pilar 3: `P3-edicion-editores`, `P3-preprod-captura`, etc. — preservados (no se renombran).

4. **Ajuste encontrado:** en Task D7 Step 2 noté que la lógica de licencia "paid acepta free-tier" puede generar confusión. Agregué una aclaración inline en el Step para que el ejecutor no trate ese comportamiento como bug.

---

## Ejecución — opciones

Plan completo y guardado en `docs/superpowers/plans/2026-04-20-setup-environment.md`. Dos opciones de ejecución:

**1. Subagent-Driven (recomendado)** — dispatcheo un subagent fresco por tarea, reviso entre tareas, iteración rápida. Cada fase (A/B/C/D/E/F) puede paralelizarse parcialmente: A es independiente, B puede correr con C en paralelo, D depende de A+B+C, E depende de A, F depende de todo.

**2. Inline Execution** — ejecuto las tareas en esta sesión usando `executing-plans`, con checkpoints de review entre fases.

¿Cuál prefieres?
