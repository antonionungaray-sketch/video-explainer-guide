---
name: previsualizacion-entrenamiento
description: "Use when the user finished the script and wants to validate design, pacing, references, and demo execution order before recording — producing a Production Brief that guides the recording session. Etapa opcional recomendada entre guion y grabación del toolkit de entrenamiento audiovisual."
---

# Previsualización de entrenamiento audiovisual

Acompañas al creador a producir un **Production Brief** — un documento
consolidado que fija, antes de grabar, cómo se va a ver el video bloque
por bloque, cuánto va a durar cada bloque y en qué orden ejecutable se
graban las demos.

## Carácter opcional

Esta etapa es **recomendada pero no bloqueante**. Si el usuario viene
desde `crear-entrenamiento` con el guion cerrado, el orquestador la
ofrece; el usuario puede saltarla con consciencia explícita
(re-shoots, formato repetido, video muy simple). Una vez invocado este
skill, corre hasta el final — no hay lógica de bypass interna.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta
etapa**:

```
docs/briefs/previsualizacion/*.md
```

(4 archivos. Orden alfabético = orden de flujo:
01-storyboard-y-referencias → 02-pacing-estimado → 03-shotlist-demos
→ 04-requisitos-captura.)

También **carga el guion producido por `guion-entrenamiento`**: es el
input obligatorio de esta etapa. Si no hay guion documentado, detenete
y pedí al usuario volver a la etapa de guion primero.

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables. Si surge una pregunta
fuera del scope de los briefs, usá `Grep` dirigido por ID
(ej. `grep "P1-§2.3-#5" docs/pilares/01-fundamentos-cognitivos.md`),
no `Read` del archivo completo.

## Flujo

Camina al creador por las 4 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief.
2. **Proponer con justificación trazable** usando `Principio aplicable`
   + `Casos` del brief. Ningún brief de esta etapa admite variantes
   (`admite-variantes: false`): las decisiones son deterministas —
   tipo de bloque es categórico, pacing es cálculo, shotlist es orden
   operacional, requisitos de captura derivan del storyboard. Si el
   brief lista `Conflictos conocidos` aplicables al contexto,
   **flaggearlos explícitamente al usuario** — no resolver en silencio.
   Pilar 1 prevalece salvo decisión informada.
3. **Manejar auto-skip del brief 03:** si después del brief 01 ningún
   bloque quedó clasificado como `demo-pantalla` ni `mixto`, saltá
   el brief 03 y anotá la sección correspondiente como "N/A — video
   sin demos".
4. **Manejar auto-skip del brief 04:** si el storyboard no declara
   ningún `zoom-pantalla`, `PiP`, `cut-away`, `cambio-de-ángulo` ni
   `escena-alternativa`, registrá "N/A — sin requisitos especiales
   más allá de la escena base" y pasá al cierre.
5. **Registrar la decisión** antes de pasar a la siguiente.

## Salida — Production Brief consolidado

Al terminar (entre 2 y 4 secciones según auto-skips), produce el
documento final siguiendo esta plantilla:

```
# Production Brief — <título del video>

## 0. Metadatos
- estado: draft            # draft | locked
- locked-at: —             # YYYY-MM-DD cuando pase a locked
- Duración target: <N min>
- Duración estimada (suma de bloques): <N min>
- WPM usado: <personal / 150 / 180 / …>
- Fecha de producción estimada: <YYYY-MM-DD>

## 1. Storyboard por bloque
BLOQUE 1 — <título>
  Tipo: <camara | demo-pantalla | mixto | b-roll>
  Duración estimada: <min:seg>
  Visual: <descripción>
  Narración (del guion): <literal del guion>
  Fuera de pantalla: <…>
  Transición al siguiente: <corte seco | cross-dissolve | scene-switch F2 | …>
  Referencia: <link + timestamp, o vacío>
  Notas de señalización: <…>

BLOQUE 2 — …

## 2. Timeline y pacing
<tabla bloque-por-bloque con palabras, WPM, duración estimada,
 flags de riesgo, ajustes solicitados>

Duración total estimada: <N min>
Delta vs target: <±X%>

## 3. Shotlist ejecutable
<una entrada por demo siguiendo la plantilla del brief 03, o
 "N/A — video sin demos">

## 4. Requisitos de captura
Escenas OBS:
  1. pantalla-full     (display 1)                           [F1]
  2. pantalla-zoom-X   (display 1, crop N% sobre región Y)   [F2]
  …
Ángulos de cámara:  <frontal default + si aplica otros>
B-roll:  <lista con duración y bloque destino, o N/A>
Props / estado inicial:  <editor/terminal/navegador/otros>
Mapa bloque → escena:  B1→… · B2→… · …

(o "N/A — sin requisitos especiales más allá de la escena base")

## 5. Conflictos flaggeados
<lista de conflictos reportados durante la etapa que quedaron sin
 resolver con el usuario — ej. "WPM 235 con storyboard muy denso
 en bloque 3, usuario acepta el riesgo">
```

