# mejores-respuestas

> Píldoras para sacar **mejores respuestas de la IA**: mejor entrada, mejor salida y mejor filtro.

## Instalación

```
/plugin marketplace add tonipp77/Utilidades-IA
/plugin install mejores-respuestas@utilidades-ia
```

## Qué incluye

| Bloque | Píldora | Cómo se usa | Qué hace |
|---|---|---|---|
| 🎙️ Entrada | **Dictar** | `/dictar` + tu dictado | Convierte un dictado desordenado en un encargo claro sin perder nada. También enseña a dictar en cada dispositivo. |
| 🎙️ Entrada | **Entrevista** | `/entrevista` + tu encargo | Te hace hasta 5 preguntas, de una en una y con opciones, antes de responder. |
| 📤 Salida | **Lenguaje técnico** | `/lenguaje-tecnico` + texto | Estilo manual de aviones (ASD-STE100): frases cortas, una idea por frase, sin perder datos. Añade "estricto" para STE puro. |
| 📤 Salida | **Diagrama** | `/diagrama` + tema | Diagrama de flechas con código de colores y leyenda, en HTML listo para abrir. |
| 📤 Salida | **Explicación visual** | `/explicacion-visual` + tema | Mini-web interactiva o vídeo animado con voz, de usar y tirar. |
| 🔍 Filtro | **Revisor crítico** | `/revisor-critico` + documento | Intenta tumbar tu documento: máximo 3 críticas citadas, sin relleno. Exige chat nuevo o usa un subagente limpio. |

Si otro plugin usa el mismo nombre, invócalas con el prefijo: `/mejores-respuestas:diagrama`.

Las skills también se activan solas cuando lo que pides encaja ("dibújame un esquema", "entrevístame antes", "intenta tumbar esto"…).

## Píldora del día (hook)

Al iniciar sesión verás un consejo breve. La mitad de los días es el de **dictar**, porque es el hábito que más mejora las respuestas y no se puede automatizar: depende de ti.

Desactívalo con la variable de entorno `MEJORES_RESPUESTAS_PILDORAS=off`.

Requiere Node.js en el `PATH`. Si no está, el hook no muestra nada y el resto del plugin funciona igual.

## Ejemplos

```
/entrevista Prepárame una propuesta comercial para una clínica dental que quiere un bot de WhatsApp
/lenguaje-tecnico contrato.pdf
/diagrama el proceso de alta de un cliente en nuestra membresía
/explicacion-visual vídeo: cómo funciona el interés compuesto
/revisor-critico propuesta-clinica.docx
```

## Estructura

```
mejores-respuestas/
├── .claude-plugin/plugin.json
├── agents/revisor-critico.md          # subagente con contexto limpio
├── hooks/
│   ├── hooks.json
│   └── pildora-del-dia.js
└── skills/
    ├── dictar/
    ├── entrevista/
    ├── lenguaje-tecnico/
    ├── diagrama/              (plantilla HTML incluida en SKILL.md)
    ├── explicacion-visual/    (plantilla de vídeo incluida en SKILL.md)
    └── revisor-critico/
```
