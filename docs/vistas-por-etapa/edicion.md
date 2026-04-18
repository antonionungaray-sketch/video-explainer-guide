# Vista por etapa — Edición y post-producción

> Vista delgada de síntesis para la etapa de edición. El skill `edicion-entrenamiento` consulta esta vista **y** los pilares para cada decisión.
>
> Pilares: [01-fundamentos-cognitivos.md](../pilares/01-fundamentos-cognitivos.md) · [02-tendencias-y-casos.md](../pilares/02-tendencias-y-casos.md) · [03-herramientas.md](../pilares/03-herramientas.md)

## Objetivo de la etapa

Convertir el material crudo en un video que (a) respeta los principios cognitivos del aprendizaje, (b) aplica las convenciones de pacing y señalización vigentes, y (c) cumple estándares técnicos objetivos de loudness, contraste y subtítulos.

## Decisiones críticas

### 1. Estructura de cortes y pacing

**Pregunta**: ¿Dónde cortar, cuándo mantener una toma larga?
- **Pilar 1 §4.1**: movimiento estratégico re-enfoca; movimiento continuo agota.
- **Pilar 1 §4.4**: la habituación visual es real, pero la frecuencia óptima depende de la audiencia. No prescribir reglas universales.
- **Pilar 2 — Edición / Patrones**: cortes con ritmo variable (rápido en intros, lento en demos densas).
- **Salida**: timeline editado siguiendo bloques del guión, con ritmo deliberadamente variable.

### 2. Señalización visual

**Pregunta**: ¿Qué se destaca, cómo, cuándo?
- **Pilar 1 §2.3 #2**: principio de señalización — flechas, contornos, color de acento, contraste tipográfico.
- **Pilar 2**: zoom dinámico digital sobre la zona explicada en lugar de mover el cursor.
- **Salida**: callouts insertados solo donde aportan; eliminar señalización decorativa.

### 3. Audio: limpieza, normalización y mezcla

**Pregunta**: ¿Cumple estándares de loudness?
- **Pilar 1 §2.3 #1 (coherencia)**: música decorativa compite con la voz; usar solo si tiene función.
- **Pilar 3 — Post audio**: FFmpeg, Audacity, o el editor de video pueden normalizar.
- **Estándar**: **-14 LUFS integrated** para YouTube y la mayoría de plataformas, **-16 LUFS** para podcast, **-23 LUFS** para broadcast EBU R128. **True peak ≤ -1 dBTP**.
- **Salida**: pista master normalizada al estándar de la plataforma destino, sin clipping, voz inteligible sobre cualquier música/ambiente.

### 4. Texto en pantalla y tipografía

**Pregunta**: ¿Qué texto añadir, cómo, dónde?
- **Pilar 1 §2.3 #3 (redundancia)**: texto idéntico a la narración degrada el aprendizaje. Resumen sí, transcripción no.
- **Pilar 1 §5.1**: sans-serif para pantalla, jerarquía clara.
- **Pilar 1 §3.2**: contraste mínimo WCAG 2.2 AA — 4.5:1 cuerpo, 3:1 texto grande.
- **Salida**: textos en pantalla son resumen (no transcripción), legibles a tamaño y contraste objetivo.

### 5. Subtítulos / closed captions

**Pregunta**: ¿Generar automáticamente o transcribir manualmente? ¿Velocidad y posición?
- **Pilar 1 §5.2**: 15-20 caracteres/segundo (CPS), 2 líneas máximo, 37-42 caracteres/línea, mínimo ~1s y máximo ~7s en pantalla.
- **Pilar 3 — Subtítulos**: Whisper para base automática, Aegisub o Subtitle Edit para refinamiento.
- **Salida**: subtítulos generados, revisados manualmente (Whisper falla en jerga técnica), validados a 15-20 CPS.

### 6. B-roll y visuales de apoyo

**Pregunta**: ¿Dónde insertar visuales de apoyo y cuáles?
- **Pilar 1 §2.3 #4 / #5**: contigüidad espacial y temporal — el visual aparece junto/al mismo tiempo que su explicación.
- **Pilar 2**: B-roll funcional, no decorativo. Cada inserto ilustra algo específico.
- **Salida**: cada B-roll insertado tiene función explicativa identificable; eliminar el resto.

### 7. Voiceover IA o post-grabación

**Pregunta**: ¿Necesitas regenerar partes con voz IA o regrabar segmentos?
- **Pilar 1 §5.4**: voz cálida (humana o TTS de calidad reciente) > voz formal o sintética genérica.
- **Pilar 3 — Voiceover IA**: ElevenLabs para voz realista; Coqui o Piper para opciones locales.
- **Salida**: si se usa TTS, validar que la prosodia es natural y consistente con el resto del audio.

### 8. Render: codec, resolución, frame rate

**Pregunta**: ¿Cuál es el preset de export para la plataforma destino?
- **Estándares comunes**: 1080p 30 fps (YouTube horizontal), 1080×1920 30 fps (vertical), H.264 alto bitrate, AAC 192 kbps.
- **Salida**: archivo final que cumple specs de la plataforma destino sin re-encoding adicional.

## Checklist de salida

Antes de pasar a publicación:

- [ ] Pacing variable, sin tomas estáticas largas no justificadas.
- [ ] Señalización visual presente solo donde aporta.
- [ ] Audio normalizado al estándar de la plataforma (verificado con medidor LUFS).
- [ ] Textos en pantalla cumplen contraste WCAG AA.
- [ ] Subtítulos a 15-20 CPS, revisados manualmente.
- [ ] B-roll todo funcional.
- [ ] Sin redundancia narración↔texto en pantalla.
- [ ] Render en codec y resolución correctos para la plataforma destino.
- [ ] Conflictos detectados entre tendencias y fundamentos resueltos o documentados.
