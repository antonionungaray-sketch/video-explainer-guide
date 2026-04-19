# Auditoría de catálogos y rediseño del catálogo de overlays auxiliares

**Fecha:** 2026-04-19
**Scope:** training-video-toolkit · brief `edicion/10-overlays-auxiliares` · template `storyboard-draft.template.html` · skills `previsualizacion-entrenamiento` y `edicion-entrenamiento`.
**Decisión principal:** reformar el catálogo cerrado `OVERLAY_TIPOS` quitando tres entradas inventadas, agregando cinco universales respaldadas por pilar, renombrando una y dejando escape hatch libre para cualquier overlay fuera del canon.

---

## 1. Motivación

El toolkit tiene una filosofía de tres capas donde los pilares 1 (ciencia cognitiva) y 2 (tendencias y casos) son la fuente de verdad. Cualquier enum cerrado impuesto desde el código o desde un brief debe justificarse contra ese contrato: o bien refleja una taxonomía universal ya reconocida en la industria, o bien se respalda explícitamente en un pilar citable. De lo contrario, el catálogo le impone forma al creador en lugar de dejar que la necesidad del video la produzca.

La fase G cerró la primera versión del brief `edicion/10-overlays-auxiliares` con un enum de siete tipos (`intro-animada`, `outro-animada`, `lower-third`, `idea-bulb`, `callout-flecha`, `separador`, `highlight-icono`). En revisión quedó claro que varios tipos son ejemplos concretos presentados como si fueran categorías, sin respaldo ni en industria ni en pilar. Además uno estaba sesgado hacia tutoriales técnicos, cuando el toolkit declara servir también a divulgación, formación corporativa, onboarding y explainers para público general.

## 2. Auditoría de todos los catálogos del toolkit

Revisé los diez enums presentes hoy. Filtro aplicado: el catálogo pasa si (a) es taxonomía universal de producción o cinematografía, (b) es estándar técnico objetivo externo al toolkit, o (c) está respaldado en un pilar citable.

| # | Catálogo | Valores | Origen | Veredicto |
|---|----------|---------|--------|-----------|
| 1 | `TIPO_OPTS` (bloque) | camara, demo-pantalla, mixto, b-roll | Taxonomía universal de producción | Se queda |
| 2 | `TRANS_OPTS` | corte seco, cross-dissolve, scene-switch OBS, J-cut, L-cut, match cut, fade a negro | Técnica estándar de edición, brief 09 | Se queda |
| 3 | `ENC_OPTS` | WS, MS, CU, ECU | Cinematografía clásica | Se queda (la cita al pilar es implícita; conviene reforzarla) |
| 4 | `OVERLAY_TIPOS` | siete tipos (ver §3) | Mixto — parcial | Reformar (objeto de este spec) |
| 5 | Estado inicial del demo | archivo abierto / datos-mock / versión crítica | Ejemplo descriptivo en plantilla, no enum en código | Se queda |
| 6 | Cursor del demo | visible / oculto / con highlight | Ejemplo descriptivo | Se queda |
| 7 | Fallback del demo | checkpoint / re-grabar / narrar y seguir | Ejemplo operacional | Se queda |
| 8 | Método de pacing | calculado / lectura manual | Binario operacional | Se queda |
| 9 | Transición en plantilla Production Brief | corte seco / fade / zoom-out / … | Abierto, apunta a TRANS_OPTS | Se queda |
| 10 | Tipo en plantilla Production Brief | camara / demo / mixto / b-roll | Apunta a TIPO_OPTS | Se queda |

**Resultado de la auditoría:** nueve de diez catálogos pasan el filtro. Solo `OVERLAY_TIPOS` requiere reforma, y dentro de él solo cuatro de siete entradas son problemáticas.

## 3. Desglose de `OVERLAY_TIPOS`

