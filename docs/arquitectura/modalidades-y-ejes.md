---
titulo: Modalidades y ejes estructurales
tipo: arquitectura
version: 1.0
fecha: 2026-04-19
estado: vigente
---

# Modalidades y ejes estructurales

Este documento es la **fuente de verdad** para cómo el toolkit modela la diversidad de video explainer con intención pedagógica. Define:

- Los **5 ejes estructurales** que describen cualquier video dentro del scope.
- Las **12 modalidades** como *presets* nombrados — combinaciones frecuentes de ejes.
- El **atributo de plataforma** (vertical/short-form) que se compone con cualquier modalidad.
- Cómo las skills consumen esta arquitectura, cómo los briefs la referencian, y cómo se verifica.

Las fases 2-6 de la reforma (pilares, briefs, skills) se construyen contra este documento. Si aquí algo cambia, propaga a las fases derivadas.

---

## 1. Contexto: por qué existe esta arquitectura

El toolkit anterior (`training-video-toolkit` / `learning-video-runbook`) asumía un solo tipo de video: tutorial técnico con formato corto, editado heavy, guionado, con un experto-demostrador. Todos los principios del pilar 1 (Mayer, Sweller) aplican bien a ese caso. Los briefs estaban calibrados para eso.

Pero el scope real declarado —**cualquier video con intención pedagógica**— incluye modalidades muy distintas: un documental narrativo de 40 minutos, un ensayo fílmico, un live stream de programación, un podcast de 3 horas con un experto invitado. Aplicar las mismas decisiones a todos estos casos produce **prescripciones contaminantes**: forzar retrieval practice explícito a un documental, o pedir CTA de aplicación a un video-ensayo, genera recomendaciones falsas.

La solución: **extraer las primitivas** (ejes) de las que depende cada decisión y **declarar explícitamente** cómo varía cada decisión por cada eje. El creador elige un preset de arranque; los briefs saben qué sub-bloque usar según los ejes resultantes.

---

## 2. Los 5 ejes estructurales

Cada video explainer dentro del scope se describe por el valor en estos 5 ejes. Los ejes son (en la medida de lo razonable) **ortogonales**: cambiar uno no obliga a cambiar otros. Las modalidades son combinaciones recurrentes.

### 2.1 Arco dominante

**Pregunta:** ¿Cuál es la estructura narrativa principal del video?

| Valor | Descripción | Ejemplos |
|---|---|---|
| `expositivo` | Presenta información organizada por temas; voz explicativa. | Veritasium corto, explainer comercial, onboarding |
| `narrativo` | Cuenta una historia con arco temporal (inicio → conflicto → resolución). | Kurzgesagt largo, Adam Curtis, personal essay |
| `argumentativo` | Defiende una tesis; progresión dialéctica (premisa → evidencia → conclusión). | Nerdwriter, Contrapoints, Lindsay Ellis |
| `performativo` | Demuestra un procedimiento paso a paso en tiempo (pseudo-)real. | Tutorial técnico, how-to, live stream educativo |
| `conversacional` | Diálogo entre 2+ personas; emergente más que planeado. | Podcast audiovisual, Lex Fridman, Huberman con invitado |

**Brief-level impact:** afecta estructura del guión, hook, segmentación, pacing, transiciones, end-screens.

### 2.2 Objetivo cognitivo

**Pregunta:** ¿Qué quieres que el espectador sepa, pueda o piense después?

| Valor | Descripción | Ejemplos |
|---|---|---|
| `adquirir-habilidad` | Ejecutar una tarea o procedimiento nuevo. | Tutorial de Blender, curso Fireship |
| `corregir-intuicion` | Reemplazar un modelo mental erróneo por uno correcto. | Veritasium sobre física contra-intuitiva |
| `decidir-informado` | Comparar opciones o formar criterio para una decisión. | Explainer comercial, review comparativo |
| `orientarse` | Construir mapa mental de un dominio o contexto. | Johnny Harris sobre geopolítica, documental histórico |
| `formar-opinion` | Adoptar (o cuestionar) una tesis o marco valorativo. | Video-ensayo, Contrapoints |
| `apreciar` | Desarrollar sensibilidad estética o reconocimiento de calidad. | Ensayo sobre cinematografía, personal essay sobre arte |

