---
name: crear-entrenamiento
description: "Use when the user wants to produce, create, design, plan, script, record, edit, or publish video training, instructional, educational, tutorial, course, onboarding, or corporate training content. Orquestador que identifica en qué etapa está el creador y delega al skill específico (guion / grabacion / edicion / publicacion). En español."
---

# Crear material de entrenamiento audiovisual — orquestador

Este skill es el punto de entrada del toolkit de creación de entrenamiento audiovisual. Su trabajo es **identificar dónde está el creador en el ciclo de producción** y delegar al skill específico de la etapa, manteniendo el contexto del formato (técnico vs corporativo).

## Pilares del toolkit

El toolkit se basa en tres documentos. Léelos como referencia general antes de delegar si no lo has hecho en esta sesión:

1. **Pilar 1 — Fundamentos cognitivos del aprendizaje audiovisual** — `docs/pilares/01-fundamentos-cognitivos.md`. Ciencia estable. Prevalece sobre los otros pilares en caso de conflicto.
2. **Pilar 2 — Tendencias y casos de éxito** — `docs/pilares/02-tendencias-y-casos.md`. Dinámico. Lo que funciona ahora.
3. **Pilar 3 — Herramientas** — `docs/pilares/03-herramientas.md`. Dinámico. Opciones técnicas vigentes.

## Flujo del orquestador

1. **Identificar la etapa** del ciclo de producción donde está el creador. Pregunta solo si no es claro:
   - **Idea → Guión** — todavía no hay guión final, está conceptualizando, definiendo audiencia, estructurando.
   - **Pre-producción y grabación** — guión listo, está por grabar o grabando.
   - **Edición y post** — material crudo capturado, está editando.
   - **Publicación y medición** — video editado, está por publicar o iterando con métricas.

2. **Identificar el formato** (si no es obvio):
   - **Tutorial técnico / software** — screencasts, demos de producto, tutoriales paso a paso.
   - **Formación corporativa / profesional** — onboarding, compliance, soft skills, contenido para LMS.
   - Otros formatos son válidos pero el toolkit está optimizado para los dos anteriores.

3. **Delegar al skill de etapa correspondiente**, pasando el contexto del formato:
   - Etapa de guión → invoca `guion-entrenamiento`
   - Etapa de grabación → invoca `grabacion-entrenamiento`
   - Etapa de edición → invoca `edicion-entrenamiento`
   - Etapa de publicación → invoca `publicacion-entrenamiento`

## Si el usuario quiere actualizar las capas dinámicas

- Tendencias / casos de éxito → invoca `actualizar-tendencias`
- Herramientas → invoca `actualizar-herramientas`

## Reglas firmes

- **No tomar decisiones de la etapa tú mismo** — esa es función del skill específico, que tiene la vista por etapa cargada y consulta los pilares.
- **Si el usuario menciona varias etapas en un mismo proyecto**, atenderlas en orden: guión → grabación → edición → publicación. No saltar etapas.
- **Conflictos entre pilares**: cuando un skill de etapa flaggee un conflicto, no resolverlo por defecto. Presentar el conflicto al usuario, recordar que el pilar 1 (ciencia) prevalece, y dejar la decisión final al usuario.