| Tipo | Universal en industria | En pilar | Cross-género | Decisión |
|------|------------------------|----------|--------------|----------|
| `lower-third` | Sí | Sí — P1-§5.3 | Sí | Se queda |
| `intro-animada` | Sí | Implícito P2 (casos) | Sí | Se queda |
| `outro-animada` | Sí | Implícito P2 (casos) | Sí | Se queda |
| `callout-flecha` | "Callout" sí; "flecha" arbitrario | P1-§2.3-#2 | Sí | Renombrar a `callout` (forma libre) |
| `idea-bulb` | No | No | No | Fuera (es un caso concreto de `callout`) |
| `separador` | No — se solapa con `TRANS_OPTS` o `chapter-marker` | No | No | Fuera |
| `highlight-icono` | No — tautología | No | No | Fuera |

## 4. Catálogo final propuesto

Diez tipos universales con respaldo en pilar, más un escape hatch `otro` para cualquier overlay fuera del canon.

| Tipo | Respaldo en pilar | Función canónica |
|------|-------------------|------------------|
| `intro-animada` | P2 casos (Fireship, Kurzgesagt, 3B1B, QuantumFracture) | Apertura: branding + título + promesa |
| `outro-animada` | P2 casos | Cierre: CTA + créditos + siguiente paso |
| `lower-third` | P1-§5.3 | Identificación de persona en pantalla |
| `callout` | P1-§2.3-#2 señalización | Marca un elemento que ya existe en el cuadro |
| `chapter-marker` | P1-§2.3-#6 segmentación + P1-§2.3-#7 pre-entrenamiento | Título de sección, marca una unidad cognitiva |
| `stat-callout` | P1-§2.3-#2 señalización | Número o estadística presentada con tamaño dominante |
| `pull-quote` | P1-§2.3-#2 señalización + P1-§5.1 tipografía | Cita destacada, texto entrecomillado con autor |
| `progress-indicator` | P1-§2.3-#6 segmentación + P1-§6.2 bucles abiertos | Orientación del espectador en formato largo |
| `question-prompt` | P1-§8 retrieval practice | Pregunta on-screen para recuperación activa |
| `answer-reveal` | P1-§8 retrieval practice | Respuesta tras pausa deliberada |
| `otro` | No aplica | Descripción libre + prompt IA; salida del catálogo para overlays no universales |

Cada entrada incluirá su cita al pilar en el tooltip de la UI y en el brief 10, para que un principiante vea no solo el término sino por qué está canonizado.

## 5. Lo que sale y por qué