**Brief-level impact:** define el objetivo del Concept Brief, condiciona retrieval/consolidación, métricas de efecto, CTA.

### 2.3 Grado de edición

**Pregunta:** ¿Cuánta post-producción hay entre grabación y video final?

| Valor | Descripción | Ejemplos |
|---|---|---|
| `heavy` | Múltiples fuentes, inserts, graphics, color, sound design. 1 minuto final = horas de edit. | Kurzgesagt, Nerdwriter, Veritasium |
| `medium` | Cortes rítmicos, algunos inserts, subtítulos, cleanup de audio. | How-to intermedio, Ali Abdaal |
| `light` | Cortes mínimos, limpieza básica, quizás capítulos. | TED, podcast audiovisual |
| `zero` | Stream o grabación en vivo publicada tal cual o casi. | Live stream educativo, webinar |

**Brief-level impact:** afecta coherence principle (música, overlays), pacing, signaling, overlays auxiliares, workflow de post.

### 2.4 Grado de guión

**Pregunta:** ¿Cuánto está escrito antes de grabar?

| Valor | Descripción | Ejemplos |
|---|---|---|
| `guionado` | Script palabra-por-palabra, leído o memorizado. | Nerdwriter, Kurzgesagt, TED ensayado |
| `semi-guionado` | Outline detallado con frases clave; el presentador improvisa conectores. | Veritasium, Johnny Harris, conferencias académicas |
| `improvisado` | Prep temático pero sin guión escrito; diálogo o demostración orgánica. | Podcast, live stream, tutorial casual |

**Brief-level impact:** afecta segmentación, signaling, pre-training, coherence (qué tan controlada está la densidad).

### 2.5 Rol del presentador

**Pregunta:** ¿Desde qué posición enunciativa habla la voz que guía el video?

| Valor | Descripción | Ejemplos |
|---|---|---|
| `experto-neutral` | Voz autorizada en 2a/3a persona; explica sin aparecer como personaje. | Fireship, Veritasium, explainer comercial |
| `narrador-1a-persona` | Voz autoral subjetiva; yo opino, yo investigué, yo descubrí. | Nerdwriter, Contrapoints, Ali Abdaal |
| `narrador-omnisciente` | Voz de autor no-diegética; 3a persona impersonal, voice-of-god. | Adam Curtis, Kurzgesagt largos, docus BBC |
| `investigador` | Voz que indaga abiertamente, documenta el proceso de descubrimiento. | Johnny Harris, Vox Atlas, periodismo analítico |
| `demostrador` | Voz que ejecuta y muestra en cámara mientras describe. | Tutorial técnico, how-to, maker |
| `conversador` | Uno entre varios en diálogo; sin autoridad única. | Podcast con co-host |
| `anfitrion-de-experto` | Entrevistador que guía a un invitado experto. | Lex Fridman, Huberman con invitado |

**Brief-level impact:** afecta voz/registro, voiceover, encuadre, b-roll vs talking head, audience address.

---

## 3. Las 12 modalidades como presets

Una **modalidad** es un preset nombrado: una combinación frecuente y reconocible de valores en los 5 ejes. Los presets sirven tres funciones:

1. **Carga semántica para el modelo.** "Es un video-ensayo" se parsea más rico que una tupla de 5 valores.
2. **Punto de arranque para el creador.** Elige el preset más cercano; la skill auto-llena ejes; override lo que divergue.
3. **Agrupación para pilar 2 y fichas.** Los creadores ejemplares se agrupan por modalidad, no por tupla.

Ninguna modalidad es *pura* — los presets son promedios. Cualquier creador real tiene micro-divergencias. Por eso los ejes son la fuente de verdad y los presets son alias.

### 3.1 Tabla resumen

