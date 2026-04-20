---
decision: edicion/01-pacing
etapa: edicion
pregunta: ¿Dónde cortar y cuándo sostener una toma, según la densidad cognitiva del segmento?
fuentes:
  - P1-§4.1                    # movimiento como activador bottom-up
  - P1-§4.4                    # frecuencia de cortes: heurística, no ley
  - P1-§2.3-#1                 # coherencia (cortes decorativos suman carga extraña)
  - P2-edicion-patrones
  - P2-edicion-variantes
  - P2-edicion-antipatrones    # transiciones decorativas
  - P2-ficha-fireship          # 10-15 cortes/min formato denso
  - P2-ficha-coding-train      # cortes naturales del live-coding
  - P2-ficha-kurzgesagt        # animación-driven sin cortes de cámara
  - P2-ficha-veritasium        # cortes editoriales cinematográficos
admite-variantes: true
varia-por-eje: [grado-edicion, arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Movimiento estratégico re-enfoca; movimiento continuo agota** [P1-§4.1]. El
sistema bottom-up se activa con cambios (corte, zoom, movimiento de cámara).
Cada activación recluta atención; demasiadas activaciones saturan. La
frecuencia óptima NO es universal — depende de densidad del contenido y
carga ya presente en los otros canales [P1-§4.4].

**Coherencia** [P1-§2.3-#1]: cortes con función (marcar cambio de idea,
destacar detalle, segmentar bloque) son carga germana. Cortes decorativos
sin función son carga extraña pura.

## Casos

- **Fireship** [P2-ficha-fireship]: 10-15 cortes/min sobre contenido denso
  técnico. El ritmo sostiene atención bottom-up alineado con WPM alto
  (~235). Funciona porque audiencia pre-entrenada procesa rápido.
- **The Coding Train** [P2-ficha-coding-train]: cortes naturales donde el
  live-coding tiene pausa/error. No fuerza ritmo — deja que el proceso
  marque la cadencia. Audiencia aprende observando el flujo de trabajo.
- **Kurzgesagt** [P2-ficha-kurzgesagt]: **cero cortes de cámara**. El ritmo
  lo marca la transición de animación. Canal visual a máxima carga; canal
  auditivo compensa con WPM bajo (~150) [P2-edicion-patrones].
- **Veritasium** [P2-ficha-veritasium]: cortes editoriales cinematográficos
  entre face-cam, B-roll y entrevistas. Ritmo medio, alineado con flujo
  narrativo.

## Anti-patrón

**Cortes con transiciones decorativas (whoosh, glitch, spin) entre cada
toma** [P2-edicion-antipatrones]: violan coherencia, añaden carga extraña
sin aportar. Cero de los 10 creators del atlas usan esto.

**Ritmo de cortes uniforme para todo el video.** El pacing debe variar
con la densidad de cada segmento (rápido en intro/memes, lento en demo
densa o retrieval checkpoint).

## Heurística numérica

- **Tutorial técnico denso:** 10-15 cortes/min (rango Fireship).
- **Tutorial técnico medio/largo:** 3-6 cortes/min (rango Coding Train /
  MoureDev).
- **Divulgación animada:** 0 cortes de cámara; transiciones de animación
  marcan el ritmo (1 transición cada 3-8s).
- **Divulgación documental:** 4-8 cortes/min (rango Veritasium).
- **Regla de pulgar:** WPM alto tolera (y necesita) más cortes; WPM bajo
  compensa con canal visual denso → menos cortes duros, más animación.

## Ajuste por eje

### Por `grado-edicion`

- **`heavy`:** pacing diseñado al detalle — 10-15 cortes/min formato denso (Fireship), o animación-rhythm continuo (Kurzgesagt, 3B1B). El editor controla todo.
- **`medium`:** pacing con cortes rítmicos menos densos; mantener takes largos cuando el contenido lo pide.
- **`light`:** pacing decidido por el speaker. Cortes multi-cámara únicamente; no recomposición rítmica. TED, podcast.
- **`zero`:** **no aplica** — pacing = tiempo real de la sesión. Sin control editorial.

### Por `arco-dominante`

- **`performativo`:** pacing atado al procedimiento real — sostén la toma mientras dura el comando/acción; corta al terminar.
- **`narrativo` / `argumentativo`:** pacing dramatúrgico — pausas para efecto, aceleración en clímax.
- **`expositivo`:** pacing informativo uniforme con pausas en transiciones conceptuales.
- **`conversacional`:** pacing = ritmo natural del diálogo; cortes mínimos para evitar cross-talk.

## Conflictos conocidos

- **Shorts/TikTok cultura de cortes cada 1-2s** [P2-edicion-variantes]
  aplicado a tutoriales técnicos viola §4.4 — la habituación visual del
  aprendiz satura antes de poder procesar el concepto. Flaggear al
  usuario que imita formato vertical en contenido largo.

## Salida esperada

Plan de pacing por bloque del guión:
- Cortes/min objetivo por bloque (no un número único para todo el video).
- Marcadores donde el corte tiene función explícita (cambio de bloque,
  destaque de detalle, transición de open loop).
- Lista de cortes a eliminar si heredados de crudo: cortes decorativos
  sin función.
