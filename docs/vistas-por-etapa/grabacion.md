# Vista por etapa — Pre-producción y grabación

> Vista delgada de síntesis para la etapa de captura. El skill `grabacion-entrenamiento` consulta esta vista **y** los pilares para cada decisión.
>
> Pilares: [01-fundamentos-cognitivos.md](../pilares/01-fundamentos-cognitivos.md) · [02-tendencias-y-casos.md](../pilares/02-tendencias-y-casos.md) · [03-herramientas.md](../pilares/03-herramientas.md)

## Objetivo de la etapa

Producir **material crudo de calidad suficiente** para que la etapa de edición no tenga que "rescatar" defectos. Audio limpio + video estable + iluminación consistente + escenas planificadas según el guión.

## Decisiones críticas

### 1. Setup de audio

**Pregunta**: ¿Qué micrófono, qué ganancia, qué tratamiento acústico?
- **Pilar 1 §5.4**: voz cálida y prosódicamente natural supera tecnología; calidad sonora afecta directamente comprensión.
- **Pilar 2**: audio mono limpio supera video 4K con audio mediocre.
- **Pilar 3 — Audio**: micrófono dinámico USB de gama media es el upgrade con mayor retorno.
- **Salida**: micro elegido + niveles de prueba (picos -6 a -3 dB, promedio ~-18 dB) + entorno con noise floor mínimo.

### 2. Setup de video y encuadre

**Pregunta**: ¿Cámara fija o móvil? ¿Qué se ve en pantalla?
- **Pilar 1 §4.1**: el movimiento captura bottom-up; movimiento continuo agota.
- **Pilar 2**: cámara mirando al área de demostración (no a cámara) durante explicación de pantalla.
- **Salida**: encuadre definido por toma; planificación de cuándo mover (zoom, cambio de plano) y cuándo mantener fija.

### 3. Iluminación

**Pregunta**: ¿Cómo iluminar al sujeto y separar del fondo?
- **Pilar 2**: iluminación frontal suave + fondo más oscuro separa sin chroma key.
- **Pilar 3**: cualquier panel LED bicolor con difusor sirve; el principio importa más que la marca.
- **Salida**: setup verificado en cámara antes de empezar, balance de blancos consistente.

### 4. Estructura de escenas

**Pregunta**: ¿Cuántas escenas, cuándo cambiar entre ellas?
- **Pilar 1 §4.4**: la habituación visual es real, pero la frecuencia exacta de cortes es heurística no ley. Calibrar por audiencia.
- **Pilar 2**: cortes con ritmo variable (rápido en intros, lento en demos técnicas).
- **Pilar 3**: OBS Scene Management permite preparar escenas y cambiarlas en vivo.
- **Salida**: lista de escenas preparadas (cam + screen + overlays) alineadas con el outline del guión.

### 5. Captura de pantalla y gaze guidance

**Pregunta**: ¿Cómo orientas la atención del espectador hacia el área relevante?
- **Pilar 1 §4.2**: gaze guidance funciona cuando el rostro del instructor mira al contenido, no a cámara.
- **Pilar 1 §2.3 #2**: señalización visual (cursor, callouts) durante la captura, o agregar en post.
- **Salida**: decisión de capturar con cursor visible / con callouts en vivo / añadir en edición.

### 6. Toma 1 vs múltiples tomas

**Pregunta**: ¿Grabar de corrido o por bloques?
- **Pilar 2**: grabación por bloques permite descansos mentales y permite repetir si algo falla, sin perder tomas buenas.
- **Salida**: estrategia explícita (toma única para autenticidad, o por bloques para limpieza).

### 7. Material de respaldo (B-roll, screenshots, recursos)

**Pregunta**: ¿Qué materiales adicionales necesitas que no son la grabación principal?
- **Pilar 1 §2.3 #5**: contigüidad temporal — los visuales de apoyo deben sincronizarse con la narración.
- **Pilar 2**: B-roll funcional, no decorativo.
- **Salida**: lista de recursos a producir o conseguir antes de editar.

## Checklist de salida

Antes de pasar a edición:

- [ ] Audio capturado limpio (sin clipping, sin ruido de fondo distrayente).
- [ ] Video estable, encuadre consistente entre tomas relacionadas.
- [ ] Iluminación coherente (sin saltos de balance de blancos).
- [ ] Todas las escenas planificadas en el guión están grabadas.
- [ ] B-roll y recursos auxiliares listados (si no producidos).
- [ ] Backup de archivos crudos en al menos 2 ubicaciones.
- [ ] Notas de edición para momentos a cortar, repetir, o destacar.

## Recordatorios técnicos generales

- **Audio antes que cualquier otra cosa**: el upgrade de mayor impacto es siempre el micrófono y el tratamiento acústico.
- **Iluminación antes que cámara**: una cámara modesta bien iluminada supera a una cámara de gama alta mal iluminada.
- **Codec consistente**: usar el mismo codec/contenedor en todas las tomas evita transcodings innecesarios en edición.