| # | Modalidad | Arco | Objetivo | Edición | Guión | Rol |
|---|---|---|---|---|---|---|
| 1 | Instruccional / formativa | performativo | adquirir-habilidad | heavy | guionado | demostrador |
| 2 | Divulgativa | expositivo | corregir-intuicion | heavy | guionado | experto-neutral |
| 3 | Explainer comercial / producto | expositivo | decidir-informado | heavy | guionado | experto-neutral |
| 4 | How-to / performance | performativo | adquirir-habilidad | medium | semi-guionado | demostrador |
| 5 | Onboarding | expositivo | orientarse | heavy | guionado | experto-neutral |
| 6 | Documental narrativo pedagógico | narrativo | orientarse | heavy | guionado | narrador-omnisciente |
| 7 | Video-ensayo | argumentativo | formar-opinion | heavy | guionado | narrador-1a-persona |
| 8 | Periodismo analítico visual | argumentativo | orientarse | heavy | guionado | investigador |
| 9 | Conferencia / charla grabada | argumentativo | formar-opinion | light | guionado | experto-neutral |
| 10 | Live stream educativo | performativo | adquirir-habilidad | zero | improvisado | demostrador |
| 11 | Podcast audiovisual educativo | conversacional | orientarse | light | improvisado | anfitrion-de-experto |
| 12 | Personal essay pedagógico | narrativo | apreciar | medium | semi-guionado | narrador-1a-persona |

### 3.2 Fichas de preset

#### 1. Instruccional / formativa

- **Ejes default:** performativo · adquirir-habilidad · heavy · guionado · demostrador
- **Ejemplos:** Fireship, Mike Meyers CompTIA, yvonnickfrin
- **Fichas pilar 2 asociadas:** `[P2-ficha-fireship]`, `[P2-ficha-mike-meyers]`
- **Briefs donde suele divergir:** `guion/05-retrieval` (retrieval explícito fuerte), `publicacion/08-metricas-aprendizaje` (post-test aplicable)
- **Divergencias comunes:** curso corporativo empuja `rol=experto-neutral` en vez de `demostrador`; tutorial casual empuja `edicion=medium`.

#### 2. Divulgativa

- **Ejes default:** expositivo · corregir-intuicion · heavy · guionado · experto-neutral
- **Ejemplos:** Veritasium (cortos), Kurzgesagt (cortos), MinutePhysics, SmarterEveryDay (cortos)
- **Fichas pilar 2 asociadas:** `[P2-ficha-kurzgesagt]`, `[P2-ficha-veritasium]`
- **Briefs donde suele divergir:** `guion/02-hook` (hook debe chocar con la intuición), `edicion/06-b-roll` (visual metáforas heavy)
- **Divergencias comunes:** puede usar `rol=narrador-omnisciente` cuando el canal tiene voz de autor (Kurzgesagt tardío).

#### 3. Explainer comercial / de producto

- **Ejes default:** expositivo · decidir-informado · heavy · guionado · experto-neutral
- **Ejemplos:** walkthroughs de SaaS, product launches, whiteboard animation comercial
- **Fichas pilar 2 asociadas:** (por poblar en fase 3)
- **Briefs donde suele divergir:** `concepto/03-promesa-y-angulo` (promesa = diferenciación frente a alternativas), `guion/08-cta` (CTA comercial explícito)

#### 4. How-to / performance

- **Ejes default:** performativo · adquirir-habilidad · medium · semi-guionado · demostrador
- **Ejemplos:** cocina (Binging with Babish), DIY (Adam Savage Tested), maker (3blue1brown manim tutorials)
- **Fichas pilar 2 asociadas:** (por poblar)
- **Briefs donde suele divergir:** `guion/04-segmentacion` (segmentos por paso procedimental), `edicion/01-pacing` (pacing atado al procedimiento real)

#### 5. Onboarding

- **Ejes default:** expositivo · orientarse · heavy · guionado · experto-neutral
- **Ejemplos:** primer día corporativo, tours de plataforma SaaS, orientación universitaria
- **Fichas pilar 2 asociadas:** `[P2-ficha-onboarding-corporativo]`
- **Briefs donde suele divergir:** `concepto/06-tono-y-restricciones` (formalidad corporativa, compliance), `publicacion/08-metricas-aprendizaje` (certificación, post-test obligatorio)

#### 6. Documental narrativo pedagógico

