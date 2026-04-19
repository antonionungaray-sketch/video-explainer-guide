---
decision: edicion/06-b-roll
etapa: edicion
pregunta: ¿Dónde insertás B-roll o visuales de apoyo, y qué función cumple cada inserto?
fuentes:
  - P1-§2.3-#4                 # contigüidad espacial
  - P1-§2.3-#5                 # contigüidad temporal
  - P1-§2.3-#1                 # coherencia (B-roll decorativo)
  - P2-edicion-patrones
  - P2-ficha-veritasium        # B-roll científico alineado con narración
  - P2-ficha-kurzgesagt        # animación alineada frase-a-frase
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Contigüidad temporal** [P1-§2.3-#5]: narración y visual correspondiente
deben presentarse **simultáneamente**. B-roll que aparece 3s después de
la frase que ilustra pierde el link asociativo en memoria de trabajo.

**Contigüidad espacial** [P1-§2.3-#4]: si el B-roll tiene texto o
elementos clave, que estén visualmente cerca del elemento al que se
refieren en el frame.

**Coherencia** [P1-§2.3-#1]: B-roll debe tener **función identificable**
(ilustrar, dar evidencia, contrastar). B-roll decorativo (stock footage
genérico de teclado escribiendo) añade carga extraña sin ganancia.

## Casos

- **Veritasium** [P2-ficha-veritasium]: B-roll científico denso, siempre
  alineado con la narración. Cuando menciona un experimento, aparece
  footage del experimento EN ESE MOMENTO. Contigüidad temporal rigurosa
  [P2-edicion-patrones].
- **Kurzgesagt** [P2-ficha-kurzgesagt]: animación isotype **alineada
  frase-a-frase** con la voz. Cada elemento visual aparece en el
  segundo exacto en que se lo nombra. Extremo del principio.
- **Fireship / Coding Train**: B-roll = capturas del editor con código
  real que ejecuta la narración. Directamente ilustrativo.

## Anti-patrón

**Stock footage genérico** (manos escribiendo, engranajes girando,
código en verde matrix) sin relación específica con lo que se narra.
Suma carga extraña y señala falta de cuidado en producción.

**B-roll de relleno** (cubrir segmentos aburridos con imagen cualquiera).
Si el segmento necesita B-roll para no ser aburrido, el problema es el
segmento (cortar, reescribir, resegmentar) — no tapar con footage.

**B-roll desincronizado** (aparece antes o después de su referencia).
Rompe contigüidad temporal.

## Heurística numérica

- **Cobertura de B-roll:** no hay porcentaje universal. Veritasium
  ~50-60%, Kurzgesagt 100% (es todo animación), Fireship 30-40%
  (split-screen con editor). Depende del formato.
- **Desfase aceptable:** ≤1s entre mención verbal y aparición visual.
  Más es desincronía.
- **Duración por inserto:** 2-8s típicamente. Menos es flash sin
  procesar; más requiere que la narración acompañe ese B-roll.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Lista de insertos de B-roll por timestamp: qué muestra, qué frase
  ilustra, duración.
- Justificación función por cada uno (ilustra / evidencia / contrasta /
  segmenta).
- Lista de B-roll eliminado porque no cumplía función (ejercicio de
  poda explícito).
