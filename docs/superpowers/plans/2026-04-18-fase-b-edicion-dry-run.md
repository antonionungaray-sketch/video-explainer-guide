# Dry-run Fase B — edición — 2026-04-18

Validación cualitativa del piloto de capa de briefs para la etapa de
edición.

## Setup

- **Tema:** Tutorial 7 min sobre "instalar Bun y correr primer proyecto".
- **Audiencia:** devs con Node, estilo Fireship-denso.
- **Plataforma destino:** YouTube horizontal 1080p.
- **Material crudo:** pantalla + face-cam + narración en vivo.
- **Ejecutor:** subagent fresco (general-purpose) leyendo
  `skills/edicion-entrenamiento/SKILL.md`.

## Resultados

- **Briefs leídos:** los 8 de `docs/briefs/edicion/` + SKILL.md.
- **Pilares leídos en runtime:** 0.
- **Decisiones con variantes ofrecidas:** 0 (solo 01-pacing y
  02-senalizacion tienen `admite-variantes: true`; el contexto declarado
  hacía que un caso dominara en ambos).
- **Estándares técnicos aplicados con números específicos:** LUFS -14,
  WCAG 4.5:1, CPS 17-19.
- **Conflicto flaggeado:** accesibilidad (closed captions duplican
  narración, obligatorios por ley/ética — P1 vs restricción externa).
- **Plan de edición producido:** OK — 8 secciones llenas + Notas de
  Producción con checklist de cierre.
- **Métricas:** 670 líneas briefs + 148 SKILL = 818 total (vs ~700
  previas del flow viejo de edición).

## Hallazgos y refinamientos aplicados

El subagent sugirió 6 refinamientos. Los 3 accionables aplicados:

1. **03-audio-loudness:** añadido snippet FFmpeg loudnorm two-pass como
   referencia ejecutable.
2. **08-render:** añadido comando ffprobe exacto de verificación.
3. **05-subtitulos:** añadida checklist de términos JS/TS/Node/web que
   Whisper rompe sistemáticamente (reusable entre proyectos).

Los 3 diferidos (cosméticos o estructurales):

4. **01-pacing:** gradiente para tutorial técnico 7-10 min (entre Fireship
   y Coding Train) — viable en Fase B.1 si aparece como fricción.
5. **04-texto-pantalla:** tabla de combinaciones color-fondo con ratios
   WCAG — nice-to-have.
6. **07-voiceover:** renombrar "Casos" a "Opciones disponibles" — change
   de esquema afectaría a todos los briefs del toolkit, postergar.

## Cierre

Fase B (edición) cumple el flujo validado en Fase A piloto. Carga total
818 líneas (2% sobre target 800) — contenido adicional es operativo real
(snippets ejecutables + checklists reusables), no bloat. Ready para
continuar Fase B con grabación o publicación en próxima sesión.
