# Dry-run Fase B — publicación — 2026-04-18

Validación cualitativa del piloto de capa de briefs para la etapa de
publicación.

## Setup

- **Tema:** Video tutorial 7 min sobre "instalar Bun" ya editado.
- **Perfil del creador:** canal pequeño (180 subs, 4 videos previos).
- **Plataforma destino:** YouTube horizontal 1080p.
- **Ejecutor:** subagent fresco leyendo
  `skills/publicacion-entrenamiento/SKILL.md`.

## Resultados

- **Briefs leídos:** los 8 de `docs/briefs/publicacion/` + SKILL.md.
- **Pilares leídos en runtime:** 0.
- **Decisiones con variantes ofrecidas:** 2 (01-titulo + 02-thumbnail
  — contexto permitía múltiples ángulos legítimos). 06-end-screens-cta
  no ofreció porque el caso "canal pequeño sin ecosistema" dominó.
- **Conflictos flaggeados:** 2 (no-suscríbete no es regla universal
  cultural, proxies vs aprendizaje).
- **Plan producido:** OK — 8 secciones llenas + Notas de publicación.
- **Métricas:** 152 SKILL + 709 briefs = 861 líneas iniciales;
  post-refinamientos 728 briefs = 880 total.

## Hallazgos relevantes

**Test de determinismo afinó correctamente.** Con contexto realista
(canal pequeño, audiencia dev-Node, sin estilo-referencia declarado),
el subagent ofreció variantes en decisiones con espacio creativo real
(01-titulo, 02-thumbnail) pero colapsó a caso único en 06 porque el
perfil del creador activó el caso "sin ecosistema" claramente.

## Refinamientos aplicados

Los 5 sugeridos incorporados al commit:

1. **06-end-screens-cta:** caso explícito "canal pequeño sin
   ecosistema" — cubre el 70% de creators del toolkit que antes caían
   fuera de los modelos del atlas.
2. **02-thumbnail:** heurística "canal <1k subs → priorizar face-cam
   por parasocialidad/reconocimiento de marca".
3. **05-programacion:** sub-caso "tutorial técnico hispano"
   (martes/jueves 19:00-21:00) — antes caía en bucket anglo.
4. **08-metricas-aprendizaje:** jerarquía fallback cuando no hay
   newsletter — comentarios → repo → rewatches.
5. **03-descripcion-capitulos:** anti-patrón "primer capítulo no en
   0:00" (requisito YouTube, error común).

## Cierre

Fase B (publicación) cumple el flujo. Carga total 880 líneas (10%
sobre target 800, mismo patrón que edición — contenido operativo:
template de salida detallado, checklists, decisiones metadata-heavy).
Fase B completa — las 3 etapas (edición + grabación + publicación)
han replicado exitosamente el patrón del piloto Fase A (guión).
Queda Fase C (skill `sincronizar-briefs`) y Fase D (cleanup).
