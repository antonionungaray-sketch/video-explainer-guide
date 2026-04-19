---
decision: grabacion/04-escenas
etapa: grabacion
pregunta: ¿Qué escenas preparás antes de grabar, y cuándo cambiar entre ellas?
fuentes:
  - P1-§2.3-#6                 # segmentación
  - P1-§4.4                    # frecuencia de cortes: heurística, no ley
  - P2-preprod-patrones
  - P2-ficha-coding-train      # escenas para live-coding
  - P2-ficha-mouredev          # escenas para live-coding hispano
  - P3-preprod-captura         # OBS Scene Management
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Las escenas siguen la segmentación del guión** [P1-§2.3-#6]. Cada
bloque narrativo (hook, bloques de contenido, retrieval checkpoint,
cierre) tiene una o varias escenas prepaconfiguradas que se activan
cuando tocan. La escena es herramienta de producción, no decisión
creativa distinta al guión.

**OBS/Streamlabs Scene Management** [P3-preprod-captura]: permite
armar escenas (fuente cam + fuente pantalla + overlays + transiciones)
y cambiarlas en vivo con un shortcut durante la grabación. Reduce
edición posterior.

**Cortes como función, no decoración** [P1-§4.4]: cada cambio de
escena debería tener motivo claro (nuevo bloque, nuevo ángulo, ajuste
visual alineado con cambio conceptual). Cambios de escena sin motivo
son cortes decorativos en edición.

## Casos

- **Escenas base para tutorial técnico:** (1) Hook — face-cam full
  frame; (2) Contenido — screen full + face-cam PiP; (3) Call-out —
  screen zoom + overlay texto; (4) Cierre/CTA — face-cam full + lower
  third con link.
- **Escenas para divulgación face-cam:** (1) Narración — face-cam
  full; (2) Visual/B-roll — pantalla con imagen/diagrama; (3)
  Transición — animación breve sobre color de marca.
- **Escenas para live-coding** [P2-ficha-coding-train] [P2-ficha-mouredev]:
  (1) Intro/Outro — face-cam full; (2) Coding — editor full + face-cam
  PiP + terminal/console lateral. El contenido dicta una escena
  dominante; las otras son transiciones naturales.

## Anti-patrón

**Cambiar escena sin motivo conceptual** (ej. cada 30s por inercia):
genera ritmo visual decorativo que satura [P1-§4.4]. La escena cambia
cuando cambia la idea.

**Grabar todo en una escena y separar en edición.** Funciona pero
duplica trabajo en post (recortes, reframings) que OBS resuelve en
grabación con 2-click. Preparar escenas es inversión front-loaded.

**Escenas complejas (6+ fuentes superpuestas) que rompen performance
en grabación.** Dropped frames por CPU/GPU saturada. Mantener escenas
en ≤4 fuentes activas simultáneas.

## Heurística numérica

- **Número de escenas:** 3-5 típicamente cubren tutorial técnico o
  divulgación. Más es over-engineering inicial.
- **Fuentes por escena:** ≤4 activas. Más causa dropped frames en
  hardware modesto.
- **Tiempo de cambio (transición):** 0.3-1s. Cortes duros (0s) para
  estilo Fireship-denso.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Lista de escenas preparadas (nombre + composición de fuentes +
  shortcut).
- Alineación con el outline del guión: qué escena para cada bloque.
- Sanity test: grabar 30s cambiando entre todas las escenas para
  confirmar que la PC aguanta sin dropped frames.
