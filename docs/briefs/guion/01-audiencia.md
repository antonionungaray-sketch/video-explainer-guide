---
decision: guion/01-audiencia
etapa: guion
pregunta: ¿Para quién es este video y qué debe poder hacer al terminar?
fuentes:
  - P1-§2.1                   # carga intrínseca y nivel previo
  - P1-§2.3-#7                # pre-entrenamiento
  - P2-meta-tutorial          # audiencias de tutorial técnico
  - P2-meta-divulgacion       # audiencias de divulgación
  - P2-meta-onboarding        # audiencias de onboarding
  - P2-ficha-fireship         # caso audiencia dev anglo pre-entrenada
  - P2-ficha-midudev          # caso audiencia dev hispana junior-mid
  - P2-ficha-kurzgesagt       # caso audiencia general sin background
  - P1-§6.1                   # misconception (ajuste por objetivo-cognitivo)
admite-variantes: false
varia-por-eje: [objetivo-cognitivo]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Carga intrínseca ≈ complejidad del material × (1 − nivel previo del aprendiz)**
[P1-§2.1]. El nivel previo gobierna qué puede absorberse sin saturar memoria
de trabajo (~4 elementos simultáneos). Si la audiencia no tiene el
pre-entrenamiento necesario, hay que proveerlo antes del flujo principal
o bajar la complejidad — nunca ignorar el gap [P1-§2.3-#7].

**Objetivo de aprendizaje mensurable.** La audiencia sola no basta; hay que
acoplarla a una acción observable. "Entender X" no sirve — no es medible.
"Instalar X y desplegar un hello-world" sí.

## Casos

- **Fireship** [P2-ficha-fireship]: audiencia = devs que ya programan,
  buscan refrescarse rápido. Pre-entrenamiento alto asumido. Por eso WPM
  ~235 sin explicar términos básicos funciona.
- **Midudev** [P2-ficha-midudev]: audiencia = devs junior-mid hispanos.
  WPM ~188 con pausas explícitas para pre-entrenamiento on-the-fly cuando
  aparece término nuevo (npm, vite, webpack).
- **Kurzgesagt** [P2-ficha-kurzgesagt]: audiencia = público general sin
  background. Pre-entrenamiento vía animación isotype durante 60-90s
  antes del argumento central.

## Anti-patrón

**Audiencia difusa ("para todos los que quieran aprender X").** Garantiza
calibración mal. El video queda demasiado básico para los avanzados y
demasiado rápido para los novatos. Correlaciona con caídas de retention
por ambos extremos.

## Heurística numérica

- **Un objetivo por video ≤ 10 min.** Objetivos múltiples requieren
  segmentación explícita (ver brief 04-segmentacion).
- **Pre-entrenamiento:** si >20% del audio inicial explica términos, es
  señal de que la audiencia definida no coincide con la audiencia real
  del contenido.

## Ajuste por eje

### Por `objetivo-cognitivo`

Ver detalle completo en [concepto/01-audiencia](../concepto/01-audiencia.md#ajuste-por-eje). Resumen aplicado a fase de guión:

- **`adquirir-habilidad`:** nivel previo = familiaridad procedimental. El guión asume stack y vocabulario.
- **`corregir-intuicion`:** nivel previo = intuición errónea existente. El guión la enuncia antes de desafiarla [P1-§6.1].
- **`decidir-informado`:** nivel previo = contexto del problema. El guión asume el marco y enuncia criterios.
- **`orientarse`:** nivel previo bajo. Pre-entrenamiento extenso en el guión (60-90s antes del argumento).
- **`formar-opinion`:** nivel previo = exposición al debate. El guión asume las posiciones en juego.
- **`apreciar`:** nivel previo = sensibilidad estética. El guión no explica qué es el objeto; invita a ver.

## Conflictos conocidos

Ninguno relevante. Decisión prerequisito de todas las demás.

## Salida esperada

Dos frases:

- **Audiencia:** "[perfil con nivel previo explícito, ej. 'devs backend
  con experiencia en Node pero sin haber usado Bun']".
- **Objetivo:** "Al terminar este video, [audiencia] podrá [acción
  observable con verbo medible: instalar, reproducir, identificar,
  explicar con sus palabras]".
