---
decision: guion/08-cta
etapa: guion
pregunta: ¿Qué acción le pides al espectador y cómo cierras el loop narrativo?
fuentes:
  - P1-§6.4                    # transferencia
  - P1-§6.2                    # cierre de open loops
  - P2-idea-guion-antipatrones
  - P2-ficha-fireship
  - P2-ficha-veritasium
  - P2-ficha-midudev
  - P1-§10.4                   # consolidación retórica (formar-opinion / apreciar)
admite-variantes: true
varia-por-eje: [objetivo-cognitivo, plataforma]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Transferencia** [P1-§6.4]: el aprendizaje se consolida cuando se aplica
en un contexto distinto al original. Un CTA que invita a aplicar
(construir, probar, enseñar a otro) produce mejor retención que "suscríbete".

**Cierre de open loop** [P1-§6.2]: la pregunta abierta del hook debe
resolverse en el cierre. Dejarla abierta frustra (Zeigarnik inverso).

## Casos

- **Fireship** [P2-ficha-fireship]: CTA = link al repo/docs + "haz el
  tutorial oficial" (invita a transferencia). "Suscríbete" al final,
  después del valor entregado.
- **Veritasium** [P2-ficha-veritasium]: CTA = pregunta generativa
  ("¿cómo aplicarías esto en tu caso?") + invitación a otro video
  relacionado.
- **Midudev** [P2-ficha-midudev]: CTA al curso propio explícito al final,
  bien justificado con lo que se aprendería nuevo.

## Anti-patrón

**"Suscríbete al inicio" sin valor entregado** [P2-idea-guion-antipatrones]:
caída típica de retention. El CTA de suscripción al inicio, antes de
demostrar valor, correlaciona con abandono a los 30s.

**CTA genérico sin acción específica.** "Espero les haya gustado" no
invita a nada. Correlaciona con click-through rate bajo.

## Heurística numérica

- **CTA ≤ 15s.** Más es auto-promoción que rompe el cierre.
- **1 acción específica.** No 3 opciones — reduce la probabilidad de cada
  una por fatiga de decisión.

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** CTA de aplicación ("prueba esto ahora en tu stack", "link al repo"). Verificable.
- **`corregir-intuicion`:** CTA de reflexión ("¿qué otra intuición tuya podría estar errada?") + link a contenido relacionado.
- **`decidir-informado`:** CTA decisor ("¿qué elegirías para tu caso? cuéntame") + link a comparativa extendida.
- **`orientarse`:** CTA de profundización ("si te interesó, mira X"), newsletter, siguiente episodio.
- **`formar-opinion`:** CTA **retórico**, no utilitario — "déjame tus reflexiones", "comparte con alguien que defiende Y". NO cierre didáctico.
- **`apreciar`:** CTA implícito — invitación a volver a ver el objeto con la densidad acumulada. Sin pitch.

### Por `plataforma`

- **`long-form-horizontal`:** CTA explícito al cierre, ≤15s, 1 acción específica.
- **`shorts-vertical`:** CTA implícito (follow/profile); NO pitch extenso — rompe el loop del short.
- **`podcast-audio-primario`:** CTA en sponsor reads + mención al newsletter/link en descripción.
- **`live-with-vod`:** CTA emergente en vivo ("follow on Twitch"); re-upload VOD admite CTA editado.
- **`corporate-lms`:** CTA = completar quiz / pasar al siguiente módulo. Sin "suscríbete".

## Conflictos conocidos

Forzar CTA utilitario en modalidades `formar-opinion`/`apreciar` rompe el pacto retórico. Ver [P1-§10.4] y `guion/05-retrieval` Ajuste por eje.

## Salida esperada

- Cierre del open loop del hook (una frase explícita que conecta hook↔cierre).
- CTA específico: acción concreta ("prueba X con este repo", "lee Y en el
  link", "cuéntame en comentarios qué harías en Z caso").
- Suscripción opcional al final, después del valor — no al inicio.
