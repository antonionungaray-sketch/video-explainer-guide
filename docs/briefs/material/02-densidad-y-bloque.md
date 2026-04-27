---
decision: material/02-densidad-y-bloque
etapa: material
pregunta: ¿Cuánta información (texto, ideas, elementos visuales) cabe en un bloque sin saturar la memoria de trabajo?
fuentes:
  - P1-§2.1                   # CLT — límites de memoria de trabajo
  - P1-§2.3-#1                # coherencia (Mayer 1)
  - P1-§2.3-#3                # redundancia (Mayer 3)
  - P1-§2.4                   # segmentación / unidad útil
  - P1-§7                     # principios de diseño basados en evidencia
admite-variantes: false
varia-por-eje: [formato]
sync: 2026-04-26
version: 1
---

## Principio aplicable

**La memoria de trabajo procesa unos 4 ± 1 chunks simultáneamente** [P1-§2.1]. Cada elemento adicional en un bloque consume capacidad y reduce el espacio para procesar el concepto principal. La densidad no se mide en "se ve bien" — se mide en cuántos elementos compiten por atención y memoria de trabajo en la misma unidad de consumo.

**Coherencia** [P1-§2.3-#1]: eliminar palabras, imágenes y sonidos irrelevantes mejora aprendizaje. Más no es mejor; lo necesario y nada más.

**Redundancia** [P1-§2.3-#3]: texto en pantalla idéntico a la narración degrada el aprendizaje porque compite por el canal verbal. Aplicado a slides: bullets que el presentador lee literal violan este principio. Aplicado a láminas autoadministradas no aplica (no hay narrador).

Este brief vive **downstream** de secuenciación (decide 01) y **upstream** de soporte visual (decide 03). Aquí solo se calibra cuánto cabe; en 03 se decide qué visual va con qué.

## Casos

- **Lámina autoadministrada (set yoga, capítulo tipo)**: 1 título + 3-4 paneles ilustrados + 1-2 cajas de "concepto clave" + footer "para estudiar" con 4-6 términos. ~80 palabras de texto integrado total. El lector controla el ritmo, así que tolera más densidad que un slide.
- **Slide TED-style** [P1-§2.3-#3]: 1 título + 1 visual hero + ≤3 bullets de 5-7 palabras + speaker notes ilimitadas con la prose completa. El presentador agrega información hablada; el slide es ancla, no documento.
- **Sección de long-form editorial** [P1-§2.4]: 1 H2 + 200-400 palabras de prose + 1-2 visualizaciones embebidas con caption. La lectura activa permite procesar más por unidad porque el lector pausa y relee a su ritmo.

## Anti-patrón

**Lámina sobrecargada** (8+ paneles, 5 cajas de texto, timeline complicado): el espectador no sabe por dónde empezar a leer y gasta capacidad en parsing de layout, no en el concepto [P1-§2.1]. Si el preview se ve "lleno", recortar.

**Bullets completos en presentación en vivo** [P1-§2.3-#3]: el presentador termina leyendo lo que está escrito. La audiencia procesa dos canales verbales redundantes y aprende menos que con cualquiera por separado. Bullets son anclas (3-7 palabras), no transcripción.

**"Si reduces la fuente, cabe"** [P1-§7]: tipografía pequeña por carga excesiva no resuelve el problema de densidad — solo lo oculta visualmente. Si tienes que reducir el font para que quepa, eliminá contenido o divide el bloque.

## Heurística numérica

- **Lámina:** 1 concepto principal + 2-4 elementos visuales + ≤80 palabras de texto integrado total.
- **Slide:** 1 concepto + 1 visual hero + ≤25 palabras visibles + speaker notes ilimitadas.
- **Sección de long-form:** 1 H2 + 200-400 palabras + 1-2 visualizaciones.
- **Regla universal** [P1-§2.3-#1]: si tienes que reducir el font de body para que el contenido quepa en la unidad, eliminá contenido. No hay excepción válida.

## Ajuste por eje

### Por `formato`

- **`lamina`:** densidad media-alta. Visual integrado al texto. Header + 3-4 paneles + cajas concepto-clave + footer "para estudiar". El lector pausa y relee a su ritmo, así que tolera más por unidad. Tope ~80 palabras + 4 elementos visuales.
- **`slide`:** densidad baja. 1 visual hero + bullets cortos como anclas (3-7 palabras) + speaker notes con la prose completa. El canal hablado lleva la información; el slide refuerza visualmente sin competir.
- **`long-form`:** densidad alta. Prose completa por sección, 200-400 palabras + visualización embebida con caption. La lectura activa secuencial permite mayor profundidad por unidad. Headings descansan la lectura cada N párrafos.

## Conflictos conocidos

**Cliente que pide "más información por slide para que sirva como handout"**: confunde dos formatos. La solución es producir el slide deck *y* el long-form derivado del mismo Didactic Brief — el costo marginal es bajo porque ambos comparten la secuencia y los conceptos. No hay slide que sirva bien como handout.

**Tema realmente denso vs unidades sub-divisibles** [P1-§2.4]: si el concepto del bloque genuinamente requiere más capacidad de la que el formato permite, dividirlo en dos bloques o pasar a un formato más generoso (lámina → long-form, slide → lámina + speaker notes extensas).

## Salida esperada

Para cada bloque del Didactic Brief, una nota explícita:

- **Densidad target:** baja / media / alta.
- **Conteo de palabras estimado** (texto que el consumidor verá literalmente, no speaker notes).
- **Número de elementos visuales** (paneles, diagramas, fotos).
- **Si aplica:** dónde rompe el cap (señal de que el bloque debe sub-dividirse en 02-secuenciacion).