- **Ejes default:** narrativo · orientarse · heavy · guionado · narrador-omnisciente
- **Ejemplos:** Kurzgesagt largos, Adam Curtis, Netflix docs educativas, The Century of the Self
- **Fichas pilar 2 asociadas:** (por poblar en fase 3 — ficha de nicho `documental-narrativo`)
- **Briefs donde suele divergir:** `guion/03-estructura` (arco temporal de 3 o 5 actos), `edicion/06-b-roll` (archivo, recreación, material original), `guion/05-retrieval` (la consolidación es implícita y evocativa, no explícita)
- **Teoría de referencia (fase 2):** Nichols modes, Renov poetics

#### 7. Video-ensayo

- **Ejes default:** argumentativo · formar-opinion · heavy · guionado · narrador-1a-persona
- **Ejemplos:** Nerdwriter, Contrapoints, Lindsay Ellis, Folding Ideas
- **Fichas pilar 2 asociadas:** (por poblar en fase 3 — ficha de nicho `video-ensayo`)
- **Briefs donde suele divergir:** `guion/03-estructura` (tesis → evidencia → contra-argumento → síntesis), `guion/07-voz-registro` (voz autoral subjetiva explícita), `concepto/02-objetivo` (objetivo = formar opinión, no transferir habilidad)
- **Teoría de referencia (fase 2):** Rascaroli *The Personal Camera*, Corrigan

#### 8. Periodismo analítico visual

- **Ejes default:** argumentativo · orientarse · heavy · guionado · investigador
- **Ejemplos:** Johnny Harris, Vox Atlas, Bloomberg Originals, NYT The Weekly
- **Fichas pilar 2 asociadas:** (por poblar en fase 3 — ficha de nicho `periodismo-visual`)
- **Briefs donde suele divergir:** `edicion/06-b-roll` (datos visualizados, mapas interactivos), `guion/02-hook` (hook de investigación en progreso), `concepto/03-promesa-y-angulo` (promesa = esclarecimiento)
- **Teoría de referencia (fase 2):** Cairo *The Truthful Art*, Tufte, Ware

#### 9. Conferencia / charla grabada

- **Ejes default:** argumentativo · formar-opinion · light · guionado · experto-neutral
- **Ejemplos:** TED, TEDx, keynote académica, charla técnica grabada
- **Fichas pilar 2 asociadas:** (por poblar en fase 3 — ficha de nicho `conferencia-grabada`)
- **Briefs donde suele divergir:** `edicion/01-pacing` (pacing dictado por el speaker), `grabacion/*` (setup multi-cámara, audio de sala), `edicion/07-voiceover` (no aplica — voz ya grabada en vivo)
- **Teoría de referencia (fase 2):** Freeman et al. PNAS 2014 (active learning), Mazur peer instruction, Heath *Made to Stick*

#### 10. Live stream educativo

- **Ejes default:** performativo · adquirir-habilidad · zero · improvisado · demostrador
- **Ejemplos:** ThePrimeagen, Casey Muratori, Tsoding
- **Fichas pilar 2 asociadas:** (por poblar en fase 3 — ficha de nicho `live-stream-educativo`)
- **Briefs donde suele divergir:** casi todos — el `grado-edicion=zero` colapsa la mitad de las decisiones de edición. `guion/05-retrieval` no aplica (no hay guión); la consolidación es verbal y reactiva. `publicacion/03-descripcion-capitulos` se convierte en *post-hoc* si se re-publica.
- **Consideración especial:** si el live se re-edita para long-form (VOD), muta parcialmente a `instruccional` con `grado-edicion=medium`.

#### 11. Podcast audiovisual educativo

- **Ejes default:** conversacional · orientarse · light · improvisado · anfitrion-de-experto
- **Ejemplos:** Lex Fridman, Huberman Lab (con invitado), Sean Carroll Mindscape
- **Fichas pilar 2 asociadas:** (por poblar en fase 3 — ficha de nicho `podcast-audiovisual`)
- **Briefs donde suele divergir:** `edicion/05-subtitulos` (sí aplica, siempre), `guion/04-segmentacion` (capítulos por tema en descripción), `edicion/07-voiceover` (no aplica — no hay VO post), `edicion/06-b-roll` (raro, casi todo talking heads)
- **Teoría de referencia (fase 2):** Forbes & Bonilla sobre podcast pedagógico

