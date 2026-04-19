# Pilar 3 — Herramientas para producción audiovisual de entrenamiento

> **Naturaleza dinámica.** Este documento lista herramientas vigentes para cada etapa del flujo. El status, las alternativas y el pricing cambian constantemente. Cada item lleva fecha de última verificación.
>
> **Agnóstico de hardware.** El toolkit no asume un sistema operativo, GPU o stack específico. Donde una herramienta tiene requisitos restrictivos, se anota. Las decisiones específicas del setup personal del creador van en la documentación de su propio proyecto, no aquí.
>
> **Cómo se actualiza.** Manualmente con asistencia: el skill `actualizar-herramientas` busca releases recientes, deprecations y alternativas, resume y propone cambios para tu aprobación.

---

## Frescura

| Sección | Última revisión |
|---|---|
| Global | 2026-04-17 (creación) · 2026-04-18 (ampliación IA-forward) |
| Idea → Guión | 2026-04-17 |
| Pre-producción y grabación | 2026-04-18 |
| Edición y post | 2026-04-18 |
| Publicación y medición | 2026-04-17 |

---

## Idea → Guión [P3-idea-guion]

### Asistentes de escritura [P3-idea-guion-asistentes]
- **Claude / GPT** — generación y refinado de guiones, brainstorm de hooks, conversión bullet→prosa hablada. *Status: estable. Verificado: 2026-04-17.*
- **Notion / Obsidian / plain Markdown** — almacenamiento y versionado de guiones. Markdown es el formato más portátil y diff-friendly.

### Investigación y validación [P3-idea-guion-investigacion]
- **Perplexity / Claude con WebSearch** — investigación rápida con citaciones.
- **Google Scholar** — verificar claims científicos antes de afirmar algo en un explainer.

### Cuándo elegir qué
- Para tutoriales técnicos: editor Markdown plano + asistente IA para refinar.
- Para formación corporativa: idem + plantillas estructuradas (objetivo de aprendizaje, audiencia, pre-requisitos, evaluación).

---

## Pre-producción y grabación [P3-preprod]

### Captura de pantalla y cámara [P3-preprod-captura]
- **OBS Studio** — open source, cross-platform, scenes, encoders por hardware. Status: estable, líder de facto en captura.
- **Loom / Riverside / Descript Recorder** — capturas rápidas, sincronización a la nube. Mejor para sesiones cortas o entrevistas remotas.
- **Streamlabs Desktop** — fork de OBS con UI más amigable; menos flexible para casos avanzados.

### Audio [P3-preprod-audio]
- **Micrófono dinámico USB de gama media** (Shure MV7, Samson Q9U, Rode PodMic USB) — el upgrade técnico con mayor retorno por unidad de inversión en producción audiovisual.
- **Audacity** — edición y limpieza de audio offline, gratuito.
- **Krisp / NVIDIA Broadcast** — supresión de ruido en vivo (requisitos de hardware).

### Iluminación [P3-preprod-iluminacion]
- **Cualquier panel LED bicolor con difusor** — el principio importa más que la marca: luz suave, frontal, balance de blancos consistente.

### Teleprompter y corrección de mirada IA [P3-preprod-teleprompter]
- **Descript — teleprompter + Eye Contact AI** — teleprompter integrado + corrección de mirada en post; el presentador puede leer guion mirando ligeramente desviado y la IA reorienta el ojo a cámara sin deformar parpadeo/expresión. *Status: estable. Verificado: 2026-04-18.*
- **BIGVU** — mobile-first, teleprompter + Eye Contact Fix + auto-captions + Brand Kit en una sola app. Útil para grabación on-the-go sin setup de estudio. *Status: estable. Verificado: 2026-04-18.*
- **Cuándo elegir qué.** Presencia humana en cámara + guion leído: sin estas herramientas el espectador percibe lectura subconscientemente (mirada ligeramente fuera de eje). Descript encaja si ya se edita con transcripción; BIGVU si se graba desde móvil. Si la toma es puramente captura de pantalla sin cara, este bloque no aplica.

### Cuándo elegir qué
- Tutorial técnico de software: OBS + micrófono USB es suficiente. No requiere cámara.
- Formación corporativa con presencia en cámara: OBS o Riverside + micrófono USB + iluminación frontal + cámara webcam decente o réflex/mirrorless con captura HDMI.

---

## Edición y post [P3-edicion]

### Editores de video [P3-edicion-editores]
- **DaVinci Resolve** — gratuito (versión Studio de pago), nivel profesional. Requiere GPU competente.
- **Kdenlive** — open source, multiplataforma, trabaja bien sin GPU dedicada.
- **Adobe Premiere Pro** — estándar industrial, suscripción mensual.
- **CapCut Desktop** — edición rápida con plantillas, fuerte para formatos cortos verticales.
- **Descript** — edición de video editando la transcripción de texto. Excelente para contenido hablado.

