---
decision: publicacion/02-thumbnail
etapa: publicacion
pregunta: ¿Qué imagen captura la decisión de hacer click sin engañar?
fuentes:
  - P1-§3.2                    # contraste WCAG
  - P1-§3.3                    # caras y procesamiento social
  - P1-§1.1                    # saliencia bottom-up
  - P2-publicacion-patrones
  - P2-ficha-fireship          # ilustración/logo sin cara
  - P2-ficha-3b1b              # ilustración matemática sin cara
  - P2-ficha-kurzgesagt        # ilustración animada sin cara
  - P2-ficha-veritasium        # face + expresión
  - P2-ficha-midudev           # face-cam + texto hispano
  - P3-publicacion-thumbnails  # Figma / Canva / Photopea
  - P3-publicacion-analitica   # TubeBuddy / VidIQ A/B test
admite-variantes: true
varia-por-eje: [plataforma]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Saliencia bottom-up** [P1-§1.1]: el thumbnail compite en una grilla
de ~20 miniaturas simultáneas. La decisión de click ocurre en <1s.
Necesita contraste alto, jerarquía visual inmediata, **un** elemento
dominante.

**Procesamiento social rápido** [P1-§3.3]: el rostro humano activa
atención en ms. Expresión facial (sorpresa, curiosidad, convicción)
comunica mucho más que texto descriptivo. **Condicional, no
requisito:** canales sin cara (Fireship, 3B1B, Kurzgesagt) lo
compensan con ilustración/logo + texto [P2-publicacion-patrones].

**Contraste** [P1-§3.2]: cualquier texto sobre la imagen cumple WCAG
2.2 AA (4.5:1 cuerpo, 3:1 texto grande). Si no se ve en mobile
(~180×101 px en app), no funciona.

## Casos

- **Sin cara — ilustración/logo + texto grande:** Fireship
  [P2-ficha-fireship], 3B1B [P2-ficha-3b1b], Kurzgesagt
  [P2-ficha-kurzgesagt]. 3 de los canales más grandes del atlas.
  Condición: la ilustración debe comunicar el "qué" inmediatamente.
- **Face + expresión dramática:** Veritasium [P2-ficha-veritasium]
  — expresión de sorpresa o concentración + texto grande + elemento
  del tema. Default anglo para divulgación face-cam.
- **Face-cam + texto hispano:** Midudev [P2-ficha-midudev] — cara
  del creador + 2-3 palabras grandes. Default hispano tutorial
  técnico.
- **Heurística de canal pequeño (<1k subs):** priorizar face-cam
  sobre ilustración/logo en esta fase. La cara construye
  parasocialidad + reconocimiento de marca más rápido, crítico
  cuando todavía no hay audiencia recurrente. Pivotar a ilustración
  solo si el estilo visual del canal lo demanda (Fireship-clone) y
  el creador ya domina la producción gráfica.

## Anti-patrón

**Texto pequeño ilegible en preview mobile**: si a 180×101 px no se
lee, no funciona.

**Thumbnail clickbait que no coincide con contenido**: retention
cae en 0-30s (viewer descubre el bait), el algoritmo castiga.

**Thumbnail con 4+ elementos compitiendo por atención:** saturación.
1-2 elementos dominantes + texto.

**Face inexpresiva frontal tipo foto de perfil:** no comunica stake
ni emoción. Mejor expresión exagerada genuina (sorpresa real, no
performance).

## Heurística numérica

- **Tamaño de texto:** el más grande de los elementos; legible a
  180×101 px (test: reducir el thumbnail a ese tamaño y verificar).
- **Palabras en texto:** 2-4 típicamente. >5 es ensayo.
- **Contraste texto/fondo:** ≥4.5:1 (WCAG 2.2 AA) verificado con
  checker.
- **Saturación de color:** alta en el elemento dominante — compite
  mejor en grilla.
- **Herramientas** [P3-publicacion-thumbnails]: Figma, Canva,
  Photopea (web gratis alternativa a Photoshop), generadores IA
  (Midjourney, DALL-E) para bases.

## Ajuste por eje

### Por `plataforma`

- **`long-form-horizontal`:** thumbnail 16:9 con texto grande + imagen central. A/B test vía TubeBuddy/VidIQ.
- **`shorts-vertical`:** thumbnail 9:16; el primer frame del video importa más que el thumbnail.
- **`podcast-audio-primario`:** thumbnail de episodio + foto del invitado (formato Spotify/Apple).
- **`live-with-vod`:** thumbnail live genérico; el VOD post necesita thumbnail custom.
- **`corporate-lms`:** sin thumbnail discovery — icon o number de módulo suficiente.

## Conflictos conocidos

Ninguno directo. El caso "sin cara" no contradice P1-§3.3 porque el
principio es condicional, no requisito.

## Salida esperada

- Thumbnail exportado a 1920×1080 (resolución sugerida YouTube).
- Verificación de legibilidad a 180×101 px.
- Verificación de contraste en texto (captura o valor numérico).
- A/B set opcional: 2-3 variantes si el creador va a usar
  TubeBuddy/VidIQ para A/B test post-publicación
  [P3-publicacion-analitica].
