---
decision: material/05-estilo-visual-coherencia
etapa: material
pregunta: ¿Qué estilo visual elegir y cómo garantizar coherencia entre todas las piezas del set?
fuentes:
  - P1-§2.3-#1                # coherencia (Mayer 1)
  - P1-§2.3-#10               # personalización (Mayer 10)
  - P1-§3.1                   # color modesto, context-dependent
  - P1-§3.2                   # contraste WCAG
  - P1-§5.1                   # tipografía para pantalla
admite-variantes: true
varia-por-eje: []
sync: 2026-04-26
version: 1
---

## Principio aplicable

**Un set se reconoce como set por su estilo común**, no por la calidad individual de cada pieza. Si dos láminas del mismo set se ven hechas por dos personas distintas, el lector procesa el cambio de estilo en lugar del contenido — eso es coherencia rota [P1-§2.3-#1].

Las variables del estilo: **paleta de color** (primaria + secundaria + acentos), **tipografía** (header + body + accent), **tratamiento ilustrativo** (línea / grabado / flat / foto), **composición** (grid / free / cómic). Las cinco se fijan al inicio y no se varían pieza a pieza.

**La elección del estilo no es estética en abstracto** [P1-§3.1]: ciertos estilos asociados a ciertos temas activan reconocimiento cultural que ayuda a la comprensión. Tema histórico en grabado tierra → "esto es un libro de historia" antes de leer una palabra. Tema técnico en flat moderno → "esto es documentación de software". El estilo es contexto cognitivo gratis.

## Casos

- **Set "El origen del yoga" — preset `historico-grabado`**: paleta tierra/sepia (#8B6F47, #C4A484) con acentos cromáticos por época (rojo terracota Indo, amarillo ocre védico, verde musgo moderno), tipografía estilo libro de historia (display serif para headers, serif clásico para body), ilustración tipo grabado/litografía con líneas finas y sombreado por hatching, composición de doble página con header + paneles numerados + footer + timeline al pie.
- **Documentación técnica IDE-style — preset `tecnico-flat`**: paleta limpia (background neutro, 2-3 acentos saturados), sans-serif moderno (Inter, IBM Plex), ilustraciones vectoriales flat sin sombras, composición grid estricta. Vibe Fireship pero estático.
- **Paper-style científico — preset `cientifico-informativo`** [P1-§5.1]: paleta blanco/azul/gris, sans-serif con jerarquía fuerte, diagramas precisos sin decoración, composición de revista científica. Tufte minimalista [como cita brief 03].

## Anti-patrón

**Mezclar dos estilos en el mismo set** [P1-§2.3-#1]: un capítulo en grabado tierra y el siguiente en flat colorido rompe la lectura. El lector procesa el cambio en lugar del contenido. Aplica también a tipografías: cambiar la familia entre láminas comunica "esto es otra cosa".

**Estilo elegido por estética sin alineación con tema** [P1-§3.1]: tema histórico en flat plano se siente fuera de tono; tema técnico en grabado tierra se siente pretencioso. La elección del preset se justifica por la naturaleza del tema, no por preferencia visual del autor.

**Paletas de 5+ colores compitiendo** [P1-§3.1]: la regla 60/30/10 es convención, pero el principio detrás (jerarquía limitada de color) es real — más de 3 colores principales saturan y reducen el efecto de señalización del acento.

**Cuerpo de texto en color de bajo contraste** [P1-§3.2]: amarillo sobre crema, gris claro sobre blanco, body en color de acento. Viola WCAG AA 4.5:1 y degrada legibilidad. El contraste de body es no-negociable.

## Heurística numérica

- **Paleta:** 2-3 colores principales + 1-2 acentos. Más es ruido [P1-§3.1].
- **Tipografía:** 2 familias máximo (header + body). 3 si añades accent serif para citas [P1-§5.1].
- **Contraste body:** WCAG AA 4.5:1 mínimo, no-negociable [P1-§3.2].
- **Tono conversacional en texto integrado** [P1-§2.3-#10]: lenguaje cercano ("tú", "nosotros") supera al formal en aprendizaje. Aplica a las cajas "concepto clave" y "para estudiar".
- **Coherencia operativa:** todas las piezas del set comparten el meta-prompt de estilo verbatim — no personalizar pieza a pieza.

## Presets de arranque

Cinco presets nombrados como punto de partida. Cada uno es un fragmento de prompt reutilizable que se inyecta verbatim en cada output del paso 2 de la skill.

### `historico-grabado`

- **Cuándo:** temas con dimensión histórica, cultural, filosófica, religiosa, geopolítica de larga duración, donde la pátina del tiempo importa.
- **Paleta:** tierra/sepia (#8B6F47, #C4A484, #2C1810) + acentos cromáticos por sub-tema (rojo terracota, amarillo ocre, verde musgo, azul lapis).
- **Tipografía:** display serif (Cormorant, Playfair) para headers; serif clásico (Lora, Source Serif) para body.
- **Tratamiento:** ilustración tipo grabado o litografía, líneas finas con sombreado por hatching. Sin gradientes modernos. Sin fotorealismo.
- **Composición:** doble página estilo libro de historia con header dominante + paneles numerados + footer "para estudiar" + timeline al pie cuando aplica.

### `tecnico-flat`

- **Cuándo:** documentación técnica, software, APIs, arquitectura, herramientas, procesos digitales.
- **Paleta:** background neutro (off-white, gray-50) + 2-3 acentos saturados (azul electric, verde mint, rosa coral).
- **Tipografía:** sans-serif moderno (Inter, IBM Plex Sans) en todos los niveles.
- **Tratamiento:** ilustración vectorial flat sin sombras, iconos line-art, capturas de pantalla anotadas.
- **Composición:** grid estricto 12-col, jerarquía clara por tamaño y peso tipográfico.

### `cientifico-informativo`

- **Cuándo:** divulgación científica, biología, física, datos, periodismo de evidencia.
- **Paleta:** blanco + grises + azul corporativo + 1 acento (rojo o naranja) reservado para señalización.
- **Tipografía:** sans-serif con jerarquía fuerte (Helvetica Neue, Source Sans). Body en sans, no serif [P1-§5.1].
- **Tratamiento:** diagramas precisos estilo papers (Tufte minimalista), sin decoración, escalas y leyendas siempre. Sin chartjunk.
- **Composición:** estilo Nature / Scientific American — heading + abstract + figure dominante + caption.

### `narrativo-comic`

- **Cuándo:** temas con personajes o arco narrativo, divulgación juvenil, storytelling, casos personales.
- **Paleta:** cálida (rojos, naranjas, amarillos) con sombras vivas; contraste alto.
- **Tipografía:** sans-serif rounded (Open Sans Rounded, Quicksand) o cómic (Bangers para títulos solo, no body).
- **Tratamiento:** viñetas con personajes consistentes, balloons de diálogo, expresiones marcadas.
- **Composición:** grid de viñetas estilo cómic, gutters pronunciados, narrativa secuencial clara.

### `editorial-periodico`

- **Cuándo:** ensayos, opinión, periodismo de investigación, longreads, análisis culturales.
- **Paleta:** neutra elegante (negro + crema + gris); 1 acento (rojo vino o azul tinta) para destacados.
- **Tipografía:** serif editorial (Garamond, Caslon, NYT Cheltenham) para headers y body; sans-serif para captions y metadatos.
- **Tratamiento:** fotografía editorial blanco y negro o ilustración con grano, infografías estilo NYT/Atlantic.
- **Composición:** asimétrica con grid editorial, leading generoso, márgenes amplios.

## Diálogo de afinamiento

Tras proponer 1-2 presets relevantes según el tema y objetivo cognitivo, dialogar con el usuario para fijar:

1. **Variaciones de paleta** (paleta secundaria, acentos por sub-tema cuando aplica).
2. **Tipografía concreta** (familias específicas si hay preferencia).
3. **Motivo recurrente** (om mantra al pie, número de capítulo en cartouche, símbolo distintivo, etc.).
4. **Restricciones explícitas** (sin fotorealismo, sin AI slop, paleta limitada a N tonos).

El resultado es el meta-prompt final que se inyecta verbatim a cada output del paso 2 — eso es lo que da consistencia visual al set.

## Conflictos conocidos

**Preset elegido por estética choca con objetivo cognitivo** (ej. `narrativo-comic` para `corregir-intuicion`): ver brief 03 §Conflictos. La riqueza visual puede comprometer claridad analítica. Flaggear y dialogar — o se baja la riqueza estilística para los bloques analíticos, o se acepta híbrido.

**Branding institucional con paleta de bajo contraste** [P1-§3.2]: el cliente exige usar su paleta corporativa pero los colores no cumplen WCAG AA. Flaggear: el contraste de body no se sacrifica por branding. Negociar excepción solo en headers / decorativos.

## Salida esperada

Bloque "Estilo visual" en el Didactic Brief con:

- **Preset elegido** (uno de los 5 o `custom`).
- **Customizaciones del diálogo** (paletas concretas, tipografías concretas, motivos recurrentes).
- **Meta-prompt completo** (verbatim, listo para inyectar) — el bloque que aparecerá idéntico en cada output del paso 2.
