---
name: concepto-entrenamiento
description: "Use when the user is starting a new training/instructional/tutorial video and the concept is not yet locked — clarifies vague ideas through adaptive brainstorming and produces a Concept Brief that defines audience, learning objective, promise/angle, format, platform, tone and constraints before script writing. Etapa 0 (concepto) del toolkit de entrenamiento audiovisual."
---

# Concepto de entrenamiento audiovisual

Acompañas al creador a transformar una idea (puede ser vaga) en un
**Concept Brief**: un documento que define qué video se va a producir
y bajo qué contrato — audiencia, objetivo medible, promesa, ángulo,
formato, plataforma, tono y restricciones — antes de empezar a guionar.

Este skill es la **etapa 0** del toolkit. Se invoca por default desde
`crear-entrenamiento` cuando el usuario llega con una idea nueva, y es
saltable explícitamente (ver "Carácter recomendado" abajo).

## Carácter recomendado

Esta etapa es **default ON pero no bloqueante**. El orquestador
`crear-entrenamiento` la invoca automáticamente al inicio de un flujo
nuevo. El usuario puede saltarla de dos formas:

1. **Pasando un Concept Brief existente** (locked o draft). En ese
   caso, este skill confirma los datos en una pasada rápida y cierra.
2. **Afirmando claridad explícita** ("ya tengo el concepto, vamos a
   guión"). En ese caso, el orquestador deriva un Concept Brief
   `draft` desde el input y va directo a `guion-entrenamiento`. La
   primera oportunidad para volver acá es si guión detecta huecos.

Una vez invocado este skill, corre hasta el final — no hay lógica de
bypass interna.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta
etapa**:

```
docs/briefs/concepto/*.md
```

(6 archivos. Orden alfabético = orden de flujo:
01-audiencia → 02-objetivo → 03-promesa-y-angulo →
04-formato-y-duracion → 05-plataforma-y-distribucion →
06-tono-y-restricciones.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables (`[P1-§X.Y]`,
`[P2-ficha-<slug>]`). Si surge una pregunta fuera del scope de los
briefs, usá `Grep` dirigido por ID
(ej. `grep "P2-meta-onboarding" docs/pilares/02-tendencias-y-casos.md`),
no `Read` del archivo completo.

## Paso 0 — Diagnóstico de claridad

Antes de abrir briefs uno a uno, **evaluá el input inicial del usuario**
contra las 6 dimensiones. Para cada dimensión marcá uno de tres estados:

- `cubierta` — el usuario ya nombró un valor explícito y consistente.
- `parcial` — hay señal pero falta precisión (ej. "para devs" sin nivel
  previo, o "YouTube" sin elegir long vs Shorts).
- `vacía` — no hay señal en el input.

Devolvé al usuario un **mini-resumen explícito** antes de abrir nada:

> "De lo que me dijiste tengo claro:
> - Audiencia: [valor o '—']
> - Objetivo: [valor o '—']
> - Promesa/ángulo: [valor o '—']
> - Formato/duración: [valor o '—']
> - Plataforma: [valor o '—']
> - Tono/restricciones: [valor o '—']
>
> Voy a profundizar en [lista de dimensiones parciales o vacías] y
> confirmar rápido [lista de cubiertas]. ¿Te parece o querés cambiar
> el orden / saltar alguna?"

Esto da al usuario control y evita preguntar por dimensiones ya
resueltas.

## Flujo

Camina al creador por las 6 decisiones críticas **en orden alfabético
de los briefs**, pero saltando o confirmando rápido las dimensiones
`cubiertas` del paso 0.

Para cada decisión:

1. **Si la dimensión está `cubierta`**: confirmá con una pregunta sí/no
   ("Confirmo que [valor del usuario] — ¿correcto?"). Si el usuario
   afirma, registrá y pasá. Si quiere cambiar, abrí el brief.

2. **Si la dimensión está `parcial` o `vacía`**: plantear la `pregunta`
   del frontmatter del brief al usuario.

3. **Aplicar el test de determinismo upstream** (solo si el brief tiene
   `admite-variantes: true`):
   - Si al menos 2 de los `Casos` listados en el brief son razonablemente
     aplicables al contexto actual del usuario evaluado contra **TODOS
     los ejes ya decididos** (audiencia + objetivo + nivel previo +
     idioma/variante + decisiones previas aprobadas en este brief o en
     anteriores): **ofrecer variantes con recomendación**.
     Formato:
     > "Veo N direcciones distintas que funcionan: [A], [B], [C]. Mi
     > inclinación es [A] por [razón del brief]. ¿Las exploramos o voy
     > con [A]?"
   - Si un solo caso domina: proponer una sola propuesta, no ofrecer
     variantes.

4. **Proponer con justificación trazable** usando `Principio aplicable`
   + `Casos` del brief. Si el brief lista `Conflictos conocidos`
   aplicables al contexto, **flaggearlos explícitamente al usuario** —
   no resolver en silencio. El pilar 1 prevalece salvo decisión
   informada del usuario.

5. **Dispatch de variantes (solo si el usuario aceptó explorar):**
   invocar Task tool con el siguiente contrato:
   ```
   subagent_type: general-purpose
   prompt:
     Sos un ideador divergente. Tarea: generar N variantes del artefacto
     <decision>.

     CONTEXTO ACUMULADO (decisiones previas aprobadas):
     [literal de cada decisión previa]

     BRIEF DE LA DECISIÓN (frozen, inline):
     [contenido íntegro del brief .md]

     TAREA:
     Generar N variantes que respeten Principio + Salida esperada del
     brief. Cada variante debe diferir en ÁNGULO. Para cada variante
     devolver: ángulo, contenido, cómo mapea al brief.

     NO elijas la mejor. La decisión la toma el main.
   ```

6. **Registrar la decisión aprobada** antes de pasar a la siguiente.

**Baseline de variantes:** sobre 6 decisiones, típicamente 2 admiten
variantes (03-promesa-y-angulo y 04-formato-y-duracion). Las demás son
deterministas una vez fijada audiencia + plataforma.

## Salida — Concept Brief consolidado

Al terminar las 6 decisiones, produce el documento final siguiendo
esta plantilla:

```
# Concept Brief — <título o slug del video>

## 0. Metadatos
- estado: draft            # draft | locked
- locked-at: —             # YYYY-MM-DD cuando pase a locked
- version: 1
- creado: <YYYY-MM-DD>

## 1. Audiencia
[perfil con nivel previo explícito y eje cultural si importa]

## 2. Objetivo de aprendizaje
Al terminar este video, [audiencia] podrá [acción observable].

## 3. Promesa y ángulo
- Promesa: [≤15 palabras]
- Ángulo: [cómo distintivo vs alternativas existentes]
- CCN Fit: [por qué Core / Casual / New querrían verlo]

## 4. Formato y duración
- Duración aproximada: [N min, o rango]
- Ratio: [16:9 | 9:16 | 1:1]
- Modo de consumo asumido: [con audio | silencioso default | LMS captivo]

## 5. Plataforma y distribución
- Primaria: [YouTube long | Shorts | LinkedIn | TikTok | LMS interno | Udemy/Platzi/Crehana | otro]
- Secundarias: [lista, o "ninguna por ahora"]
- Funnel del CTA: [próximo paso concreto que el viewer puede ejecutar]

## 6. Tono y restricciones
- Registro: [formal | cercano | casual técnico | instructor-cert]
- Persona gramatical: [tú | vos | usted | vosotros | nosotros]
- Branding: [paleta + tipografía + contraste verificado vs WCAG AA]
- Accesibilidad obligatoria: [subs + idioma; AD si aplica]
- Recursos y plazos: [equipo, software, fecha de entrega target]

## 7. Conflictos flaggeados
[lista de conflictos reportados durante la etapa que quedaron sin
 resolver con el usuario — ej. "branding institucional con contraste
 4.0:1 < WCAG AA, cliente acepta el riesgo documentado"]
```

**Dónde vivir el archivo.** Sugerí al usuario guardarlo en su
directorio de proyecto (no en el repo del toolkit) con un nombre
claro: `concept-brief-<slug>.md`. Idealmente junto al guion que se
producirá después. No commitees al repo del toolkit — es artefacto
del usuario.

## Gate de lock

Una vez completado el Concept Brief, **preguntá explícitamente al
usuario si quiere pasarlo a estado `locked`**:

> "El Concept Brief está completo. ¿Lo paso a `locked`? A partir de
> ahí es el contrato para guión y resto de etapas — si hay cambios
> después, hay que volver a esta etapa para re-lockear."

Si el usuario acepta:
- Cambiar `estado: draft` → `estado: locked`.
- Escribir la fecha de hoy en `locked-at:` (formato `YYYY-MM-DD`).

Si el usuario prefiere dejarlo `draft`:
- Mantener el estado y avisar que `guion-entrenamiento` y siguientes
  van a alertar sobre el draft al arrancar (no bloquea, solo avisa).

**Cambios post-lock** = nueva invocación de este skill, revisión de
las decisiones afectadas, re-escribir `locked-at:` con la fecha nueva.
Misma disciplina que el Production Brief de previsualización.

## Verificación antes de proponer el lock

- [ ] Audiencia con nivel previo explícito.
- [ ] Objetivo con verbo observable y medible.
- [ ] Promesa formulable en ≤15 palabras + ángulo distintivo + CCN Fit
      con razón por viewer (Core/Casual/New).
- [ ] Duración + ratio + modo de consumo definidos.
- [ ] Plataforma primaria + funnel del CTA concreto.
- [ ] Registro + persona gramatical + branding (con contraste
      verificado) + accesibilidad + recursos/plazos.
- [ ] Cero conflictos no flaggeados — incluyendo P1 vs preferencia del
      cliente cuando aplique.

## Consumo downstream

El Concept Brief es input para **toda etapa siguiente**:

- `guion-entrenamiento` lo lee al arrancar y lo trata como contrato
  cuando está `locked`. El brief 01-audiencia de guión confirma datos
  del Concept Brief en lugar de preguntar desde cero. Avisa
  explícitamente si está `draft`.
- `previsualizacion-entrenamiento` lo lee para contexto del Production
  Brief.
- `grabacion-entrenamiento`, `edicion-entrenamiento`,
  `publicacion-entrenamiento` lo leen como referencia (no contrato
  duro — el Production Brief de previsualización ya consolida lo
  necesario para grabación/edición).

Ninguna etapa downstream modifica el Concept Brief; solo lo lee.

## Reglas firmes

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief
  (`[P1-§X.Y]`, `[P2-ficha-<slug>]`) en la justificación al usuario.
- **Conflictos pilar 2 vs pilar 1:** flaggear siempre; pilar 1 gana
  salvo override explícito del usuario con conocimiento.
- **Dimensiones cubiertas se confirman, no se re-preguntan.** El paso
  0 es contrato con el usuario; respetarlo.
- **Variantes solo cuando el test de determinismo las habilita.** No
  ofrecer variantes por default en cada decisión — fatiga de decisión.
- **No producir guión, storyboard ni nada operacional acá.** El
  Concept Brief es upstream — define qué se va a hacer, no cómo se
  ejecuta. La ejecución es responsabilidad de las etapas siguientes.
- **Evitar pseudociencia:** ningún claim sobre "8 segundos de atención",
  cromoterapia, neuronas espejo, etc. Los briefs están depurados.
