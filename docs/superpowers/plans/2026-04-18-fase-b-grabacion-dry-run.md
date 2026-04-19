# Dry-run Fase B — grabación — 2026-04-18

Validación cualitativa del piloto de capa de briefs para la etapa de
grabación.

## Setup

- **Tema:** Tutorial 7 min sobre "instalar Bun".
- **Setup del usuario:** laptop + Rode PodMic USB + 1 LED frontal +
  OBS Studio + cuarto no tratado.
- **Estilo declarado:** Midudev/MoureDev (hispano PiP face-cam).
- **Ejecutor:** subagent fresco leyendo
  `skills/grabacion-entrenamiento/SKILL.md`.

## Resultados

- **Briefs leídos:** los 7 de `docs/briefs/grabacion/` + SKILL.md.
- **Pilares leídos en runtime:** 0.
- **Decisiones con variantes ofrecidas:** 1 (brief 06-tomas — one-take
  vs bloques, dos casos genuinamente aplicables; recomendó bloques
  con one-take como variante). Briefs 02 y 05 convergieron a caso único
  porque el usuario declaró estilo-referencia explícito.
- **Plan producido:** OK — 7 secciones + Notas de Producción completas.
- **Métricas:** 145 SKILL + 599 briefs = 744 líneas total (vs ~700 del
  flow previo).

## Hallazgos relevantes del dry-run

**Test de determinismo operó correctamente.** Cuando el usuario declara
estilo-referencia explícito (ej. "Midudev/MoureDev"), las decisiones
02-video-encuadre y 05-captura-pantalla colapsan a caso único por
diseño. Pero en 06-tomas, el tema acotado + contexto permite
genuinamente tanto one-take como bloques — el subagent ofreció ambas
con recomendación de bloques. Exactamente el comportamiento esperado.

## Refinamientos aplicados

De los 5 sugeridos, 3 accionables incorporados antes del commit:

1. **03-iluminacion:** añadido caso "setup ultra-mínimo 1 luz" para
   setups sin pared de rebote pasivo como fill.
2. **05-captura-pantalla:** herramientas de cursor-highlight etiquetadas
   por plataforma (macOS / Windows / multi / Linux) para cumplir la
   regla de agnosticismo de OS.
3. **SKILL.md — reglas firmes:** convención explícita de codec de
   grabación OBS (MKV container durante grabación por safety, x264
   CRF 18-20 o encoders hardware, remux a MP4 post sin re-encode).
   Cierra el hueco que mencionaba la regla "codec consistente" sin
   respaldo operativo.

Diferidos (estructurales o nice-to-have):

4. **SKILL.md:** consolidar "Nota de etapa" sobre variantes — viable
   en Fase C si aparece drift real.
5. **Matriz estilo-referencia → colapsar variantes:** interesante
   patrón meta, no urgente.

## Cierre

Fase B (grabación) cumple el flujo. Carga total 744 líneas (dentro de
target 800). Ready para continuar con Fase B última etapa: publicación.
