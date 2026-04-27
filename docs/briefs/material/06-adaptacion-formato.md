---
decision: material/06-adaptacion-formato
etapa: material
pregunta: ¿Cómo cambia la estructura, densidad y tono cuando el mismo Didactic Brief se materializa en lámina vs slide vs long-form?
fuentes:
  - P1-§2.1                   # CLT
  - P1-§2.3-#3                # redundancia (Mayer 3)
  - P1-§2.3-#8                # modalidad (Mayer 8)
  - P1-§2.4                   # segmentación / unidad útil
  - P1-§5.1                   # tipografía
admite-variantes: false
varia-por-eje: [formato]
sync: 2026-04-26
version: 1
---

## Principio aplicable

**El modo de consumo del medio gobierna densidad, tono y estructura**. Tres modos distintos:

- **Lámina autoadministrada** [P1-§2.1]: el lector controla el ritmo, pausa y relee. Tolera densidad media-alta porque no hay contador externo. La pieza es autocontenida — texto y visual viven juntos en la misma unidad.
- **Slide guiada por presentador** [P1-§2.3-#3] [P1-§2.3-#8]: audio + visual simultáneos. Principio de modalidad — texto narrado supera a texto en pantalla cuando acompaña gráfico. Principio de redundancia — bullets que duplican la voz degradan aprendizaje.
- **Long-form de lectura activa** [P1-§2.4]: el lector procesa secuencialmente con pausas naturales en headings. Mayor profundidad por unidad porque la lectura activa permite reflexión.

El mismo concepto se materializa distinto en cada formato. No es traducción mecánica — es re-densificación según el modo de consumo.

## Casos

- **Mismo concepto, 3 formatos**: la idea "el yoga no nace del hinduismo, nace de un sincretismo entre Valle del Indo + migraciones indoarias" se materializa así:
  - **Lámina**: 3 paneles visuales (Valle del Indo + flechas indoarias + sincretismo) + 1 caja "concepto clave" con la frase de cierre en ≤30 palabras.
  - **Slide**: 1 título "Sincretismo proto-hinduista" + 1 visual hero de las 3 culturas convergiendo + 3 bullets de 5-7 palabras + speaker notes con la prose completa de 100-150 palabras.
  - **Long-form**: 1 H2 "El sincretismo proto-hinduista" + 3-4 párrafos (300-400 palabras) explicando las 3 culturas y su convergencia + 1 visualización embebida con caption.

## Anti-patrón

**Copiar-pegar prose de long-form a slide** [P1-§2.3-#3]: el bloque de texto del long-form en una slide hace que el presentador lea, violando redundancia. La audiencia procesa dos canales verbales redundantes y aprende menos que con cualquiera por separado.

**Lámina convertida en slide sin re-densificar** [P1-§2.1]: una lámina cargada (autoadministrada, lector controla ritmo) usada como slide en presentación queda visualmente saturada porque el espectador no puede pausar a su ritmo — el presentador habla mientras la audiencia intenta procesar todo lo escrito.

**Slide expandida a lámina sin agregar visual integrado**: una slide minimalista (1 imagen + 3 bullets + speaker notes externas) usada como lámina pierde las speaker notes y queda subrepresentada — falta la información que vivía en el canal hablado.

**Long-form fragmentado en N láminas idénticas en estructura** [P1-§2.4]: dividir un artículo en N páginas no lo convierte en láminas — pierde la integración visual-textual característica. Una lámina no es una página de texto con un dibujo arriba.

## Heurística numérica

- **Conversión de densidad** (referencia para el mismo concepto):
  - Lámina: ~80 palabras visibles + 2-4 elementos visuales integrados.
  - Slide: ~25 palabras visibles + 1 visual hero + speaker notes ilimitadas.
  - Long-form: ~300 palabras + 1-2 visualizaciones embebidas con caption.
- **Tiempo de consumo target por unidad**:
  - Lámina: 1-2 min por lámina (autoadministrado).
  - Slide: 1-2 min por slide (guiado por presenter).
  - Long-form: ~250 wpm de lectura activa.
- **Visualización**: lámina (visual integrado al texto), slide (visual hero + bullets separados), long-form (visual embebido con caption descriptivo).

## Ajuste por eje

### Por `formato`

- **`lamina`:**
  - Densidad media-alta. Visual integrado al texto.
  - Tono sintético, declarativo. Cajas "concepto clave" + glosario "para estudiar".
  - Estructura: header + paneles numerados + footer + timeline (cuando aplica).
  - Tipografía con jerarquía clara para escaneo [P1-§5.1].
  - Output file: `prompts-laminas.md` con prompt por capítulo + meta-prompt de estilo verbatim idéntico en cada uno.

- **`slide`:**
  - Densidad baja. 1 visual hero + bullets cortos como anclas (3-7 palabras) + speaker notes con prose completa.
  - Tono ancla para presenter; los bullets no son la información, la voz lo es [P1-§2.3-#3].
  - Estructura: título + visual + 3 bullets + speaker notes + (opcional) prompt-imagen como comentario para generar el visual.
  - Output file: `slides.md` formato Marp (markdown-first, exportable a PDF/PPTX).

- **`long-form`:**
  - Densidad alta. Prose completa por sección, 200-400 palabras + visualización embebida.
  - Tono editorial; el lector activo procesa cada párrafo a su ritmo.
  - Estructura: lead que engancha + H2 por sección (= bloque del Brief) + visualizaciones embebidas con caption + "Para profundizar" al cierre.
  - Output file: `articulo.md` markdown editorial.

## Conflictos conocidos

**Cliente que pide "un solo formato que sirva para presentar Y como handout Y como artículo blog"**: confunde tres formatos. Cada uno tiene modo de consumo distinto y densidad distinta. Negociar: producir los 3 desde el mismo Didactic Brief. El costo marginal es bajo porque comparten upstream (concepto, secuencia, conceptos clave, estilo).

**Tema que solo funciona en uno de los 3 formatos**: ej. tema con 80% imagen y 20% texto que solo funciona como lámina. Si el cliente insiste en slide o long-form, flaggear: el formato natural del tema es lámina; forzar otro produce material subóptimo.

## Salida esperada

Por formato seleccionado, un archivo distinto en el directorio del usuario:

- `prompts-laminas.md` — N secciones (una por capítulo), cada una con anatomía completa de prompt (ver brief 07-prompts-imagen-IA).
- `slides.md` — formato Marp, 1 slide por bloque del Brief.
- `articulo.md` — markdown editorial, 1 H2 por bloque del Brief.

Cada archivo respeta la densidad, tono y estructura del sub-bloque "Por `formato`" correspondiente. El meta-prompt de estilo (sección 6 del Didactic Brief) aparece verbatim e idéntico en los 3 outputs cuando se materializan varios formatos del mismo Brief — eso garantiza coherencia visual entre formatos.
