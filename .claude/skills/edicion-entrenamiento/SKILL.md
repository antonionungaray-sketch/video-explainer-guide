---
name: edicion-entrenamiento
description: "Use when the user is at the editing / post-production stage of a training video — cutting, pacing, signaling, audio normalization (LUFS), captions, B-roll, voiceover IA, or rendering. Etapa de edición y post del toolkit de entrenamiento audiovisual."
---

# Edición de entrenamiento audiovisual

Acompañas al creador a convertir el material crudo en un video que respeta los principios cognitivos, aplica las convenciones actuales de pacing y señalización, y cumple estándares técnicos objetivos.

## Carga obligatoria al inicio

1. **Vista por etapa**: `docs/vistas-por-etapa/edicion.md`.
2. **Pilar 1 — Fundamentos cognitivos**: `docs/pilares/01-fundamentos-cognitivos.md` — secciones §2.3 (12 principios de Mayer aplicados a edición), §3.2 (contraste WCAG), §4 (movimiento), §5 (tipografía y subtítulos), §5.4 (voz IA).
3. **Pilar 2 — Tendencias y casos**: `docs/pilares/02-tendencias-y-casos.md` — sección "Edición y post".
4. **Pilar 3 — Herramientas**: `docs/pilares/03-herramientas.md` — sección "Edición y post" (editores, FFmpeg, subtítulos, voiceover IA).

## Flujo

Camina al creador por las **8 decisiones críticas** de la vista por etapa, en orden:
1. Estructura de cortes y pacing
2. Señalización visual
3. Audio: limpieza, normalización y mezcla
4. Texto en pantalla y tipografía
5. Subtítulos / closed captions
6. B-roll y visuales de apoyo
7. Voiceover IA o post-grabación
8. Render: codec, resolución, frame rate

Mismo método: pregunta → consulta pilares → cruza info → flaggea conflictos → propone con justificación trazable.

## Estándares técnicos objetivos a verificar siempre

Estos no son opinión, son estándares vigentes:

- **Loudness**: -14 LUFS integrated para YouTube/redes; -16 LUFS podcast; -23 LUFS broadcast EBU R128. True peak ≤ -1 dBTP.
- **Contraste de texto en pantalla**: WCAG 2.2 AA — 4.5:1 cuerpo, 3:1 texto grande.
- **Subtítulos**: 15-20 caracteres/segundo (CPS), ≤2 líneas, 37-42 chars/línea, ~1-7s en pantalla.

## Salida

Plan de edición documentado y/o video editado. Verifica el **checklist de salida** de la vista por etapa.

## Reglas firmes

- **Coherencia (Mayer #1)**: si una decisión añade música decorativa, transiciones de adorno, o B-roll sin función → cuestionarlo.
- **Redundancia (Mayer #3)**: texto en pantalla idéntico a la narración degrada el aprendizaje. Resumen sí, transcripción no.
- **Subtítulos**: nunca aceptar la transcripción automática sin revisión manual (Whisper falla en jerga técnica y nombres propios).
- **Conflictos**: pilar 1 prevalece, flaggear al usuario cuando una tendencia popular contradiga un fundamento.
