---
decision: guion/04-segmentacion
etapa: guion
pregunta: ¿Cuántos bloques y de qué duración?
fuentes:
  - P1-§2.3-#6                # principio de segmentación
  - P1-§2.4                    # ~6 min decay (Guo et al. 2014)
  - P2-meta-tutorial
  - P2-meta-divulgacion
  - P2-meta-onboarding
admite-variantes: false
varia-por-eje: [grado-edicion, grado-guion, arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Principio de segmentación** [P1-§2.3-#6]: dividir contenido en unidades
manejables con cierres claros supera a flujo continuo, porque cada unidad
permite consolidar en memoria de trabajo antes de seguir.

**Guo et al. 2014 (MOOCs)** [P1-§2.4]: engagement decae pasado ~6 min en
contenido lectivo continuo. No es "ley de 6 min" — es mediana observada
en MOOCs con aprendices motivados. En nichos distintos (entertainment-ed,
onboarding con tareas) los números se mueven.

## Casos

- **Tutorial técnico anglo** [P2-meta-tutorial]: videos 8-15 min con
  bloques de 2-4 min. Fireship 4 min total sin segmentación explícita
  (el video ENTERO es un bloque denso).
- **Divulgación corta** [P2-meta-divulgacion]: 5-12 min con bloques de
  60-90s marcados por transición visual.
- **Onboarding corporativo** [P2-meta-onboarding]: microlearning ≤5 min
  con 80% completion, vs 20% en formato largo continuo.

## Anti-patrón

**Video de 25 min sin segmentación visible.** Un solo bloque continuo.
Retention típica <30% a los 10 min. Si el tema requiere 25 min, hacer
serie de 4-5 partes.

## Heurística numérica

- **Tutorial técnico:** bloques de 2-4 min, total 5-15 min.
- **Divulgación:** bloques de 60-120s, total 6-12 min.
- **Onboarding:** microlearning ≤5 min por unidad, serie para temas grandes.
- **Regla de pulgar:** si el video pasa de 10 min, la segmentación debe ser
  VISUALMENTE marcada (título de bloque, cambio de fondo, chapter marker).

## Ajuste por eje

### Por `grado-edicion`

- **`heavy` / `medium`:** segmentación explícita con chapter markers, transiciones visibles, títulos en pantalla. Bloques 2-5 min.
- **`light`:** segmentación natural (TED tiene su propia cadencia; podcast tiene capítulos en descripción marcados post-hoc).
- **`zero`:** segmentación emergente — el speaker la produce en vivo. Capítulos sólo existen si se re-edita para VOD.

### Por `grado-guion`

- **`guionado`:** bloques definidos a priori, nombrados en el outline.
- **`semi-guionado`:** bloques temáticos flexibles; el presentador decide transiciones.
- **`improvisado`:** no hay segmentación a priori; la edición (si hay) la compone post-hoc.

### Por `arco-dominante`

- **`performativo`:** segmentación por pasos procedimentales (setup, step 1, step 2...).
- **`narrativo`:** por actos (setup, complication, resolution).
- **`argumentativo`:** por movimientos argumentativos (thesis, evidence, counter, synthesis).
- **`expositivo`:** por sub-temas.
- **`conversacional`:** por tópicos emergentes del diálogo.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Duración total estimada.
- Número de bloques y título de cada uno.
- Duración aproximada de cada bloque.
- Método de marcado visual entre bloques (chapter marker, título en
  pantalla, cambio de escena).
