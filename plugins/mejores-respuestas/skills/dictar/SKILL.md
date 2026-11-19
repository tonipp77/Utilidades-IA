---
name: dictar
description: 'Ordena un dictado de voz desordenado en un encargo claro sin perder información, y enseña a dictar. Úsala con textos hablados, "ordena mi dictado" o "cómo dicto".'
---

# Dictar en lugar de escribir

Al escribir, la gente recorta: da menos contexto del que tiene. Al hablar, suelta dudas, matices, ejemplos y restricciones sin esfuerzo. Esta skill quita la única excusa para no dictar: **"me sale desordenado"**. Tú lo ordenas.

## Modo 1 · El usuario trae un dictado (`$ARGUMENTS` o texto pegado)

1. **Lee todo el dictado.** Asume que hay muletillas, frases a medias, autocorrecciones ("no, mejor…") y saltos de tema.
2. **Aplica las autocorrecciones.** Si dice "X… bueno, no, Y", vale Y. No mantengas versiones descartadas.
3. **No pierdas información.** Cada dato, condición, ejemplo, duda o restricción del dictado debe aparecer en el encargo. Ante la duda, inclúyelo.
4. **No inventes.** Si falta algo importante, márcalo en "Huecos", no lo rellenes.
5. **Devuelve el encargo con esta estructura** (omite secciones vacías):

```
## Encargo
**Objetivo:** qué quiere conseguir, en una frase.
**Contexto:** situación, para quién es, por qué ahora.
**Entregable:** formato, longitud, tono, destino.
**Restricciones:** lo que debe cumplirse o evitarse.
**Ejemplos / referencias:** lo que mencionó.
**Dudas del usuario:** lo que se preguntó en voz alta.
**Huecos:** datos que faltan y que cambiarían el resultado.
```

6. **Cierra con una pregunta:** "¿Lo ejecuto así, corriges algo o quieres que te entreviste para cubrir los huecos?". Si hay huecos relevantes, sugiere la skill `entrevista`.
7. Si el usuario confirma, ejecuta el encargo.

## Modo 2 · El usuario pregunta cómo dictar

Responde breve, solo con su plataforma si la conoces:

| Dónde | Cómo |
|---|---|
| Windows | `Win + H` en cualquier campo de texto. |
| macOS | Pulsa dos veces `Fn` (o la tecla de micrófono). Activa en Ajustes › Teclado › Dictado. |
| iPhone / Android | Icono de micrófono del teclado. |
| App de Claude (web, escritorio, móvil) | Botón de micrófono junto al cuadro de mensaje. |
| Dictado avanzado | Herramientas como Wispr Flow o Superwhisper dictan en cualquier app y limpian el texto. |

Y dale este **guion de un minuto** para hablar sin bloquearse:

1. **Qué quiero:** el resultado final.
2. **Para quién y para qué:** destinatario y uso.
3. **Lo que sé:** contexto, datos, antecedentes.
4. **Lo que NO quiero:** límites, tono a evitar, errores previos.
5. **Un ejemplo:** algo parecido a lo que busco.
6. **Mis dudas:** lo que no tengo claro.

Remata: "No te preocupes por el orden. Dicta todo y pásamelo con `/dictar`: yo lo ordeno".