- `idea-bulb`: es una forma concreta de `callout` (ícono sobre elemento). No hay pilar ni término universal. Cualquier necesidad tipo foquito se captura con `callout` + descripción "foquito amarillo sobre cabeza del presentador".
- `separador`: se solapa con `TRANS_OPTS` (transición entre unidades) o con `chapter-marker` (título de sección). No hay pilar ni función diferencial.
- `highlight-icono`: tautología. "Ícono que resalta" es una función, no un tipo. Todos los casos caen en `callout` o `stat-callout`.
- `keycaps` (propuesto y luego descartado): pasó el filtro de universal en industria pero solo dentro de tutoriales técnicos de software. No es cross-género. Los videos de divulgación científica, explainers económicos, onboarding corporativo o formación empresarial no lo usan. Si un tutorial técnico lo necesita, entra vía `otro`.
- `logo-bug` y `ticker`: son broadcast, no pedagogía. Violan principio de coherencia (P1-§2.3-#1). No entran.
- `split-screen`: se solapa con el tipo de bloque `mixto` de `TIPO_OPTS`. No es overlay, es composición del plano.

## 6. Escape hatch: `otro`

Cualquier overlay fuera de los diez canónicos se declara como `otro` con descripción libre y prompt IA opcional. El editor en fase de post genera la forma según la descripción, respetando los principios del brief 10 (señalización, contigüidad temporal, coherencia, posición). En la UI del storyboard se dibuja como un badge genérico ámbar con la etiqueta `OTRO` y el texto de la descripción abajo.

## 7. Impacto técnico

### 7.1 Brief `edicion/10-overlays-auxiliares.md`

- Actualizar la lista del principio aplicable con los diez tipos nuevos y el `otro`.
- Renombrar `callout-flecha` → `callout` donde aparezca.
- Agregar a `fuentes:` los cinco IDs nuevos que hoy no están: `P1-§2.3-#6` (segmentación, para `chapter-marker` y `progress-indicator`), `P1-§2.3-#7` (pre-entrenamiento, para `chapter-marker`), `P1-§5.1` (tipografía para pantalla, para `pull-quote`), `P1-§6.2` (bucles abiertos, para `progress-indicator`) y `P1-§8` (retrieval practice, para `question-prompt` y `answer-reveal`). Cada ID declarado en `fuentes:` debe tener al menos una cita inline en el cuerpo.
- Ejemplo de salida actualizado con los tipos aplicables a varios géneros, no solo tutorial técnico. Usar al menos un caso no-técnico (ej. explainer económico con `stat-callout` de inflación, o divulgación con `pull-quote` de una cita citable).
- Mantener dentro del contrato 40-100 líneas.

### 7.2 Template `storyboard-draft.template.html`

- Reemplazar `OVERLAY_TIPOS` con los diez tipos nuevos + `otro`.
- Agregar función de dibujo con rough.js por cada tipo nuevo:
  - `drawChapterMarker` (tarjeta grande centrada con título y un separador horizontal).
  - `drawStatCallout` (número grande en esquina superior izquierda).
  - `drawPullQuote` (bloque con comillas grandes y líneas de texto simuladas).
  - `drawProgressIndicator` (barra segmentada en borde superior).
  - `drawQuestionPrompt` (caja con símbolo de pregunta grande).
  - `drawAnswerReveal` (caja con símbolo de check o igual grande).
  - `drawOtro` (badge genérico ámbar con etiqueta "OTRO" y punto-punto-punto).
- Eliminar `drawIdeaBulb`, `drawHighlightIcon`, `drawSeparator`.
- Adaptar `drawCalloutArrow` → `drawCallout` con forma genérica (flecha curva sigue siendo la representación por defecto, pero el tipo conceptual ya no obliga a que sea flecha).
- `drawOverlayBadges` recibe el nuevo catálogo y despacha por tipo.
- Chips en vista Cómic muestran la abreviación nueva (`CHAP`, `STAT`, `QUOTE`, `PROG`, `Q?`, `A!`, `OTRO`).
- Editor en vista Tabla incluye los diez tipos + `otro`. Cuando el tipo es `otro`, el campo `descripcion` se marca obligatorio visualmente.
- Tooltip de cada opción del select muestra una línea con la cita al pilar correspondiente (ej. `lower-third` → "Identificación · P1-§5.3").

### 7.3 Migración y compatibilidad

El demo hidratado `/tmp/storyboard-draft-demo.html` usa tipos viejos. Se re-hidrata con tipos nuevos — no hay compromiso de backwards compatibility porque el demo es efímero y el HTML del usuario tampoco es persistente (se regenera cada vez desde el Production Brief en markdown, que es el modelo real).

El brief 10 declara en el frontmatter `version: 2` después del cambio.

### 7.4 Skills

- `previsualizacion-entrenamiento`: actualizar la sección "UI de iteración visual" para mencionar los tipos nuevos y el `otro`.
- `edicion-entrenamiento`: la sección `═══ 10. OVERLAYS AUXILIARES ═══` del plan de salida no requiere cambios estructurales, solo ajustar los ejemplos.

### 7.5 Verificación

- Correr `scripts/verificar-briefs.sh --strict` para confirmar que todas las citas inline nuevas del brief 10 están en `fuentes:`.
- Correr `scripts/regenerar-vistas.sh` porque el frontmatter del brief 10 cambia (`version` y posiblemente `fuentes`).
- Probar el demo en navegador: verificar que los diez pictogramas dibujan razonablemente sobre las viñetas y que el `otro` se ve consistente.

## 8. Principio reutilizable

Este spec establece un filtro que se aplica a cualquier catálogo que el toolkit intente introducir en el futuro:

> Un catálogo cerrado es legítimo solo si cada entrada (a) refleja una taxonomía universal reconocida en la industria de producción o cinematografía o estándar técnico externo, **o** (b) está explícitamente respaldada por un pilar citable, **y** (c) aplica cross-género a los cinco formatos que cubre el toolkit (tutorial técnico, divulgación, formación corporativa, onboarding, explainer general).

Cualquier entrada que no pase los tres filtros va al escape hatch `otro` o equivalente libre.

## 9. Follow-up — Auditoría de sesgo hacia tutorial técnico en el resto del toolkit

Al aplicar el filtro cross-género a `OVERLAY_TIPOS` emergió una observación que excede este spec pero que debe documentarse y ejecutarse inmediatamente después:

El toolkit declara servir a cinco formatos (tutorial técnico, divulgación, formación corporativa, onboarding, explainer general) pero varias capas están sesgadas hacia tutorial técnico.

### Hipótesis a verificar

1. **Pilar 2 — fichas de casos.** Las fichas presentes (Fireship, Primeagen, Coding Train, Midudev, 3B1B, Kurzgesagt, Veritasium, QuantumFracture, DotCSV, Cinedidacta) pesan fuertemente hacia tecnología y divulgación científica. Posible subrepresentación de formación corporativa, onboarding y explainers no-técnicos (economía, historia, salud pública, política, arte, humanidades).
2. **Briefs.** Los ejemplos en bloques de casos y en heurísticas numéricas recurren a pgvector, API, editor, terminal, stack técnico. Un creador de video sobre inflación regional o sobre onboarding de RRHH no se ve representado en los ejemplos.
3. **Demo hidratado.** Usa pgvector como caso de prueba. Un demo para validar cross-género necesitaría al menos un ejemplo no técnico.
4. **Vocabulario en skills.** Revisar si hay términos o pasos que asumen "tutorial de software" como default.

### Alcance propuesto para la auditoría follow-up

- Recorrer `docs/pilares/02-tendencias-y-casos.md` y `docs/casos-de-exito/*.md` y tabular la distribución real por formato. Identificar gaps.
- Recorrer los 37 briefs y catalogar cada ejemplo/caso concreto por formato implícito.
- Recorrer los 7 SKILL.md y marcar cualquier fraseo sesgado.
- Producir un reporte con porcentajes reales y lista de gaps.
- Priorizar qué remediaciones entran a corto plazo (ej. incorporar dos-tres fichas de creators no técnicos a P2 vía `/actualizar-tendencias`; reescribir ejemplos en briefs donde el sesgo es gratuito; agregar un segundo demo con caso no técnico).

Esta auditoría se documenta como follow-up obligatorio. No forma parte del plan de implementación de este spec, pero queda como siguiente work item explícito a ejecutar apenas se cierre el presente.

## 10. Checklist de entrega del presente spec

- [ ] Brief `edicion/10-overlays-auxiliares.md` reescrito con catálogo de 10 + `otro`, todas las citas nuevas, `version: 2`, ≤100 líneas.
- [ ] `storyboard-draft.template.html` actualizado: `OVERLAY_TIPOS` nuevo, siete funciones de dibujo nuevas, tres eliminadas, una adaptada, UI de Tabla y Cómic con los tipos nuevos, tooltips con cita a pilar.
- [ ] `skills/previsualizacion-entrenamiento/SKILL.md` actualizado en la descripción de overlays de la UI.
- [ ] `scripts/verificar-briefs.sh --strict` limpio.
- [ ] `scripts/regenerar-vistas.sh` ejecutado.
- [ ] Demo re-hidratado con ejemplos que mezclen tipos universales y al menos un `otro`.
- [ ] Commits separados por fase (brief, template, skills, metadata+demo).
- [ ] Follow-up documentado como issue o nota al comenzar inmediatamente la auditoría de sesgo de género.