**Dónde vivir el archivo.** Sugerí al usuario guardarlo junto al guion
(mismo directorio que usó para el artefacto de guion) con un nombre
claro (`production-brief-<slug>.md`). No lo commitees al repo del
toolkit — es artefacto del usuario, no del toolkit.

Verifica antes de proponer el lock:

- [ ] Todos los bloques del guion tienen tipo declarado
      (camara / demo-pantalla / mixto / b-roll).
- [ ] Duración total estimada dentro de ±15% del target.
- [ ] Bloques con flags de pacing (>6min, WPM bajo sin compensación
      visual, etc.) discutidos con el usuario — resueltos o aceptados
      como riesgo explícito.
- [ ] Si hay bloques `demo-pantalla` o `mixto`, cada uno tiene
      shotlist con estado inicial + pasos + checkpoints.
- [ ] Si NO hay demos, la sección 3 dice explícitamente "N/A — video
      sin demos".
- [ ] Sección 4 (Requisitos de captura) completa: toda escena OBS
      referenciada en transiciones del storyboard está listada con
      fuentes, crop y shortcut; o sección dice "N/A — sin requisitos
      especiales".
- [ ] Cero conflictos P1 vs preferencia del usuario sin flaggear en
      sección 5.

## Gate de lock

Una vez verificado todo lo anterior, **preguntá explícitamente al
usuario si quiere pasar el Production Brief a estado `locked`**:

> "El Production Brief está completo. ¿Lo paso a `locked`? A partir
> de ahí es el contrato para grabación — si hay cambios después, hay
> que volver a esta etapa para re-lockear."

Si el usuario acepta:
- Cambiar `estado: draft` → `estado: locked`.
- Escribir la fecha de hoy en `locked-at:` (formato `YYYY-MM-DD`).

Si el usuario prefiere dejarlo `draft`:
- Mantener el estado y avisar que `grabacion-entrenamiento` va a
  alertar sobre el draft al arrancar (no bloquea, solo avisa).

**Cambios post-lock** = nueva invocación de este skill, revisión de
las decisiones afectadas, re-escribir `locked-at:` con la fecha nueva.
Misma disciplina que los briefs `sync:`.

## Consumo downstream

El Production Brief es input opcional para `grabacion-entrenamiento`:
- Tipo de bloque → informa a `grabacion/02-video-encuadre` (face-cam
  vs sin cara vs mixto).
- Duración estimada por bloque → informa a `grabacion/06-tomas` (plan
  de bloques + retomas).
- Shotlist → informa a `grabacion/05-captura-pantalla` (cursor,
  highlights) y define props a pre-cargar antes de grabar.
- **Requisitos de captura (sección 4)** → fuente de verdad para
  `grabacion/04-escenas` cuando el Production Brief está `locked`:
  escenas OBS con fuentes, crop y shortcut; mapa bloque→escena.
- Referencias visuales → informa a `grabacion/04-escenas` (intención
  estética).

Grabación NO modifica el Production Brief; solo lo lee.

## Consumo downstream — edición

El Production Brief es también input para `edicion-entrenamiento`:
- **Transiciones declaradas por bloque (sección 1 del storyboard)**
  → fuente de verdad para `edicion/09-transiciones`. Transiciones
  marcadas como `scene-switch F2` ya están en el crudo (no son post);
  `cross-dissolve` / `J-cut` / `corte seco` se ejecutan en edición.

## Reglas firmes

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief
  (`[P1-§X.Y]`) en la justificación al usuario.
- **WPM default, lectura cronometrada manual solo opt-in.** No pedir
  al usuario leer el guion completo en voz alta — el solo-creator no
  tiene tiempo para hacerlo dos veces.
- **Referencias atadas a bloques o vacías.** Ninguna referencia
  decorativa global sin anclaje por bloque.
- **Auto-skip del shotlist si no hay demos.** El usuario no debe
  responder N/A manualmente cuando el brief 01 ya lo dejó claro.
- **No generar imágenes.** El storyboard es texto denso + referencias
  + ASCII opcional. Si el usuario pide mockups reales, sugerir
  herramientas externas sin integrarlas (Storyboarder, Boords,
  Figma) — el toolkit es agnóstico de tooling en esta capa.
- **Evitar pseudociencia:** ninguna regla tipo "corte cada 15s" como
  ley; es heurística de creadores [P1-§4.4], validable solo con
  curva de retención propia.
