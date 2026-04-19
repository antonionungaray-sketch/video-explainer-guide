---
decision: grabacion/07-b-roll-plan
etapa: grabacion
pregunta: ¿Qué material auxiliar (B-roll, screenshots, recursos) necesitás producir antes de editar?
fuentes:
  - P1-§2.3-#5                 # contigüidad temporal
  - P1-§2.3-#4                 # contigüidad espacial
  - P1-§2.3-#1                 # coherencia (B-roll decorativo)
  - P2-preprod-patrones
  - P2-preprod-antipatrones    # stock footage decorativo
  - P2-ficha-veritasium        # B-roll documental pre-producido
  - P2-ficha-fireship          # screenshots + memes
  - P2-ficha-kurzgesagt        # animación pre-producida por equipo
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Contigüidad temporal y espacial** [P1-§2.3-#5] [P1-§2.3-#4]: los
visuales de apoyo deben aparecer **en sincronía** con la frase que
ilustran y **cerca del elemento** al que se refieren. Para que esto
funcione en edición, los recursos deben estar disponibles antes —
cazarlos en mitad del edit rompe flujo.

**Pre-producir lo que no sea grabable en vivo** (animaciones custom,
diagramas, screenshots de otros entornos, recortes de otros videos)
ahorra horas de fricción en edición y mejora la calidad del resultado.

## Casos

- **Tutorial técnico simple:** screenshots del IDE en momentos clave,
  terminal con comandos específicos, diagrama conceptual (Excalidraw,
  draw.io) — preparables en 15-30 min antes de la grabación principal.
- **Divulgación documental** [P2-ficha-veritasium]: B-roll
  cinematográfico, entrevistas, on-location. Semanas de pre-producción.
  Fuera del scope del creator típico del toolkit.
- **Divulgación animada** [P2-ficha-kurzgesagt]: animación producida
  por equipo dedicado. Fuera del scope de creator solo.
- **Tutorial denso con overlays** [P2-ficha-fireship]: screenshots,
  meme inserts, logos y gráficos — biblioteca propia reutilizada entre
  videos, se va construyendo con el tiempo.

## Anti-patrón

**Planear B-roll "lo busco en edición"** sin lista previa: en edición
se descubre que "aquí faltaría un diagrama", se pierde media hora
haciéndolo, se vuelve al edit, se repite. Múltiples context switches.
Listar antes, producir en batch, editar sin interrupciones.

**Stock footage decorativo** (manos escribiendo, código verde matrix):
carga extraña sin función [P2-preprod-antipatrones] [P1-§2.3-#1]. Mejor
sin B-roll que con B-roll genérico.

**Screenshots sin resolución suficiente para el frame final**
(capturas a 1280×720 intentando llenar 1920×1080 con escalado):
pixelación visible, señal de producción descuidada. Capturar siempre
a resolución nativa o superior.

## Heurística numérica

- **Resolución de screenshots:** ≥1920×1080 nativa (capturar desde
  monitor 1080p o mayor, sin escalado).
- **Tiempo estimado de producción de B-roll pre-grabación:** 30-60
  min por cada 5-7 min de video final (para creator solo, contenido
  técnico con screenshots + diagramas simples).
- **Formato de archivos:** PNG para screenshots sin animación; MP4
  H.264 para capturas animadas; SVG para diagramas editables.
- **Nomenclatura:** `<bloque>-<slug>.<ext>` (ej. `03-diagrama-arquitectura.png`)
  para ubicar rápido en edición.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Lista de recursos a producir antes de grabar: nombre, tipo, timestamp
  aproximado en el video donde va.
- Lista de recursos a conseguir de terceros (con atribución planeada):
  screenshots de docs oficiales, logos, recortes de otros videos con
  permiso.
- Carpeta organizada con los recursos listos antes del primer cut.
