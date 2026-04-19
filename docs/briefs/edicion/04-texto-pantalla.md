---
decision: edicion/04-texto-pantalla
etapa: edicion
pregunta: ¿Qué texto añadir en pantalla, con qué jerarquía tipográfica, y con qué contraste?
fuentes:
  - P1-§2.3-#3                 # redundancia
  - P1-§2.3-#2                 # señalización
  - P1-§5.1                    # tipografía para pantalla
  - P1-§3.2                    # contraste WCAG 2.2 AA
  - P2-edicion-patrones
  - P2-edicion-antipatrones    # subtítulos decorativos que duplican narración
  - P2-ficha-fireship          # text labels ≠ narración
  - P2-ficha-kurzgesagt        # labels sobre elementos visuales
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Redundancia** [P1-§2.3-#3]: texto en pantalla IDÉNTICO a la narración
hablada degrada el aprendizaje. Resumen ≠ transcripción. Si el narrador
dice una oración completa, en pantalla van 2-5 palabras que condensan la
idea, NO la oración entera.

**Señalización** [P1-§2.3-#2]: el texto en pantalla es una forma de
señalización cuando destaca lo esencial (un término nuevo, un valor
numérico clave, un nombre propio).

**Tipografía para pantalla** [P1-§5.1]: sans-serif, jerarquía clara,
tamaño legible a distancia típica de visualización. No fuentes
decorativas en contenido informativo.

**Contraste objetivo** [P1-§3.2]: WCAG 2.2 AA — **4.5:1 cuerpo, 3:1
texto grande (≥18pt regular o ≥14pt bold)**.

## Casos

- **Fireship** [P2-ficha-fireship]: text labels cortos (2-5 palabras)
  que complementan el código en pantalla. Nombres de archivos, comandos,
  etiquetas de sección. Nunca duplica la narración.
- **Kurzgesagt** [P2-ficha-kurzgesagt]: texto solo como label sobre
  elemento visual (ej. "La luz: 300.000 km/s"). Cero transcripción.

## Anti-patrón

**Subtítulos decorativos en canal de B-roll que duplican la narración**
[P2-edicion-antipatrones] (distinto a subtítulos de accesibilidad — ver
brief 05-subtitulos). Añade carga extraña sin ganancia.

**Tipografía decorativa o jerarquía ausente.** Si todo el texto está al
mismo peso, el viewer tiene que decidir qué es importante — eso es
trabajo cognitivo transferido que el editor debería resolver.

**Contraste bajo (gris sobre gris, o texto sobre fondo caótico sin
capa translúcida).** Ilegibilidad instantánea para parte de la audiencia.

## Heurística numérica

- **Longitud de label:** máximo 5-7 palabras por elemento.
- **Contraste:** 4.5:1 cuerpo / 3:1 texto grande (verificable con
  contrast-checker — WebAIM, Figma plugins).
- **Tamaño:** mínimo 28-32px para body en 1080p; 40-48px para títulos.
- **Permanencia:** 2-3s por label corto; hasta 5s para bloques de
  información denso (evitar más).

## Conflictos conocidos

Ninguno.

## Salida esperada

- Lista de textos en pantalla por timestamp: contenido literal del
  texto, tipo (label / título / cita / número clave).
- Tipografía usada (familia sans-serif específica) + tamaños +
  jerarquía.
- Contraste verificado con checker (captura o valor numérico).
- Confirmación de que ningún texto duplica literalmente la narración.