### Composición programática [P3-edicion-composicion]
- **Remotion** — videos como código React. Ideal para variaciones masivas desde datos, lower thirds, intros dinámicos. *Nota de licencia: gratuita para uso individual/personal pero requiere licencia comercial para empresas con ≥3 personas.* *Status: estable. Verificado: 2026-04-18.*
- **Motion Canvas** — MIT, TypeScript con generator functions, scene graphs, editor en tiempo real. Diseñado para explainers animados hechos a mano al estilo 3Blue1Brown pero con tooling moderno. Alternativa libre a Remotion sin fricción de licencia. *Status: estable. Verificado: 2026-04-18.*
- **Revideo** — MIT, fork de Motion Canvas con rendering headless + server-side + sistema de templates. Pensado para pipelines de producción automatizada (generar decenas/miles de videos desde datos). *Status: estable. Verificado: 2026-04-18.*
- **HyperFrames (HeyGen)** — Apache 2.0, compone video vía HTML/CSS/JS y está diseñado para que agentes IA (p. ej. Claude Code) editen video con primitivas web estándar. Complementa a Remotion cuando la pipeline está orquestada por agentes más que por devs humanos. *Status: nuevo/cambia rápido. Verificado: 2026-04-18.*
- **Manim** — animación matemática estilo 3Blue1Brown.
- **Cuándo elegir qué.** Remotion si ya hay stack React y el licenciamiento no es problema; Motion Canvas / Revideo si necesitás open-source sin ataduras o si el equipo supera 3 personas; HyperFrames si el flujo es orquestado por un agente IA; Manim solo para matemáticas formales.

### Post-procesado puntual [P3-edicion-postproc]
- **FFmpeg** — el cuchillo suizo de procesamiento de video. Cortar, normalizar, transcoder, generar thumbnails. Imprescindible aprender mínimos comandos.
- **Handbrake** — front-end gráfico de FFmpeg para conversiones masivas.

### Subtítulos [P3-edicion-subtitulos]
- **Whisper (OpenAI) local o vía API** — transcripción automática multilenguaje, base de subtítulos. *Status: estable. Verificado: 2026-04-18.*
- **WhisperX** — wrapper open-source sobre Whisper con *diarization* multi-speaker y *word-level alignment*. Imprescindible cuando hay más de una voz (entrevistas, paneles, pair coding) o se necesitan subtítulos sincronizados palabra-a-palabra para captions kinetic. *Status: estable. Verificado: 2026-04-18.*
- **Aegisub** — editor de subtítulos profesional (timing, estilo SRT/ASS).
- **Subtitle Edit** — alternativa Windows con buena UX.

### Voiceover IA [P3-edicion-voiceover]
- **ElevenLabs** — voces realistas, clonación de voz, multilenguaje. Tier gratuito limitado. **Dubbing Studio** (add-on): traduce y redobla audio en 32+ idiomas conservando las características de voz del hablante original. Útil para internacionalizar un training existente sin regrabar. *Status: estable. Verificado: 2026-04-18.*
- **Coqui TTS** / **Piper** — open source, ejecución local, calidad menor pero suficiente para borradores.

### Cuándo elegir qué
- Tutorial técnico de bajo presupuesto: Kdenlive + FFmpeg + Whisper.
- Formación corporativa con muchas variaciones: Remotion + ElevenLabs.
- Edición rápida de hablado: Descript.

---

## Publicación y medición [P3-publicacion]

### Plataformas [P3-publicacion-plataformas]
- **YouTube** — ecosistema más maduro para contenido formativo largo. Analytics detallados.
- **Vimeo** — alternativa para alojamiento privado, mejor calidad de transcoding por defecto.
- **Loom Library** — para conocimiento interno corporativo.
- **LMS corporativos** (Synthesia, Articulate, TalentLMS, Moodle) — entornos completos de formación con tracking de progreso y evaluaciones.

### Análisis y métricas [P3-publicacion-analitica]
- **YouTube Studio Analytics** — retention curves, APV, CTR, sources.
- **TubeBuddy / VidIQ** — auditoría de SEO de video, A/B testing de thumbnails.
- **Hotjar / FullStory** (para video embebido en sitio propio) — mapas de calor sobre interacción.

### Thumbnails y arte [P3-publicacion-thumbnails]
- **Figma / Canva** — composición rápida con plantillas.
- **Photopea** — alternativa gratuita web a Photoshop.
- **Generadores IA de imagen** (Midjourney, DALL·E, Imagen) — base para thumbnails creativos.

### Cuándo elegir qué
- Contenido público abierto: YouTube + TubeBuddy.
- Formación interna: LMS corporativo + Loom.
- Auditoría de mejora continua: YouTube Studio + comparación con histórico.

---

## Fuentes para revisar al actualizar

*(Lista que el skill `actualizar-herramientas` consulta)*

- Release notes oficiales de cada herramienta listada
- Product Hunt y Hacker News para alternativas emergentes
- Reddit r/videography, r/editors, r/instructionaldesign
- Newsletters: TLDR Marketing, Stratechery, Ben's Bites para herramientas IA
- Reportes anuales de stack del creador (Tubebuddy State of Creator)
