---
decision: concepto/06-tono-y-restricciones
etapa: concepto
pregunta: ¿Qué registro de voz y qué restricciones (recursos, branding, accesibilidad, plazos)?
fuentes:
  - P1-§2.3-#10                  # personalización: lenguaje conversacional
  - P1-§2.3-#11                  # voz humana cálida (efecto base)
  - P1-§5.4                      # voz humana vs TTS moderno (brecha cerrada)
  - P1-§3.2                      # contraste — estándares objetivos
  - P1-§5.2                      # subtítulos: 15-20 CPS, 2 líneas, 37-42 chars/línea
  - P2-ficha-mouredev            # tono cercano hispano
  - P2-ficha-midudev             # registro casual técnico
  - P2-ficha-mike-meyers         # registro instructor-certificación
admite-variantes: false
sync: 2026-04-19
version: 1
---

## Principio aplicable

**Lenguaje conversacional ("tú", "nosotros") supera al lenguaje formal
en transferencia de aprendizaje, sin sacrificar autoridad percibida**
[P1-§2.3-#10]. El principio de personalización mantiene efecto robusto
en evidencia reciente. La elección de registro NO es estilística — es
cognitiva.

**Voz humana cálida vs TTS moderno: la brecha se cerró** [P1-§5.4]. Lo
que importa es naturalidad prosódica y ausencia de artefactos, más que
origen humano vs sintético per se. El efecto base de Mayer #11
[P1-§2.3-#11] sigue válido como dirección, pero TTS de alta calidad
con prosodia natural ya entrega resultados comparables.

**Las restricciones son contrato del proyecto, no detalles operativos.**
Branding, recursos disponibles, accesibilidad obligatoria y plazos
definen qué decisiones downstream son viables. Postergarlas a
grabación o edición produce re-trabajo.

## Casos

- **Tono cercano hispano técnico** [P2-ficha-mouredev]: live-coding
  Twitch → YouTube, "vosotros" peninsular, modela errores honestos
  ("se me cayó esto, vamos a ver"). Personalización máxima.
- **Casual técnico hispano** [P2-ficha-midudev]: tech-news reactivo,
  "vamos a ver", anglicismos aceptados (`deploy`, `commit`), WPM ~188
  con pausas explícitas.
- **Instructor-certificación formal** [P2-ficha-mike-meyers]: registro
  profesoral, vocabulario técnico explícito y consistente con syllabus
  oficial (CompTIA, etc.). El registro formal acá tiene función:
  preparación de examen.

## Anti-patrón

**Registro neutro corporativo sin personalización** [P1-§2.3-#10]. "El
usuario deberá presionar el botón" en lugar de "presionás el botón"
degrada transferencia sin ganar autoridad.

**Subtítulos como afterthought** [P1-§5.2]. Velocidades >20 CPS o
líneas >42 caracteres degradan comprensión. Si son obligatorios,
entran en el contrato del concepto, no se negocian en edición.

**Branding ignorado hasta edición** [P1-§3.2]. Si el cliente exige
paleta con contraste insuficiente (<4.5:1 body, <3:1 large text WCAG
AA), descubrirlo en edición fuerza re-design o degrada accesibilidad.

## Heurística numérica

- **Contraste mínimo no negociable:** 4.5:1 cuerpo, 3:1 texto grande
  (WCAG 2.2 AA) [P1-§3.2]. Cualquier branding que no cumpla queda
  flaggeado acá.
- **Subtítulos:** 15-20 CPS, ≤2 líneas, 37-42 chars/línea
  [P1-§5.2]. Si la audiencia incluye no-nativos, bajar al límite
  inferior.
- **Registro:** segunda persona singular hispana ("tú" o "vos") o
  plural ("vosotros") según mercado destino — definir acá, no en
  guión.

## Conflictos conocidos

**Branding corporativo con contraste insuficiente** [P1-§3.2]. El
cliente exige paleta institucional que no llega a WCAG AA. El toolkit
NO resuelve en silencio: o se ajusta la paleta para cumplir, o se
documenta el incumplimiento como decisión informada del cliente.

**Voz humana exigida vs presupuesto/timeline para TTS** [P1-§5.4]
[P1-§2.3-#11]. La evidencia reciente reduce la brecha; si el proyecto
no tiene voz disponible y el plazo no permite contratar locutor,
TTS de alta calidad con prosodia natural es opción legítima
flaggeada como decisión consciente.

## Salida esperada

Cinco datos:

- **Registro:** "[formal | cercano | casual técnico | instructor-cert]".
- **Persona gramatical:** "[tú | vos | usted | vosotros | nosotros]".
- **Branding:** "[paleta + tipografía + contraste verificado vs WCAG AA]".
- **Accesibilidad obligatoria:** "[subs sí/no + idioma; AD si aplica;
  excepción al principio de redundancia justificada]".
- **Recursos y plazos:** "[equipo, software, fecha de entrega target]".
