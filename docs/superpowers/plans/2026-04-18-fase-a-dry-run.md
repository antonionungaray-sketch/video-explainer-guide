# Dry-run Fase A — 2026-04-18

Validación cualitativa del piloto de capa de briefs de guión.

## Setup

- **Tema:** Tutorial 5 min — instalar Bun y correr primer proyecto.
- **Audiencia asumida:** devs con experiencia en Node sin haber usado Bun.
- **Meta-formato:** tutorial técnico denso estilo Fireship.
- **Duración:** 5 min.
- **Ejecutor:** subagent fresco (general-purpose) leyendo
  `skills/guion-entrenamiento/SKILL.md` y siguiendo su flujo con input
  del usuario simulado.

## Resultados

- **Briefs leídos:** los 8 (`docs/briefs/guion/01-audiencia.md` a
  `08-cta.md`) + `skills/guion-entrenamiento/SKILL.md`.
- **Pilares leídos en runtime:** 0 (invariante clave cumplido).
- **Decisiones con variantes ofrecidas:** 0 (el test de determinismo
  filtró correctamente — el contexto tenía un solo caso dominante en
  02-hook y 03-estructura).
- **Cada decisión cita IDs:** sí, con formato `[P1-§X.Y]`, `[P2-ficha-Y]`.
- **Conflictos flaggeados:** 1 (accesibilidad vs. redundancia en
  06-modalidad-dual).
- **Guión producido:** OK — plantilla completa, coherente, trazable,
  sin contradicción a pilar 1.

## Hallazgos y refinamientos aplicados

El dry-run surfaceó 5 issues reales, 5 ya aplicados antes de cerrar
Fase A:

1. **Test de determinismo upstream ambiguo.** El criterio "≥2 casos
   razonablemente aplicables" podía leerse mirando solo meta-formato.
   Refinamiento: la skill ahora exige evaluar contra **todos los ejes**
   (audiencia + nivel previo + idioma/variante + duración + objetivo +
   meta-formato + decisiones previas). Archivo:
   `skills/guion-entrenamiento/SKILL.md`.

2. **Plantilla de salida sin slot de Notas de Producción.** Los WPM
   finales, idioma, subtítulos de accesibilidad y chapter markers
   quedaban huérfanos. Refinamiento: bloque
   `═══ NOTAS DE PRODUCCIÓN ═══` añadido al final de la plantilla.

3. **Checklist de conflictos sólo cubre P2 vs P1.** En la práctica
   también aparecen conflictos P1 vs restricción externa (ej. accesibilidad
   obligatoria sobre-escribe el principio de redundancia). Refinamiento:
   checklist ampliada.

4. **07-voz-registro sin WPM rioplatense.** Hueco para usuarios
   argentino/uruguayos. Refinamiento: nota de calibración
   (-10/-15 WPM respecto al peninsular por prosodia).

5. **03-estructura no explicitaba Fireship-lineal-puro como default.**
   Era implícito; decirlo directo ayuda al test de determinismo.
   Refinamiento: línea añadida al caso Fireship.

## Cierre

Fase A cumple criterios de aceptación (ver Task 17). Los refinamientos
se commitearon junto con el log del dry-run. Ready para Fase B.
