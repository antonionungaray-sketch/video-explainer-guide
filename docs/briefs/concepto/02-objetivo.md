---
decision: concepto/02-objetivo
etapa: concepto
pregunta: ¿Qué deberá poder hacer la audiencia al terminar el video (objetivo medible)?
fuentes:
  - P1-§6.4                   # transferencia, sin diseño explícito es débil
  - P1-§8.1                   # retrieval checkpoints — definir qué se debe poder recuperar
  - P1-§8.4                   # métricas que importan vs proxies de plataforma
  - P2-meta-tutorial          # objetivos típicos de tutorial técnico
  - P2-meta-divulgacion       # objetivos típicos de divulgación
  - P2-meta-onboarding        # objetivos cuasi-binarios (cert, compliance)
  - P2-ficha-mike-meyers      # caso objetivo cert prep
  - P2-ficha-fireship         # caso objetivo "refrescarse rápido"
admite-variantes: false
sync: 2026-04-19
version: 1
---

## Principio aplicable

**Sin objetivo observable, no hay forma de verificar transferencia**
[P1-§6.4]. "Entender X" no sirve — no es medible y la transferencia es
notoriamente débil sin diseño explícito. El objetivo medible determina
qué se debe poder recuperar en los retrieval checkpoints downstream
[P1-§8.1] y qué métrica de aprendizaje importa más allá de los proxies
conductuales de plataforma [P1-§8.4].

El objetivo se encadena a la audiencia ya nombrada en el brief 01: misma
acción puede ser objetivo válido para una audiencia y trivial o
inalcanzable para otra.

## Casos

- **Tutorial técnico — acción ejecutable** [P2-meta-tutorial]: "Al
  terminar, el dev podrá clonar el repo, instalar deps y desplegar un
  hello-world en 10 min". Verificable: lo hizo o no lo hizo.
- **Refresco rápido para audiencia pre-entrenada** [P2-ficha-fireship]:
  "Al terminar, el dev podrá decidir si Bun reemplaza Node en su stack
  actual". Decisión informada, no implementación.
- **Divulgación — modelo mental nuevo** [P2-meta-divulgacion]: "Al
  terminar, el viewer podrá explicar con sus palabras por qué el espacio
  es discreto a nivel cuántico". La transferencia se mide con tarea de
  explicación, no con quiz de reconocimiento.
- **Onboarding cert prep** [P2-ficha-mike-meyers]: objetivo cuasi-binario
  — pasar el examen oficial. Syllabus = outline; cada módulo entrega
  un fragmento del temario. Métrica de éxito: completion + score.

## Anti-patrón

**"Que entiendan X"** o **"que se familiaricen con Y"**
[P2-meta-onboarding]. Verbos no observables. Producen "certificate
theater": el módulo cumple el requisito legal pero no transfiere al
puesto. La industria 2024-2025 migró a microlearning + gamification
precisamente por este anti-patrón.

**Optimizar para APV o completion sin definir aprendizaje real**
[P1-§8.4]. Las métricas de plataforma son proxies imperfectos: alguien
puede ver el video completo sin aprender, o aprender mucho de un video
que abandona porque ya entendió.

## Heurística numérica

- **Un objetivo principal por video ≤ 10 min.** Objetivos múltiples
  requieren segmentación serial explícita (curso, no video único).
- **Verbo observable obligatorio:** instalar, reproducir, identificar,
  explicar con sus palabras, decidir entre A y B, configurar, debuggear.
  Listar verbos en checklist mental antes de cerrar.
- **Test de medibilidad:** si no podés diseñar un retrieval checkpoint
  para verificar el objetivo [P1-§8.1], no es medible — re-formularlo.

## Conflictos conocidos

Cliente corporativo pide objetivo amplio ("dominar la plataforma") y la
realidad cognitiva es que un video de 8 min produce un objetivo acotado
[P1-§6.4]. **Flaggear al usuario:** o se acota el objetivo de este
video, o se diseña un curso serial donde cada video tiene su propio
objetivo medible.

## Salida esperada

Una sola frase, encadenada a la audiencia del brief 01:

- **Objetivo:** "Al terminar este video, [audiencia del brief 01] podrá
  [acción observable con verbo medible]".

Sin promesa marketing (eso lo decide el brief 03). Solo el contrato de
aprendizaje verificable.
