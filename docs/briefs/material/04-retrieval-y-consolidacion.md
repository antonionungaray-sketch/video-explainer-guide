---
decision: material/04-retrieval-y-consolidacion
etapa: material
pregunta: ¿Dónde y cómo das al lector/espectador oportunidades para recuperar activamente lo aprendido?
fuentes:
  - P1-§6.3                   # retrieval / testing effect, desirable difficulties
  - P1-§8.1                   # retrieval checkpoints dentro del contenido
  - P1-§8.2                   # espaciamiento (Cepeda)
  - P1-§8.3                   # variedad contextual
  - P1-§10.4                  # consolidación retórica vs retrieval instruccional
  - P1-§12.4                  # framework SUCCES (memorabilidad)
admite-variantes: true
varia-por-eje: [objetivo-cognitivo, formato]
sync: 2026-04-26
version: 1
---

## Principio aplicable

**Testing effect** [P1-§6.3]: recuperar información supera consistentemente a releerla para retención a largo plazo (Roediger & Karpicke 2006; Adesope et al. 2017). No es intuitivo — recuperar se siente más difícil, pero esa dificultad es exactamente lo que produce la consolidación. Bjork llama a esto "desirable difficulty".

**En material estático no hay quiz embebido**, pero hay equivalentes funcionales: cajas "concepto clave" como anclaje, glosarios "para estudiar" como retrieval invitado pasivo, recapitulación visual de cierre, espaciamiento implícito cuando el lector vuelve días después [P1-§8.2].

**Distinción crítica** [P1-§10.4]: no toda consolidación es retrieval instruccional. Para `formar-opinion` y `apreciar`, la consolidación es retórica (eco temático, imagen culminante) — insertar quiz rompe el género. Esta distinción es la misma que opera en `guion/05-retrieval` (video).

## Casos

- **Glosario "Para estudiar" al pie de cada lámina** [P1-§6.3]: el set de yoga lista 4-6 términos por capítulo (Vedas, Shruti, Varna, Purusha Sukta...). Es retrieval invitado pasivo — el lector puede repasar sin releer el cuerpo. Funciona como espaciamiento implícito cuando vuelve días después [P1-§8.2].
- **Caja "Concepto clave" inline** [P1-§8.1]: destaca el concepto principal del bloque en bloque tipográfico contrastante. No es retrieval por sí mismo, pero crea ancla de fácil recuperación posterior — el lector lo ve antes de leer el cuerpo y al terminar.
- **Capítulo de cierre como recap visual** [P1-§8.3]: la lámina del capítulo 9 del set de yoga muestra una red conectando los 7 capítulos anteriores con sus iconos representativos. Es retrieval implícito — el lector reconstruye mentalmente el contenido de cada nodo. Variedad contextual: el mismo material visto como red en vez de como secuencia.
- **Frase culminante en formato `formar-opinion`** [P1-§10.4]: en un long-form de ensayo, la última oración retoma una imagen del primer párrafo, transformada por el recorrido. Consolidación retórica, no instruccional.

## Anti-patrón

**Quiz formal embebido en el medio equivocado**: poner "¿qué es Brahman? a) ... b) ... c) ...?" en una lámina rompe el modo de consumo. El medio estático tolera retrieval invitado, no examen. Quiz va en LMS o handout aparte.

**Sin consolidación de cierre** [P1-§12.4]: terminar el set/articulo sin un bloque de síntesis es perder la oportunidad principal de retrieval del medio. La idea simple a la que el material reduce ("la frase que si el lector recuerda una sola, recuerda esta") debe aparecer explícita al cierre.

**Forzar retrieval formal en `formar-opinion` o `apreciar`** [P1-§10.4]: contamina el género — produce el híbrido desafortunado video-ensayo-con-quiz. La consolidación retórica es el modo correcto.

**Pregunta retórica sin pausa para respuesta**: "¿Por qué crees que es así? Bueno, es porque..." no es retrieval — el cerebro no tiene tiempo de generar. En material estático esto se ve como pregunta + respuesta inmediata adyacente; el lector no genera, solo lee.

## Heurística numérica

- **Cada lámina con "para estudiar":** 3-6 términos clave [P1-§6.3]. Más es ruido; menos pierde valor de espaciamiento.
- **Cada N capítulos un recap visual:** N = 5-7 dependiendo del tema. Antes de 5 es prematuro; después de 7 el lector ya perdió el contexto.
- **Bloque de cierre/síntesis: 1 por set, ineludible** [P1-§12.4]. Idea simple a la que el material reduce.
- **Variedad contextual** [P1-§8.3]: el cierre presenta el material en un orden o estructura distinta a la del cuerpo (ej. red en vez de secuencia, comparación en vez de cronología). Mismo contenido, contexto distinto.

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** retrieval explícito en cada bloque — "intenta hacer X antes de leer la respuesta". Termina con ejercicio aplicado de transferencia [P1-§8.3].
- **`corregir-intuicion`:** predice-antes-de-ver al inicio de cada bloque ("¿qué crees que pasa? Pausa y piensa antes de seguir"). Cierre con contraste explícito intuición vs realidad. Ligado al diseño de confusión productiva.
- **`decidir-informado`:** matriz comparativa final como retrieval — el lector clasifica las opciones contra criterios establecidos en bloques anteriores. Activación de los criterios como recall.
- **`orientarse`:** retrieval ligero — "recapitulemos el mapa" al cerrar secciones. Mapa global de cierre que conecta todos los nodos visitados [P1-§8.3]. Glosarios densos de términos clave.
- **`formar-opinion`:** **NO retrieval formal** [P1-§10.4]. Consolidación retórica: cita culminante, retorno a imagen inicial, eco temático. Insertar quiz rompe el ensayo.
- **`apreciar`:** **NO retrieval formal** [P1-§10.4]. Consolidación por resonancia sensorial — re-ver la imagen inicial transformada con la densidad del recorrido completo.

### Por `formato`

- **`lamina`:** caja "concepto clave" + footer "para estudiar" en cada lámina. Lámina final = recap visual con red/timeline/mapa de cierre.
- **`slide`:** speaker notes con preguntas para audiencia ("antes de seguir, ¿qué pensaron?"). Slide final con resumen visual o "lo que vimos hoy".
- **`long-form`:** glosario al final, preguntas en H3 cuando aplica, "tres ideas para llevarte" o equivalente al cierre.

## Conflictos conocidos

**Cliente que pide quiz embebido en lámina/long-form**: confunde el medio. Sugerir:
1. Si el objetivo cognitivo lo admite (`adquirir-habilidad` / `corregir-intuicion`), producir un handout LMS aparte derivado del Didactic Brief.
2. Si el objetivo es `formar-opinion` / `apreciar`, mantener consolidación retórica y rechazar el quiz [P1-§10.4].

**Tema breve sin espacio para recap explícito** (ej. lámina única, post corto): la consolidación se condensa en la última caja del bloque. No es óptimo pero es honesto al medio.

## Salida esperada

Para el Didactic Brief, una sección "Consolidación" que liste:

- **Recursos por bloque:** cajas "concepto clave" (qué destaca) + glosario "para estudiar" (qué términos).
- **Bloques de recap explícito:** cuándo (cada N capítulos) y cómo (red / timeline / mapa).
- **Bloque de cierre/síntesis:** la idea simple a la que el material se reduce [P1-§12.4]. Una frase.
- **Si aplica:** retrieval explícito por bloque (predice-antes-de-ver, ejercicio aplicado, comparación final).
