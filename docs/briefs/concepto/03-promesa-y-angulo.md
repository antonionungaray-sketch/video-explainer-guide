---
decision: concepto/03-promesa-y-angulo
etapa: concepto
pregunta: ¿Qué promete este video y qué ángulo elegimos para diferenciarlo (CCN-fit)?
fuentes:
  - P1-§1.1                     # captura bottom-up
  - P1-§1.3                     # anticipación dopaminérgica, promesa cumplible
  - P1-§6.2                     # Zeigarnik / bucles abiertos
  - P2-idea-guion-patrones      # CCN-fit, hook por nicho, open loop
  - P2-idea-guion-casos         # casos de éxito y reframings
  - P2-ficha-veritasium         # ángulo contraintuitivo + demo física
  - P2-ficha-3b1b               # ángulo anecdótico → concepto duro
  - P2-ficha-fireship           # ángulo compresión radical
  - P1-§6.1                     # misconception / open loop epistémico
admite-variantes: true
varia-por-eje: [arco-dominante, objetivo-cognitivo]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**La promesa es el contrato que el video firma con el espectador en los
primeros 5-15s y cumple progresivamente** [P1-§1.3]. La saliencia
bottom-up del thumbnail/título compra atención inicial [P1-§1.1]; la
promesa la sostiene. Si la promesa se rompe, error de predicción
dopaminérgica negativo erosiona disposición a continuar y a confiar en
el creador en futuros videos.

El **ángulo** es el cómo distintivo: el mismo objetivo puede prometerse
desde varios encuadres. El filtro práctico es **CCN Fit** — el video
debe poder satisfacer simultáneamente al viewer Core (audiencia regular),
Casual (audiencia amplia interesada) y New (descubrimiento)
[P2-idea-guion-patrones]. Cita Galloway: "a 20% better title could mean
double, triple, quadruple — a 100 times more views."

El **open loop título → cierre en cold-open** convierte el packaging en
mecanismo cognitivo [P1-§6.2]: el thumbnail+título crean un loop que el
video cierra, alineando el efecto Zeigarnik con la práctica profesional
de packaging.

## Casos

- **Compresión radical** [P2-ficha-fireship]: ángulo "todo lo esencial
  en 100 segundos". Promesa: ahorro de tiempo + densidad. Funciona solo
  con audiencia pre-entrenada que ya tiene el contexto.
- **Demo física contraintuitiva** [P2-ficha-veritasium]: "How does a
  zipper actually work? try to push down..." — invitación a participar
  + revelación. Promesa: cambio de modelo mental sobre algo cotidiano.
- **Anécdota íntima → concepto duro** [P2-ficha-3b1b]: "whenever I look
  at the back of my beloved 7-month-old baby's head..." → Hairy Ball
  Theorem. Promesa: matemática profunda accesible vía familiaridad.
- **Reframing honesto, no clickbait** [P2-idea-guion-casos]: Andrew
  Millison "How the UN is Holding Back the Sahara Desert" → 12M views.
  El reframing funciona si el video entrega lo prometido.

## Anti-patrón

**Clickbait que la promesa no cumple** [P2-idea-guion-casos]. El open
loop del título se cierra con decepción. Anti-patrón absoluto: destruye
autoridad y reseteacero la confianza acumulada.

**Hook genérico desconectado del ángulo:** "te voy a contar todo sobre
X" sin un ángulo distintivo. Si el viewer no puede decir en una frase
qué hace este video distinto del resto en el mismo tema, no hay CCN Fit
y no hay descubrimiento [P2-idea-guion-patrones].

**Auto-presentación del creador antes de la promesa** — gasta el canal
verbal en quién soy en lugar de qué entrego. 10/10 creators del atlas
evitan este patrón.

## Heurística numérica

- **Promesa formulable en ≤15 palabras.** Si no entra, no es una
  promesa — es una sinopsis.
- **CCN Fit verificación:** identificar 1 razón por la que cada uno de
  los tres viewers (Core, Casual, New) querría ver este video. Si
  alguno no aplica, ajustar ángulo o aceptar audiencia más estrecha
  [P2-idea-guion-patrones].
- **Ángulo distintivo:** poder responder "vs ¿qué video existente?
  ¿qué hace este distinto?" en una frase.

## Ajuste por eje

### Por `arco-dominante`

- **`expositivo`:** promesa = acceso a conocimiento organizado ("entenderás X"). Ángulo distintivo = compresión, densidad o pre-entrenamiento específico.
- **`narrativo`:** promesa = viaje a través de una historia ("descubrirás cómo Z llegó a ser"). Ángulo = apertura narrativa + cierre con revelación. Open loop temporal, no conceptual.
- **`argumentativo`:** promesa = reframing o posición sostenible ("te mostraré por qué Y"). Ángulo = tesis distintiva. El CCN-fit se afina: viewer Core ya tiene opinión parcial, New recibe introducción al debate.
- **`performativo`:** promesa = capacidad nueva ("podrás hacer X al final"). Ángulo = atajo, herramienta, flujo distintivo.
- **`conversacional`:** promesa = acceso a expertise viva ("escucharás a Z hablar sobre W"). El ángulo lo lleva el invitado, no el anfitrión. CCN-fit atípico: Core sigue al anfitrión, Casual vino por el invitado.

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** promesa utilitaria verificable. Cumplida o no.
- **`corregir-intuicion`:** promesa de sorpresa epistémica ("lo que creías sobre X está mal"). Open loop fuerte con el hook [P1-§6.1]. Kurzgesagt y Veritasium viven aquí.
- **`decidir-informado`:** promesa de evaluación comparativa clara. Modelo: "deberías elegir X si Y, Z si W".
- **`orientarse`:** promesa de mapa mental ("entenderás el landscape de X"). Johnny Harris y Vox Atlas.
- **`formar-opinion`:** promesa retórica ("te mostraré por qué deberías pensar Y"). Nerdwriter, Contrapoints. NO cumplible como "acción observable"; cumplimiento = resonancia, no ejecución.
- **`apreciar`:** promesa sensorial/estética ("te enseñaré a ver X así"). Matt D'Avella, ciertos ensayos. Cumplimiento = cambio en percepción del objeto.

## Conflictos conocidos

**Densidad para audiencia pre-entrenada vs accesibilidad para casual**
[P2-idea-guion-patrones] vs [P1-§1.1]. Compresión radical Fireship-style
maximiza Core pero pierde New sin pre-entrenamiento. Decisión upstream
del usuario; flaggear el trade-off, no resolver en silencio.

## Salida esperada

Tres frases:

- **Promesa:** "[qué entrega el video, ≤15 palabras]".
- **Ángulo:** "[cómo distintivo vs alternativas existentes]".
- **CCN Fit:** "[por qué cada uno de Core/Casual/New querría verlo]".
