---
decision: edicion/10-overlays-auxiliares
etapa: edicion
pregunta: ¿Qué overlays auxiliares generás en post (intro animada, idea-bulb sobre presentador, lower-third, callout animado, separador, ícono contextual) y con qué herramienta los producís?
fuentes:
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#2                 # señalización
  - P1-§2.3-#5                 # contigüidad temporal
  - P1-§5.3                    # posición de lower thirds
  - P2-edicion-patrones
  - P2-edicion-antipatrones
  - P2-ficha-fireship          # overlays + memes densos
  - P2-ficha-kurzgesagt        # icon-language consistente
  - P2-ficha-3b1b              # color + movimiento sobre término
  - P3-edicion-composicion     # Remotion / Motion Canvas / HyperFrames / Manim
admite-variantes: true
sync: 2026-04-19
version: 1
---

## Principio aplicable

**Señalización** [P1-§2.3-#2]: overlays pueden guiar la mirada hacia
lo que importa. **Coherencia** [P1-§2.3-#1]: si el overlay no cumple
función (señalizar, contextualizar, segmentar), agrega carga extraña.
**Contigüidad temporal** [P1-§2.3-#5]: aparece exacto cuando se lo
nombra o cuando la idea ocurre.

**Diferencia con briefs vecinos.** Señalización (02) destaca contenido
ya capturado. B-roll (06) es footage pre-grabado que corta al plano.
Transiciones (09) van entre bloques. **Overlays auxiliares agregan
elementos gráficos o animados que no existen en el crudo** y viven
dentro de un bloque. Catálogo: `intro-animada`, `outro-animada`,
`lower-third`, `idea-bulb`, `callout-flecha`, `separador`,
`highlight-icono`.

## Casos

- **Fireship** [P2-ficha-fireship]: overlays densos (icons, memes,
  lower-thirds) alineados al WPM alto. La audiencia técnica decodifica
  el vocabulario visual [P2-edicion-patrones].
- **Kurzgesagt** [P2-ficha-kurzgesagt]: icon-language consistente — no
  son overlays puntuales, es todo el video. Cuando el creador solo
  quiere puntuales, imitar paleta y geometría, no la densidad.
- **3Blue1Brown** [P2-ficha-3b1b]: highlight de término en ecuación
  con color + movimiento sincronizado a la voz. Overlay como
  señalización Mayer pura.

## Anti-patrón

**Overlay decorativo sin función** (partículas, logos flotantes,
swoosh ornamental): violan coherencia [P1-§2.3-#1]
[P2-edicion-antipatrones].

**Overlay permanente** (lower-third a 20s, flecha que no desaparece):
el sistema atencional se habitúa y el elemento deja de funcionar.

**Idea-bulb genérico en cada frase del presentador.** Reservarlo al
momento donde se verbaliza una idea nueva.

**Lower-third mal posicionado.** Fuera del tercio inferior o tapando
el rostro viola [P1-§5.3].

## Heurística numérica

- **Duración:** intro/outro 2-5s · lower-third 3-5s · idea-bulb y
  callout 1-3s · separador 0.5-1s · highlight-icono 1-2s.
- **Densidad:** tutorial técnico tolera 2-4/min (Fireship-like);
  divulgación narrada con b-roll denso, ≤1/min.
- **Posición lower-third:** tercio inferior con safe area 5% del ancho
  [P1-§5.3].
- **Paleta:** 2-3 colores consistentes con señalización (brief 02)
  para no fragmentar la identidad visual.

## Conflictos conocidos

- **Canal visual ya saturado** (Kurzgesagt-style): agregar overlays
  extra es sobre-decoración. Flag: desactivar en bloques con motion
  graphics intensos.
- **Fireship-dense vs audiencia principiante.** Overlay denso asume
  decodificación rápida. Con audiencia no-técnica, bajar densidad.

## Salida esperada

Lista por bloque, ordenada por timestamp:

```
OVERLAYS AUXILIARES
  B2  lower-third  00:34-00:39  "Dr. Ana Pérez · Investigadora NLP"
  B4  idea-bulb    02:11-02:13  foquito amarillo sobre cabeza
  B5  callout      02:58-03:00  flecha al botón "Deploy"
  B7  separador    05:40-05:41  transición a outro
HERRAMIENTA DE GENERACIÓN
  Remotion (lower-thirds + intro)  [P3-edicion-composicion]
  HyperFrames para idea-bulb / callout generados por agente IA
```

Cada entry: bloque, tipo, timestamps, descripción o prompt IA,
herramienta. Los IDs llegan propagados desde el Production Brief
locked (`previsualizacion/04-requisitos-captura`).