#### 12. Personal essay pedagógico

- **Ejes default:** narrativo · apreciar · medium · semi-guionado · narrador-1a-persona
- **Ejemplos:** Ali Abdaal (ensayos reflexivos), Hayden Bleasel, Matt D'Avella
- **Fichas pilar 2 asociadas:** (por poblar en fase 3 — ficha de nicho `personal-essay`)
- **Briefs donde suele divergir:** `concepto/02-objetivo` (objetivo = apreciar / transferir marco de pensamiento), `guion/07-voz-registro` (voz íntima 1a persona), `publicacion/08-metricas-aprendizaje` (métricas de efecto = resonancia, shares, comentarios reflexivos — no post-test)
- **Teoría de referencia (fase 2):** literatura sobre memoir + self-help hybridization

---

## 4. Atributo de plataforma

Separado de la modalidad. Cualquier modalidad puede publicarse en cualquier plataforma; las combinaciones generan ajustes en briefs concretos (publicación, formato, duración).

| Valor | Descripción | Aplica a briefs |
|---|---|---|
| `long-form-horizontal` | YouTube largo, Vimeo, web embed — 16:9, ≥ 3 min típico | Default; la mayoría de briefs existentes están calibrados para este |
| `shorts-vertical` | YouTube Shorts, TikTok, Reels, Stories — 9:16, 15-90s | Fuerza hook <1s, sin intro, subtítulos siempre, pacing altísimo |
| `podcast-audio-primario` | Podcast con video secundario (Spotify, Apple Podcasts video) | Audio primario: loudness/mezcla críticos; video accesorio |
| `live-with-vod` | Transmisión en vivo con VOD posterior | Doble ciclo: live primero, re-edit opcional |
| `corporate-lms` | Distribuido por LMS corporativo (Docebo, Cornerstone, Moodle) | SCORM compliance, track de completion, accesibilidad WCAG estricta |

El atributo se declara en el Concept Brief como `plataforma: shorts-vertical`. Los briefs que dependen de la plataforma declaran `varia-por-plataforma: [shorts-vertical]` (análogo a `varia-por-eje`).

