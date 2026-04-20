---
decision: guion/05-retrieval
etapa: guion
pregunta: ¿Dónde insertas momentos de recuperación activa?
fuentes:
  - P1-§6.3                    # retrieval practice / testing effect
  - P1-§8.1                    # retrieval checkpoints dentro del contenido
  - P2-meta-tutorial
  - P2-meta-onboarding
  - P2-ficha-kurzgesagt
  - P1-§6.1                    # misconception handling (ajuste corregir-intuicion)
  - P1-§8.2                    # espaciamiento (ajuste orientarse)
  - P1-§10                     # teoría del ensayo fílmico (general)
  - P1-§10.4                   # consolidación retórica (formar-opinion / apreciar)
admite-variantes: true
varia-por-eje: [objetivo-cognitivo, grado-guion, arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Testing effect** [P1-§6.3] [P1-§8.1]: recuperar información supera a
releer la para retención a largo plazo (Roediger & Karpicke 2006;
Karpicke & Blunt 2011). No es intuitivo — se siente menos efectivo
(porque cuesta más), pero produce mejor consolidación.

**Preguntas generativas > preguntas de reconocimiento.** "¿Qué harías
en esta situación?" supera a "¿cuál de estas respuestas es correcta?".
El costo cognitivo de generar la respuesta es el driver del efecto.

## Casos

- **Tutorial técnico** [P2-meta-tutorial]: retrieval implícito en forma de
  pausas donde el espectador puede probar el comando antes de ver el
  resultado. "Pausa y pruébalo si quieres; te espero."
- **Onboarding corporativo** [P2-meta-onboarding]: retrieval explícito vía
  quiz embebido, 1 cada 2-3 min. Plataformas LMS lo enforzan; YouTube no.
- **Divulgación**: retrieval casi inexistente en el formato estándar.
  Excepto Kurzgesagt [P2-ficha-kurzgesagt] que usa "piensa por un
  momento…" seguido de 2s de animación — aproximación a retrieval
  sin quiz.

## Anti-patrón

**Pregunta retórica sin pausa para respuesta.** "¿Cómo creen que funciona?
Bueno, funciona así." No es retrieval — el cerebro no tiene tiempo de
generar. Si hay pregunta, hay que darle tiempo (2-3s mínimo de animación
vacía o "pausa ahora").

## Heurística numérica

- **Tutorial técnico:** ≥1 retrieval checkpoint cada 5-10 min, típicamente
  como pausa-para-probar.
- **Onboarding:** más denso — 1 cada 2-3 min, quiz con pregunta generativa.
- **Divulgación:** 0-1 por video; la estructura narrativa hace el trabajo.

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** retrieval explícito y denso. 1 checkpoint cada 5-10 min mínimo. Preguntas generativas procedimentales ("¿qué comando usarías para X?"). Post-test al cierre opcional.
- **`corregir-intuicion`:** retrieval estructurado alrededor del misconception. Predice-antes-de-ver: "¿qué crees que pasará? Pausa y piensa antes de seguir." Ligado al diseño de confusión productiva [P1-§6.1].
- **`decidir-informado`:** retrieval comparativo — "dado X, Y, Z, ¿cuál elegirías?". Matriz de decisión visual consolidando criterios.
- **`orientarse`:** retrieval ligero — "recapitulemos el mapa" al cerrar secciones. Priorizar consolidación vía repetición espaciada [P1-§8.2] sobre testing explícito.
- **`formar-opinion`:** **NO aplica retrieval formal.** La consolidación es retórica: cita culminante, retorno a imagen inicial, eco temático [P1-§10.4]. Insertar quiz rompe el pacto del ensayo.
- **`apreciar`:** **NO aplica retrieval formal.** Consolidación por resonancia sensorial; re-ver la imagen transformada con densidad del argumento [P1-§10.4].

### Por `grado-guion`

- **`guionado`:** retrieval checkpoints planeados literalmente en el script.
- **`semi-guionado`:** retrieval checkpoints en el outline como prompts; fraseo improvisado.
- **`improvisado`:** el retrieval formal no es planeable. Sustituir por **recaps verbales espontáneos del presenter** y, en live stream, por **peer instruction vía chat** ("¿qué piensan? Pongan en el chat antes de continuar") — ver pilar 1 §12.2.

### Por `arco-dominante`

- **`performativo` / `expositivo`:** retrieval explícito natural (pausa-para-probar, pregunta-respuesta).
- **`narrativo`:** retrieval implícito vía call-back narrativo (el personaje recuerda el evento anterior).
- **`argumentativo`:** retrieval como reformulación del lector ("antes creíamos X; ahora..."); NO testing.
- **`conversacional`:** retrieval vía síntesis del anfitrión que resume al invitado para la audiencia.

## Conflictos conocidos

Forzar retrieval formal en `formar-opinion` o `apreciar` (video-ensayo, personal essay) contamina el género — produce el híbrido desafortunado descrito en [P1-§10]. **Flaggear al usuario** y ofrecer consolidación retórica como alternativa.

## Salida esperada

- Lista de retrieval checkpoints con timestamp estimado.
- Formato de cada uno (pausa-para-probar / quiz / pregunta-abierta con
  animación).
- Texto literal de la pregunta generativa (no de reconocimiento).
