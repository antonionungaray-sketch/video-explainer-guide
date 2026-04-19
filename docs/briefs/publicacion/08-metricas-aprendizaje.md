---
decision: publicacion/08-metricas-aprendizaje
etapa: publicacion
pregunta: ¿Cómo medís si la audiencia realmente aprendió, más allá de proxies de plataforma?
fuentes:
  - P1-§8.1                    # retrieval checkpoints
  - P1-§8.2                    # espaciamiento
  - P1-§8.3                    # variedad contextual
  - P1-§8.4                    # métricas que importan vs proxies
  - P1-§6.4                    # transferencia
  - P2-publicacion-metricas-core
  - P2-publicacion-antipatrones
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Las métricas de plataforma son proxies imperfectos** [P1-§8.4].
Views, APV, CTR miden *comportamiento observable*, no *aprendizaje*.
Un viewer puede completar el video y no retener nada; otro puede
salirse a los 3 min y aplicar exitosamente lo aprendido en un
proyecto. Sin medir aprendizaje real, el feedback loop se limita
a optimizar packaging.

**Retrieval, spacing, variedad contextual** [P1-§8.1] [P1-§8.2]
[P1-§8.3]: tres drivers de retención a largo plazo. Medir aprendizaje
es verificar que estos mecanismos operaron, no solo que el video se vio.

**Transferencia** [P1-§6.4]: aplicar lo aprendido en contexto distinto
es prueba más fuerte que test de reconocimiento.

## Casos (instrumentación viable)

- **Onboarding corporativo (LMS):** quiz post-módulo mide
  comprensión inmediata; transferencia al trabajo sigue siendo el
  gap de la industria [P2-publicacion-metricas-core] — se mide con
  observación del supervisor o tareas reales embebidas.
- **Tutorial técnico público:** feedback cualitativo generativo
  ("contame en comentarios qué se rompió al probarlo") + stars/
  forks/issues del repo linkeado como proxies de uso real. Saves
  y rewatches = proxy débil de "video útil como referencia".
- **Divulgación pública:** lectura de comentarios distinguiendo
  preguntas sofisticadas (entendió + extendió) de genéricas.
- **Instrumentación activa:** follow-up email con mini-quiz a
  24h/7d/30d — requiere email list, viable si hay newsletter.

**Fallback sin newsletter** (canal pequeño): (1) comentarios con CTA
generativo, (2) stars/forks/issues del repo linkeado, (3) saves y
rewatches en Studio. Si ninguno aplica, la etapa queda con medición
cero — aceptable inicial, marcar como deuda.

## Anti-patrón

**Declarar éxito por APV alto** [P2-publicacion-antipatrones]:
optimiza entretenimiento, no formación. "Mi APV es 55%" ≠ "mi
audiencia aprendió algo".

**Certificate theater en onboarding corporativo**
[P2-publicacion-antipatrones]: cursos diseñados para cumplir
requisito legal, no enseñar. Métrica = firma de completion, no
transferencia al trabajo. Anti-patrón establecido en literatura
2024-2025.

**Test de reconocimiento como única medida** (multiple choice
cerrado): mide recall superficial, no comprensión ni
transferencia. Preferir preguntas generativas.

**No instrumentar nada porque "es público gratis"**: el feedback
loop se limita a métricas de plataforma; la iteración del formato
pierde calidad.

## Heurística numérica

- **Cadencia de medición diferida:** 24h + 7d + 30d si hay email
  list; 7d + 30d como mínimo si no.
- **Retención real 7d:** 40-60% del contenido recordado en preguntas
  generativas es un rango razonable según literatura de retrieval
  practice. Sin retrieval checkpoints in-video esa cifra colapsa.
- **Transferencia:** al menos 1 señal cualitativa (comentario
  sofisticado, fork de repo, aplicación explícita) por cada 1000
  views como piso indicativo en contenido técnico.

## Conflictos conocidos

- **Métricas de plataforma vs métricas de aprendizaje:** tensión
  real. Plataforma recompensa engagement; aprendizaje recompensa
  retrieval y dificultad deliberada. Flaggear al usuario cuando
  está optimizando para un proxy que podría degradar el otro.

## Salida esperada

- Plan mínimo viable según contexto: corporativo → quiz post +
  seguimiento transferencia; tutorial público → CTA feedback
  generativo + uso del repo linkeado; divulgación → lectura
  cualitativa de comentarios (genérico/extensivo/sofisticado).
- Ventana de medición explícita (24h / 7d / 30d).
- Criterio de éxito distinto de APV.