> **Nota:** esta lista puede crecer. En fase 3 se afinan los ajustes por plataforma en los briefs relevantes (concepto/04-formato-y-duracion, guion/02-hook, edicion/05-subtitulos, publicacion/*).

---

## 5. Concept Brief: campo `modalidad:`

El Concept Brief (output de `concept-explainer`) incluye un campo `modalidad:` con la siguiente estructura canónica:

```yaml
modalidad:
  preset: live-stream-educativo          # o 'custom' si los ejes no coinciden con ningún preset
  ejes:
    arco-dominante: conversacional        # nota: divergente del default (performativo)
    objetivo-cognitivo: adquirir-habilidad
    grado-edicion: zero
    grado-guion: improvisado
    rol-presentador: demostrador
  divergencias:                           # opcional, solo cuando algún eje difiere del default del preset
    - eje: arco-dominante
      default: performativo
      elegido: conversacional
      razon: "el creador hace streams dialogados, no monólogos procedimentales"
plataforma: long-form-horizontal
```

Reglas:

1. **Siempre se declaran los 5 ejes**, aunque coincidan con los defaults del preset. El campo es la fuente de verdad que los briefs leen.
2. **Si al menos un eje difiere del default del preset,** se llena `divergencias:` con los que difieren. Si no, `divergencias:` se omite.
3. **Si ningún preset calza,** `preset: custom`. No hay defaults implícitos; los 5 ejes son declaración explícita.
4. **El campo `plataforma:`** es independiente del campo `modalidad:` — siempre obligatorio.

### 5.1 Flujo en `concept-explainer`

1. Skill presenta los 12 presets con breve descripción + ejemplos.
2. Creador elige uno (o "ninguno / custom").
3. Si eligió preset: skill muestra los ejes default del preset y pregunta "¿mantener o cambiar?" por cada uno. Cualquier cambio queda registrado en `divergencias:`.
4. Si eligió custom: skill pregunta los 5 ejes uno a uno.
5. Skill pregunta `plataforma:` (default `long-form-horizontal`).
6. Concept Brief se escribe con `estado: draft`. El creador lo revisa. Al aprobar, `locked-at:` y `estado: locked`.

### 5.2 Conflictos conocidos

- **Preset elegido con 3+ divergencias.** Si el creador diverge en 3 o más ejes, la skill sugiere explícitamente `preset: custom` — el preset ya no representa el caso.
- **Ejes inconsistentes con preset.** Ejemplo: creador elige preset `podcast-audiovisual` pero declara `grado-edicion: heavy`. La skill advierte y pide confirmación (podría ser legítimo — un podcast con heavy post — o un error).

---

## 6. Briefs: campo `varia-por-eje:`

Cada brief declara en su frontmatter los ejes por los que su decisión varía.

### 6.1 Semántica

- **`varia-por-eje: []`** (lista vacía): el brief es **universal**. La decisión no cambia con la modalidad. Ejemplos: loudness −14 LUFS, WCAG AA, CPS subtítulos 15-20.
- **`varia-por-eje: [eje1, eje2, ...]`**: el brief tiene una sección **"Ajuste por eje"** en el cuerpo con sub-bullets para los valores relevantes de los ejes listados.

### 6.2 Ejemplos (estado actual del repo, a re-calibrar en fase 4)

| Brief | `varia-por-eje:` |
|---|---|
| `edicion/03-audio-loudness.md` | `[]` (universal) |
| `edicion/04-texto-pantalla.md` | `[]` (universal, WCAG) |
| `edicion/05-subtitulos.md` | `[plataforma]` (si shorts, obligatorio siempre) — pero no varía por ejes de modalidad |
| `concepto/02-objetivo.md` | `[objetivo-cognitivo]` — el brief es donde se define el objetivo |
| `guion/02-hook.md` | `[arco-dominante, objetivo-cognitivo]` — hook narrativo vs argumentativo vs performativo difiere |
| `guion/05-retrieval.md` | `[objetivo-cognitivo, grado-guion]` — live improvisado no admite retrieval formal |
| `guion/08-cta.md` | `[objetivo-cognitivo]` — CTA difiere entre habilidad (aplicar), opinión (compartir), orientación (seguir) |
| `edicion/07-voiceover.md` | `[rol-presentador, grado-edicion]` — no aplica a live o a formatos con audio en vivo |
| `publicacion/08-metricas-aprendizaje.md` | `[objetivo-cognitivo]` — habilidad se mide con post-test; opinión se mide con resonancia |

> **Fase 4 (rediseño de briefs)** calibra esta lista exhaustivamente para los 43 briefs y agrega el bloque "Ajuste por eje" donde falte.

### 6.3 Estructura del bloque "Ajuste por eje" en el cuerpo

Cuando `varia-por-eje` no es vacío, el brief tiene esta sección:

```markdown
## Ajuste por eje

### Por `objetivo-cognitivo`
- **`adquirir-habilidad`:** retrieval explícito tras cada segmento procedimental; 2-3 preguntas de self-check; opcional post-test. Cita `[P1-§3.2]`.
- **`corregir-intuicion`:** contraste explícito con la intuición errónea antes de consolidar; one-shot con desambiguación visual. Cita `[P1-§2.4]`.
- **`formar-opinion`:** evocación implícita, no cuestionario; retorno a la tesis en el cierre. La consolidación es retórica. Cita `[P1-§9.3]` (fase 2).
- **`apreciar`:** consolidación por resonancia — imagen evocativa, cita culminante. No aplica retrieval formal. Cita `[P1-§10.1]` (fase 2).

### Por `grado-guion`
- **`guionado`:** retrieval planeado en el script.
- **`semi-guionado`:** retrieval inserto en outline; presenter puede improvisar el fraseo.
- **`improvisado`:** no aplica retrieval formal. Sustituir por recaps verbales espontáneos del presenter.
```

### 6.4 Verificación

El script `scripts/verificar-briefs.sh` se extiende en fase 4 para:

1. Si `varia-por-eje: []`, el brief no debe tener sección `## Ajuste por eje`. Si la tiene → warning.
2. Si `varia-por-eje: [ejeX]`, debe existir sección `## Ajuste por eje` con sub-bloque `### Por \`ejeX\``. Si falta → warning.
3. Cada sub-bloque `### Por \`ejeX\`` debe cubrir **todos** los valores del eje (ver §2). Si faltan valores → warning.
4. Los IDs citados en los sub-bloques siguen las mismas reglas que el resto del brief (declarados en `fuentes:`, existentes en pilar).

---

## 7. Implicaciones para fases siguientes

### Fase 2 (pilar 1 expandido)

- Cada principio nuevo se marca con qué ejes / modalidades aplica. Ejemplo: "principio de voz autoral" aplica a `rol-presentador ∈ {narrador-1a-persona}`.
- Los IDs de pilar 1 existentes se preservan. Los nuevos usan `[P1-§9]`, `[P1-§10]`, `[P1-§11]`, `[P1-§12]`.

### Fase 3 (pilares 2 y 3)

- Fichas de pilar 2 se etiquetan con la modalidad (o modalidades) que ejemplifican.
- Herramientas de pilar 3 se marcan con qué modalidad(es) atienden.

### Fase 4 (briefs)

- Cada brief declara `varia-por-eje:` explícito.
- Donde varía, se escribe el bloque "Ajuste por eje".
- Los universales se mantienen tal cual (sin bloque nuevo) con `varia-por-eje: []`.

### Fase 5 (skills)

- `concept-explainer` implementa el flujo preset + override descrito en §5.1.
- Los 5 skills de etapa (`script-explainer`, `storyboard-explainer`, `record-explainer`, `edit-explainer`, `publish-explainer`) leen el Concept Brief, extraen los ejes, y para cada brief:
  - Si `varia-por-eje: []` → aplican el brief tal cual.
  - Si `varia-por-eje: [ejeX, ...]` → leen el sub-bloque correspondiente al valor del eje en el Concept Brief.
- `create-explainer` (orquestador) filtra fuera-de-scope (vlog, reacción, gameplay, etc.) antes de invocar `concept-explainer`.

### Fase 6 (verificación)

- Dry-run end-to-end con 4 modalidades contrastantes (tutorial técnico, documental narrativo, podcast audiovisual, live stream) para verificar que cada skill activa el sub-bloque correcto.
- Invocación con caso fuera-de-scope (vlog de viaje) para verificar que el orquestador lo identifica y sugiere no usar el toolkit.

---

## 8. Invariantes (no cambiar sin discutir)

1. **Los 5 ejes son la fuente de verdad.** Las modalidades son alias semánticos.
2. **Los nombres de los ejes son estables.** `arco-dominante`, `objetivo-cognitivo`, `grado-edicion`, `grado-guion`, `rol-presentador` son contrato con briefs y skills.
3. **Los valores de cada eje son estables.** Agregar un valor requiere migrar los briefs que varían por ese eje (nueva fila en el sub-bloque "Ajuste por eje").
4. **Los nombres de los 12 presets son estables.** Los slugs (`instruccional`, `divulgativa`, etc.) aparecen en Concept Briefs y fichas de pilar 2.
5. **`varia-por-eje` usa los nombres canónicos de los ejes.** No inventar ejes nuevos sin agregarlos aquí primero.

---

## 9. Decisiones cerradas en fase 1 (2026-04-19)

- **5 ejes, no 4.** `grado-guion` se separó de `grado-edicion` para capturar TED (light + guionado) vs podcast (light + improvisado).
- **Agregado `narrador-omnisciente`** al eje `rol-presentador` (antes faltaba; forzaba a documental clásico a `narrador-1a-persona`).
- **Shorts como atributo de plataforma,** no como 13a modalidad.
- **Concept Brief con preset + ejes siempre explícitos.** No solo preset (indirección), no solo ejes (pérdida semántica).
- **Híbridos vía preset dominante + override de ejes.** Con `divergencias:` opcional en el YAML para capturar las diferencias.
- **Briefs marcan variación con `varia-por-eje: [lista]`,** no con `universal: true/false`. Permite indexar qué briefs se tocan cuando cambia un eje.
