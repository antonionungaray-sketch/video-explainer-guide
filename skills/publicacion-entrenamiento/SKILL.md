---
name: publicacion-entrenamiento
description: "Use when the user is at the publishing / distribution stage of a training video — titles, thumbnails, descriptions, tags, scheduling, end screens, or analytics. Etapa de publicación y medición del toolkit de entrenamiento audiovisual."
---

# Publicación de entrenamiento audiovisual

Acompañas al creador a publicar el video con metadata que lo encuentre
la audiencia correcta, maximice la decisión de empezar a verlo, e
instrumente las métricas correctas para iterar — distinguiendo
métricas de plataforma (proxies) de métricas de aprendizaje real.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta
etapa**:

```
docs/briefs/publicacion/*.md
```

(8 archivos de 78-100 líneas cada uno. Orden alfabético = orden de
flujo: 01-titulo → 02-thumbnail → 03-descripcion-capitulos →
04-tags-categoria → 05-programacion → 06-end-screens-cta →
07-metricas-plataforma → 08-metricas-aprendizaje.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables. Si durante el flujo
surge una pregunta fuera del scope de los briefs, usá `Grep` dirigido
por ID (ej. `grep "P2-publicacion-metricas-core"
docs/pilares/02-tendencias-y-casos.md`), no `Read` del archivo
completo.

## Flujo

Camina al creador por las 8 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief
correspondiente.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief.
2. **Aplicar el test de determinismo upstream** (solo si el brief
   tiene `admite-variantes: true`):
   - Si al menos 2 de los `Casos` del brief son razonablemente
     aplicables al contexto del usuario evaluado contra **TODOS los
     ejes** (audiencia + nicho + cultura de audiencia + decisiones
     previas): **ofrecer variantes con recomendación**.
   - Si un solo caso domina: proponer una sola propuesta.
   - **Nota de etapa:** en publicación, 3 decisiones admiten
     variantes por diseño: 01-titulo (stakes vs curiosidad vs
     número específico), 02-thumbnail (cara vs ilustración),
     06-end-screens-cta (cross-funnel vs CTA explícito — depende
     de cultura de audiencia).
3. **Proponer con justificación trazable** citando IDs del brief.
   Flaggear `Conflictos conocidos` si aplican.
4. **Dispatch de variantes (solo si aplica y el usuario aceptó):**
   Task tool con brief congelado inline + decisiones previas
   acumuladas. El sub-agent devuelve variantes; NO decide.
5. **Registrar la decisión** antes de pasar a la siguiente.

## Reglas firmes de la etapa

- **Separar proxies de aprendizaje real.** APV/CTR/retention miden
  engagement, no comprensión. El brief 08 cubre instrumentación
  mínima para cerrar ese gap.
- **"No-suscríbete al inicio" NO es regla universal.** DotCSV
  demuestra que la cultura de la audiencia puede esperar el pitch
  clásico. Matchear al canal objetivo, no aplicar regla absoluta.
- **Clickbait castiga retention en 0-30s.** Si la promesa del
  título/thumbnail no se cumple, la curva cae y el algoritmo
  reduce distribución.

## Salida

Al terminar las 8 decisiones, produce un **plan de publicación
documentado**:

```
PROYECTO: [nombre del video]
PLATAFORMA DESTINO: [YouTube / Vimeo / LMS]
FECHA + HORA DE PUBLICACIÓN: [ISO 8601 + zona]

═══ 01. TÍTULO ═══
[TÍTULO FINAL]: [≤60 caracteres]
[ÁNGULO]: [stake / open loop / número específico / pregunta
contraintuitiva]
[A/B TEST]: [variantes si se usa TubeBuddy/VidIQ]

═══ 02. THUMBNAIL ═══
[EXPORTADO]: [1920×1080 path]
[MODELO]: [face+expresión / ilustración+texto / logo+texto]
[TEST LEGIBILIDAD 180×101]: [OK / FAIL]
[CONTRASTE TEXTO]: [valor numérico]
[A/B SET]: [opcional]

═══ 03. DESCRIPCIÓN Y CAPÍTULOS ═══
[PRIMER PÁRRAFO]: [≤200 chars, promesa + valor inmediato]
[CAPÍTULOS]: [lista desde 0:00]
[RECURSOS ENLAZADOS]: [links + atribuciones]
[KEYWORDS NATURALES]: [integradas al texto, no spam]

═══ 04. TAGS Y CATEGORÍA ═══
[CATEGORÍA]: [nombre + ID de plataforma]
[TAGS]: [8-15 ordenados por relevancia]

═══ 05. PROGRAMACIÓN ═══
[FECHA + HORA]: [local + UTC]
[JUSTIFICACIÓN]: [data propia Audience Insights / default por nicho]
[PLAN 48H]: [promoción en redes/comunidad]

═══ 06. END SCREEN Y CTA ═══
[CTA PRIMARIO]: [acción específica ≤15s]
[END SCREEN]: [video relacionado + sub + link/playlist]
[PITCH CLÁSICO SUSCRIBE/LIKE]: [sí/no + justificación cultural]

═══ 07. MÉTRICAS PLATAFORMA ═══
[MÉTRICAS A OBSERVAR]: [APV, CTR, retention curve, views/subs]
[VENTANA]: [7d / 14d / 30d]
[THRESHOLDS DE ACCIÓN]: [a qué número editás/regeneras]

═══ 08. MÉTRICAS APRENDIZAJE ═══
[MECANISMO]: [comentarios, CTA generativo, stars de repo, quiz,
email follow-up]
[CADENCIA]: [24h / 7d / 30d según contexto]
[CRITERIO DE ÉXITO]: [diferente de APV]

═══ NOTAS DE PUBLICACIÓN ═══
[CONFLICTOS FLAGGEADOS]: [P2 vs P1 o convenciones culturales]
[BACKUPS DE METADATA]: [título/desc guardados en .md local]
```

Verifica antes de publicar:

- [ ] Título ≤60 caracteres, promesa cumplible.
- [ ] Thumbnail legible a 180×101 px, sin clickbait.
- [ ] Descripción con capítulos desde 0:00 + recursos.
- [ ] Tags 8-15 + categoría correcta de plataforma.
- [ ] Hora basada en data propia o default razonable; plan 48h.
- [ ] End screen con video relacionado + CTA específico.
- [ ] Subtítulos cargados (no solo automáticos).
- [ ] Plan de instrumentación de métricas reales de aprendizaje.
- [ ] Cero conflictos no resueltos.

## Reglas firmes del flujo

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief.
- **Variantes solo cuando el test de determinismo las habilita** y
  solo en 01-titulo, 02-thumbnail, 06-end-screens-cta.
- **Distinguir proxies vs aprendizaje real:** brief 07 mide
  engagement; brief 08 mide comprensión/transferencia.
