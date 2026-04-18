# training-video-toolkit

Plugin de Claude Code para crear material de entrenamiento audiovisual basado en evidencia. El toolkit acompaña al creador a través de las cuatro etapas del ciclo de producción (guión → grabación → edición → publicación) consultando tres pilares de conocimiento.

## Filosofía

Tres pilares, claramente separados:

1. **Fundamentos cognitivos del aprendizaje audiovisual** — *estable*. Ciencia verificada (Mayer, Sweller, Paivio, Bjork, Roediger, Cepeda, etc.). Cambia poco.
2. **Tendencias, ejemplos y casos de éxito** — *dinámico*. Lo que funciona ahora en plataformas y formatos. Cambia en semanas/meses.
3. **Herramientas** — *dinámico*. Software vigente, releases, alternativas. Cambia en semanas.

Los skills cargan siempre la **vista por etapa** (síntesis delgada) y los **pilares relevantes** antes de proponer cualquier decisión. Cuando una tendencia (pilar 2) o una herramienta (pilar 3) entra en conflicto con un fundamento (pilar 1), el skill **flaggea el conflicto** explícitamente — el pilar 1 prevalece a menos que el creador decida lo contrario con conocimiento de causa.

## Estructura

```
training-video-toolkit/
├── .claude-plugin/
│   └── plugin.json                          # Metadata del plugin
├── .claude/
│   └── skills/
│       ├── crear-entrenamiento/             # Orquestador (entry point)
│       ├── guion-entrenamiento/             # Etapa 1: idea → guión
│       ├── grabacion-entrenamiento/         # Etapa 2: pre-producción y captura
│       ├── edicion-entrenamiento/           # Etapa 3: edición y post
│       ├── publicacion-entrenamiento/       # Etapa 4: publicación y medición
│       ├── actualizar-tendencias/           # Mantenimiento del pilar 2
│       └── actualizar-herramientas/         # Mantenimiento del pilar 3
└── docs/
    ├── pilares/
    │   ├── 01-fundamentos-cognitivos.md
    │   ├── 02-tendencias-y-casos.md
    │   └── 03-herramientas.md
    └── vistas-por-etapa/
        ├── guion.md
        ├── grabacion.md
        ├── edicion.md
        └── publicacion.md
```

## Uso

Al iniciar una conversación sobre crear contenido de entrenamiento, el skill `crear-entrenamiento` se auto-invoca. Identifica en qué etapa estás y delega al skill específico de la etapa.

Ejemplos de detonadores:
- "Quiero hacer un tutorial sobre X"
- "Voy a grabar un curso de onboarding"
- "Estoy editando este video y necesito decidir el pacing"
- "Voy a publicar y no sé qué thumbnail usar"

También puedes invocar skills directamente:
- `/guion-entrenamiento` — etapa de guión
- `/grabacion-entrenamiento` — etapa de grabación
- `/edicion-entrenamiento` — etapa de edición
- `/publicacion-entrenamiento` — etapa de publicación
- `/actualizar-tendencias` — refrescar el pilar 2
- `/actualizar-herramientas` — refrescar el pilar 3

## Instalación

Como plugin local de Claude Code, basta con clonar el repo y registrarlo:

```bash
git clone <url> ~/Proyectos_local/training-video-toolkit
```

Configurar Claude Code para descubrir el plugin desde esa ruta (mecanismo según versión de Claude Code).

## Mantenimiento

Las capas dinámicas (pilares 2 y 3) requieren revisión periódica:

- Cada 4-8 semanas, invocar `/actualizar-tendencias` para revisar el pilar 2.
- Cada 2-4 semanas (o tras releases mayores), invocar `/actualizar-herramientas` para revisar el pilar 3.
- El pilar 1 (fundamentos) cambia poco; revisar 1-2 veces al año o cuando aparezca evidencia nueva relevante.

Cada item en los pilares dinámicos lleva fecha de última verificación. La tabla de "Frescura" al inicio de cada doc indica qué secciones están más viejas.

## Diseño y trazabilidad

- Las recomendaciones de los skills siempre citan la sección específica del pilar que las respalda.
- El pilar 1 está depurado de pseudociencia (sin cromoterapia, sin "neuronas espejo activadas por el hook", sin "47s de capacidad atencional"). Toda afirmación lleva cita peer-reviewed o está marcada como heurística práctica.
- Los conflictos entre pilares se flaggean al usuario, nunca se resuelven en silencio.

## Licencia

MIT.
