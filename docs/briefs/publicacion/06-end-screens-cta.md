---
decision: publicacion/06-end-screens-cta
etapa: publicacion
pregunta: ¿Qué siguiente paso ofrecer al espectador — CTA explícito o cross-funnel?
fuentes:
  - P1-§6.4                    # transferencia
  - P1-§8.2                    # spacing — recomendar contenido relacionado
  - P2-publicacion-patrones
  - P2-publicacion-variantes
  - P2-publicacion-antipatrones
  - P2-ficha-fireship          # cross-funnel a fireship.io
  - P2-ficha-mouredev          # cross-funnel Discord + curso
  - P2-ficha-theprimeagen      # cross-funnel multichannel
  - P2-ficha-dotcsv            # CTA explícito (excepción hispana)
admite-variantes: true
varia-por-eje: [objetivo-cognitivo, plataforma]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Transferencia** [P1-§6.4]: el aprendizaje se consolida cuando se
aplica en contexto distinto. CTA que invita a aplicar ("prueba X con
este repo", "migra uno de tus proyectos") supera a "suscríbete".

**Spacing para retención cruzada** [P1-§8.2]: recomendar contenido
relacionado (no idéntico) refuerza la red conceptual. End screen con
video temáticamente adyacente vale más que "video random del canal".

**Cross-funnel específico vs CTA genérico** [P2-publicacion-patrones]:
los creators del atlas con modelo de negocio claro redirigen al
ecosistema propio (Discord, curso, podcast, canal secundario). La
posición del sponsor o CTA depende de su **afinidad temática**, no
de maximizar dinero.

## Casos

- **Cross-funnel específico, CTA explícito minimal** [P2-ficha-fireship]:
  Fireship → fireship.io (cursos pagos). Pitch brevísimo; el funnel
  está en el valor entregado antes.
- **Cross-funnel a comunidad Discord + curso** [P2-ficha-mouredev]:
  MoureDev → mouredev.pro. Discord gratuito como puerta de entrada;
  curso premium como conversión.
- **Cross-funnel multichannel** [P2-ficha-theprimeagen]: Primeagen →
  @ThePrimeTimeagen + @TheVimeagen + boot.dev. Cada video en el
  canal principal invita a otro canal del ecosistema.
- **CTA explícito completo** [P2-ficha-dotcsv]: DotCSV — único del
  atlas que hace el pitch clásico "suscríbete/like/comparte/campanita"
  sin penalización de engagement. Interpretación: en comunidades
  hispanas técnicas donde la expectativa cultural lo espera, omitirlo
  puede parecer distante [P2-publicacion-variantes].
- **Canal pequeño SIN ecosistema propio** (default para creators
  nuevos del toolkit): sin cross-funnel ni curso/Discord. Propuesta
  base: CTA de transferencia [P1-§6.4] + end screen con video
  relacionado o playlist del canal + botón suscripción. Pitch
  clásico NO por default a menos que la audiencia objetivo
  culturalmente lo demande.

## Anti-patrón

**"Antes de empezar, suscríbete" al inicio**
[P2-publicacion-antipatrones]: caída típica de retention en 0-30s.
Sabotea antes de entregar valor.

**CTA genérico sin acción específica** ("espero les haya gustado,
suscríbete"): bajo click-through a lo que sea.

**Asumir "anti-suscríbete es regla universal"**: DotCSV prueba lo
contrario. Matchear al canal objetivo — la cultura de la audiencia
decide, no una regla absoluta.

**End screen con video no relacionado** ("ver un video más del
canal — cualquiera"): pierde la oportunidad de reforzar la red
conceptual [P1-§8.2].

## Heurística numérica

- **Duración end screen:** 15-20s (mínimo para que YouTube lo
  muestre, máximo antes de que se sienta promo larga).
- **Elementos en end screen:** máximo 3 (1 video relacionado + 1
  suscripción + 1 link externo/playlist). Más es saturación.
- **CTA duración:** ≤15s en el cierre del video (antes del end
  screen). Más rompe el cierre narrativo.
- **1 acción específica como CTA primario**, no 3 opciones — fatiga
  de decisión reduce probabilidad de cada una.

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** CTA de aplicación + siguiente módulo/repo. Convergencia con [guion/08-cta].
- **`corregir-intuicion`:** CTA = contenido relacionado que refuerce el modelo corregido.
- **`decidir-informado`:** CTA = comparativa extendida, matriz de decisión, siguiente evaluación.
- **`orientarse`:** CTA = profundizar — newsletter, siguiente video en serie, link a recurso maestro.
- **`formar-opinion`:** CTA retórico — "reflexiona", "comparte", "discute". NO pitch comercial directo.
- **`apreciar`:** end-screen sobrio; link a obra relacionada o al autor. Sin pitch.

### Por `plataforma`

- **`long-form-horizontal`:** end-screen YouTube con 2 elementos (video relacionado + subscribe). CTA verbal al cierre ≤15s.
- **`shorts-vertical`:** no existe end-screen formal; CTA implícito vía follow.
- **`podcast-audio-primario`:** cross-promo otro episodio + newsletter en descripción.
- **`live-with-vod`:** live sin end-screen; VOD re-upload admite el formato estándar.
- **`corporate-lms`:** end-screen = "completar quiz" o "pasar al siguiente módulo". No CTAs externos.

## Conflictos conocidos

- **Regla "no-suscríbete"** vs **DotCSV evidencia**: no hay regla
  universal. Flaggear al usuario que la decisión depende de la
  cultura de su audiencia objetivo.

## Salida esperada

- CTA específico al final del video (acción concreta, no genérica).
- End screen configurada con: (a) video relacionado temáticamente
  (no cualquiera del canal), (b) botón de suscripción, (c)
  link/playlist opcional.
- Decisión explícita sobre pitch clásico "suscríbete/like" —
  sí/no con justificación cultural de la audiencia.
