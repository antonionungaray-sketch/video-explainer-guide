---
decision: guion/03-estructura
etapa: guion
pregunta: ¿Qué arquitectura narrativa — lineal, confusión productiva, problema-solución?
fuentes:
  - P1-§6.1                    # confusión productiva
  - P1-§6.2                    # efecto Zeigarnik, open loops
  - P2-meta-tutorial
  - P2-meta-divulgacion
  - P2-ficha-3b1b
  - P2-ficha-veritasium
  - P2-ficha-fireship
  - P1-§9.1                    # modos documentales (arco narrativo)
  - P1-§10.3                   # estructura argumentativa del ensayo
admite-variantes: true
varia-por-eje: [arco-dominante, grado-guion]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Confusión productiva** [P1-§6.1]: cuando el tema tiene misconceptions
comunes, presentar el error ingenuo primero y dejar que el espectador lo
sienta como natural antes de corregirlo produce mejor retención que
exposición directa. No aplicable a temas sin misconceptions (instalar
una librería).

**Open loops (efecto Zeigarnik)** [P1-§6.2]: tareas no completadas ocupan
más memoria de trabajo que completadas. Abrir una pregunta al inicio y
resolverla al final mantiene tensión cognitiva. Cerrar todos los loops
abiertos — un loop sin cerrar frustra. **Caveat del pilar:** la traslación
Zeigarnik→video es extrapolación práctica convergente desde varios
mecanismos (curiosidad, open-loop en memoria de trabajo), no una
demostración experimental directa sobre video. Usar como heurística
robusta, no como ley.

## Casos

- **3Blue1Brown** [P2-ficha-3b1b]: estructura linear con animación-que-tarda.
  Cada bloque visual se construye ante los ojos; el ritmo visual hace la
  segmentación. Open loops matemáticos explícitos ("volveremos a esto").
- **Veritasium** [P2-ficha-veritasium]: problema-solución con confusión
  productiva prominente. Hook = pregunta; video = construcción de la
  intuición; cierre = resolución + conexión con algo inesperado.
- **Fireship** [P2-ficha-fireship]: lineal puro, sin confusión productiva.
  Objetivo = referencia rápida, no cambio conceptual. Estructura:
  qué-es → cómo-se-instala → cómo-se-usa → comparación → veredicto.
  **Default para tutorial técnico ≤5 min sin misconceptions relevantes.**

## Anti-patrón

**Múltiples open loops sin cerrar.** Abrir 3 preguntas al inicio y cerrar
solo 1 genera error de predicción dopaminérgica acumulado. Mejor 1 loop
principal bien gestionado que 3 mal.

## Heurística numérica

- **Bloques narrativos:** 3-5 por video de 6-10 min.
- **Open loops:** 1 principal (hook → cierre) + 0-2 secundarios internos,
  todos cerrados.
- **Confusión productiva:** aplicable cuando ≥30% de la audiencia tiene
  el misconception. Si nadie lo tiene, omitir (pierde tiempo).

## Ajuste por eje

### Por `arco-dominante`

- **`expositivo`:** estructura lineal tema → sub-temas → integración, o problema → solución. Open loop simple. Fireship, Veritasium corto.
- **`narrativo`:** arco temporal (3 o 5 actos): setup → complicación → resolución. Open loop = qué pasa al final. Documental narrativo, personal essay, Kurzgesagt largos [P1-§9.1].
- **`argumentativo`:** tesis emergente → evidencia acumulativa → contra-objeción → síntesis abierta. NO declarar tesis al inicio. Nerdwriter, Contrapoints [P1-§10.3].
- **`performativo`:** procedimiento por pasos — setup → paso 1 → paso 2 → ... → resultado. Segmentación atada al procedimiento real. Tutoriales, how-to.
- **`conversacional`:** sin estructura guionada. Capítulos marcados post-hoc según temas que emergieron. Podcast, live stream.

### Por `grado-guion`

- **`guionado`:** estructura fijada en el outline. 3-5 bloques nombrados, transiciones escritas, open loops controlados.
- **`semi-guionado`:** outline con bloques; transiciones improvisadas por el presentador; open loops en outline pero sin fraseo exacto.
- **`improvisado`:** no hay estructura a priori — emerge del flujo. Capítulos se marcan en edición; "open loops" son espontáneos. Aplicar principios de Zeigarnik es aspiracional, no prescribible.

## Conflictos conocidos

- En tutorial técnico corto (<3 min) la confusión productiva puede no caber
  — la densidad del formato exige ir directo. Flaggear al usuario que elige
  confusión productiva en videos cortos.

## Salida esperada

Outline con:
- Tipo de estructura (lineal / confusión productiva / problema-solución).
- 3-5 bloques narrativos con título breve cada uno.
- 1 open loop principal: pregunta del hook + cómo/cuándo se cierra.
- Si aplica: misconception explícito a abordar y en qué bloque.
