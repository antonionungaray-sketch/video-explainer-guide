---
decision: guion/02-hook
etapa: guion
pregunta: ¿Cómo captura atención bottom-up y promete recompensa cumplible?
fuentes:
  - P1-§1.1                     # saliencia bottom-up
  - P1-§1.3                     # anticipación dopaminérgica
  - P1-§2.3-#7                  # pre-entrenamiento (conflicto hooks muy cortos)
  - P1-§7                       # refutación "8s de atención"
  - P2-idea-guion-patrones
  - P2-idea-guion-hooks
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-veritasium
  - P2-ficha-kurzgesagt
  - P1-§6.1                     # misconception/cambio conceptual
admite-variantes: true
varia-por-eje: [arco-dominante, objetivo-cognitivo, plataforma]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Captura bottom-up + promesa cumplible.** Los primeros 5-10s el cerebro
procesa saliencia (cambio, contraste, rostro, movimiento) antes de
engagement voluntario [P1-§1.1]. La saliencia compra ~2-3s; retenerla
requiere una **promesa** (stakes: qué gana o pierde el espectador) que
el video cumple progresivamente [P1-§1.3]. Si la promesa se rompe, error
de predicción dopaminérgica negativo erosiona la disposición a continuar.

**Refutar pseudociencia:** no existe "atención de 8s" como capacidad general
[P1-§7]. La ventana de 15s es convención de plataforma, no biología.

## Casos

- **Fireship `Bun in 100s`** [P2-ficha-fireship]: hook 0-3s con pregunta
  provocativa + logo animado. CCN-fit directo con el título. WPM ~235 desde
  el primer segundo.
- **Midudev `¿Qué es Vite?`** [P2-ficha-midudev]: hook con stake de
  productividad ("tu webpack tarda 45s, mira esto"), muestra resultado
  antes de explicar. Hispano, WPM ~188.
- **Veritasium** [P2-ficha-veritasium]: hook con pregunta contraintuitiva
  ("la mayoría de gente contesta mal esto — ¿tú también?"). Stake
  cognitivo antes que económico.
- **Kurzgesagt** [P2-ficha-kurzgesagt]: hook con afirmación dramática +
  animación isotype densa. WPM bajo (~150) compensado por canal visual
  muy cargado.

## Anti-patrón

**"Hola soy X y hoy vamos a hablar de Y."** Presentación del creador en
los primeros 10s sin stake y sin payoff visual — el canal verbal se gasta
describiendo al creador en lugar de prometer valor. Correlaciona con
caídas de retention en los primeros 30s (observación estructural pilar 2,
entries 16-21).

## Heurística numérica

- **Duración del hook:** ≤15s (convención, no ciencia).
- **Confirmación visual del título:** ≥1 frame en 0-5s que muestra el
  resultado prometido por el título (CCN-fit).
- **Densidad de palabras:** 25-45 palabras en tutoriales técnicos (WPM
  alto); 15-25 en divulgación con animación densa.

## Ajuste por eje

### Por `arco-dominante`

- **`expositivo`:** hook = pregunta provocativa o afirmación wow-scale que el video cumple. Fireship, Veritasium, Kurzgesagt.
- **`narrativo`:** hook = imagen/escena concreta en media res que abre el mundo de la historia. Adam Curtis, Kurzgesagt largos.
- **`argumentativo`:** hook = objeto cultural + observación personal inesperada. No declara la tesis; la insinúa. Nerdwriter, Contrapoints.
- **`performativo`:** hook = estado inicial + goal concreto ("hoy vamos a X"). Tutorial técnico, how-to, live stream.
- **`conversacional`:** hook = intro escrita del anfitrión presentando al invitado en 1-2 min (la única parte guionada del formato). Lex Fridman.

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** stake utilitario — "podrás hacer X al final", "ahorrarás Y tiempo".
- **`corregir-intuicion`:** stake epistémico — contraste con la intuición errónea explícito. "Probably you think X; actually Y." [P1-§6.1].
- **`decidir-informado`:** stake comparativo — "¿deberías adoptar X o Y?". Invita a decidir durante el video.
- **`orientarse`:** stake de mapeo — "este dominio funciona así, te lo mostraré". Johnny Harris típico.
- **`formar-opinion`:** stake retórico — afirmación polémica o giro de marco. No cumplible como "aprenderás X"; el cumplimiento es resonancia.
- **`apreciar`:** stake sensorial/estético — imagen o momento que el video expande en significado.

### Por `plataforma`

- **`long-form-horizontal`:** hook ≤15s con stake verbal + confirmación visual.
- **`shorts-vertical`:** hook <1s — el primer frame YA carga stake visual. Sin intro posible. Subtitulado obligatorio.
- **`podcast-audio-primario`:** no aplica el hook visual; la intro escrita del anfitrión es el hook audio. 1-2 min aceptable.
- **`live-with-vod`:** hook emerge orgánicamente; no prescribible. En el re-upload VOD, edit-down agrega hook post-hoc.
- **`corporate-lms`:** audiencia captiva — el hook es menos crítico; reemplaza por setup claro del objetivo del módulo.

## Conflictos conocidos

- **Hooks muy cortos (3-5s) por imitación a Shorts** [P2-idea-guion-hooks]
  contradicen el principio de pre-entrenamiento [P1-§2.3-#7] en tutoriales
  técnicos: no alcanzan a establecer el contexto mínimo. **Flaggear al
  usuario** cuando aplica, no resolver en silencio.

## Salida esperada

Hook de ≤15s con:
- Stake verbal explícito (qué gana/pierde el espectador),
- Frame de confirmación visual del título en 0-5s,
- Cero auto-presentación del creador.
