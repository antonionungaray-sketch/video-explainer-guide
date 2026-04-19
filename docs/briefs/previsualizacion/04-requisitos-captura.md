---
decision: previsualizacion/04-requisitos-captura
etapa: previsualizacion
pregunta: ¿Qué setup de captura (escenas OBS, ángulos, b-roll, props) exige el storyboard antes de apretar REC?
fuentes:
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#2                 # señalización
  - P1-§2.3-#4                 # contigüidad espacial
  - P3-preprod-captura         # OBS Scene Management
  - P2-preprod-patrones
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-coding-train
admite-variantes: false
sync: 2026-04-19
version: 1
---

## Principio aplicable

**Ciertas "transiciones" no son post-producibles.** Zoom al menú de
una app, close-up de cara, PiP del creador sobre pantalla, cut-away
a b-roll: el setup tiene que existir **antes** de grabar. Si no se
preparó, la única vía es re-grabar.

**OBS Scene Management como contrato** [P3-preprod-captura]: cada
decisión visual del storyboard (zoom, PiP, fuente alternativa) se
materializa como una escena pre-configurada con fuentes, crop y
shortcut.

**Coherencia** [P1-§2.3-#1] + **señalización** [P1-§2.3-#2] +
**contigüidad espacial** [P1-§2.3-#4]: el storyboard descarta lo no
pedido; zooms y crops son señalización ejecutada en captura, y el
call-out cae cerca del elemento porque el crop ya lo encuadró.

## Auto-skip

Si el storyboard no declara ningún `zoom-pantalla`, `PiP`, `cut-away`,
`cambio-de-ángulo` ni `escena-alternativa`, este brief registra
**"N/A — sin requisitos especiales más allá de la escena base"** y
el skill pasa al cierre.

## Casos

- **Fireship** [P2-ficha-fireship]: pantalla-full + pantalla-zoom-a-
  zona-X (crop 40-60% centrado en región pre-definida) + face-cam-cut-in.
  Zoom nombrado por bloque (`scene: zoom-cli-output`, no "zoom genérico").
- **Midudev** [P2-ficha-midudev]: PiP como fuente fija con posición y
  tamaño pre-definidos y shortcut para mostrar/ocultar.
- **Coding Train** [P2-ficha-coding-train]: "intro/outro face-cam full"
  + "editor full + PiP + terminal"; paso entre bloques por shortcut.

## Anti-patrón

**"Zoom in post".** Sobre 1080p, zoom digital degrada calidad perceptible;
sobre 1440p/4K suma trabajo. Si el storyboard lo pide, pre-configurar
escena OBS [P2-preprod-patrones].

**Escenas sin shortcut.** Cambio vía click introduce pausa visible y
ruido de mouse. Toda escena referenciada necesita shortcut [P3-preprod-captura].

**Escena "por las dudas" o sin crop pre-definido.** La primera viola
coherencia [P1-§2.3-#1] y suele no usarse; la segunda deja framing al
azar, inconsistencia entre bloques.

## Heurística numérica

- **≤4 fuentes activas por escena** [P3-preprod-captura]: dropped
  frames en hardware modesto si se supera.
- **3-5 escenas** cubre tutorial técnico o divulgación estándar; más
  es over-engineering salvo que el storyboard lo justifique.
- **Shortcuts numpad (1-9) o F-keys dedicadas;** evitar combos con
  modificador para cambio rápido en vivo.

## Conflictos conocidos

- **Hardware modesto vs escenas complejas.** Storyboard que pide
  PiP + screen + call-out + overlay = 4 fuentes simultáneas, límite
  en portátiles sin GPU dedicada. Flag al usuario: ¿simplificar
  escena o aceptar posible recorte en post?

## Salida esperada

Sección del Production Brief tipo:

```
## Requisitos de captura
Escenas OBS:
  1. pantalla-full     (display 1)                           [F1]
  2. pantalla-zoom-cli (display 1, crop 40% sobre terminal)  [F2]
  3. cam-full          (webcam 1080p)                        [F3]
  4. coding-pip        (display 1 + cam PiP top-left)        [F4]
Ángulos de cámara:  Frontal default + <si aplica otros>
B-roll:  <lista con duración y bloque destino, o N/A>
Props:  editor/terminal/navegador con archivos X, Y.
Mapa bloque→escena:  B1→cam-full · B2→coding-pip→zoom-cli→coding-pip · …
```

Input **obligatorio** para setup de OBS y para `grabacion/04-escenas`.
