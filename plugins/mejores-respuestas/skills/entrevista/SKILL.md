---
name: entrevista
description: 'Antes de responder, entrevista al usuario: máximo 5 preguntas, de una en una y con opciones. Úsala con "entrevístame", "pregúntame antes" o encargos importantes con poco contexto.'
---

# Entrevista antes de responder

Si la IA no pregunta, rellena los huecos suponiendo. Esta skill obliga a preguntar **solo lo que cambia el resultado**, rápido y sin agobiar.

El encargo es `$ARGUMENTS` o el último mensaje del usuario. Si no hay encargo, pide primero en una línea: "¿Qué quieres que prepare?".

## 1. Diagnóstico (en silencio)

Antes de preguntar, analiza el encargo y lista internamente qué falta. Revisa estas dimensiones, en orden de impacto:

1. **Objetivo real:** qué decisión o acción debe provocar el resultado.
2. **Destinatario:** quién lo lee y qué sabe ya.
3. **Formato y extensión:** tipo de entregable, longitud, canal.
4. **Tono y estilo:** formal, cercano, técnico, comercial.
5. **Restricciones:** obligatorio, prohibido, plazos, presupuesto, marca.
6. **Material de partida:** datos, ejemplos o referencias que existan.
7. **Criterio de éxito:** cómo sabrá el usuario que está bien.

**No preguntes** lo que ya está en el encargo, lo que puedes deducir con seguridad o lo que no cambiaría el resultado.

## 2. Preguntas

- **Máximo cinco.** Prioriza por impacto. Si con dos basta, haz dos.
- **De una en una.** Espera la respuesta antes de la siguiente. Adapta las siguientes a lo que conteste.
- **Siempre con opciones:** 2–4 opciones concretas y realistas, más la posibilidad de responder con sus palabras.
- Si tienes una opción recomendada, ponla primera y márcala "(recomendada)".
- Indica el progreso: `Pregunta 2/4`.

**Herramienta:** si existe `AskUserQuestion`, úsala (una pregunta por llamada; la opción libre ya está incluida). Si no, usa este formato:

```
**Pregunta 2/4 · Destinatario**
¿Quién va a leer esto?
  A) Dirección / decisor final (recomendada)
  B) Equipo técnico
  C) Cliente final
  D) Otra: escríbela
```

- Si el usuario dice "suficiente", "adelante" o similar, para y continúa con lo que tengas, indicando los supuestos que asumes.

## 3. Confirmación

Tras la última respuesta, resume el encargo en 3–6 viñetas (objetivo, destinatario, formato, tono, restricciones clave) y los supuestos que mantienes. Pregunta: "¿Lo preparo así?".

## 4. Entrega

Con el sí, produce el resultado completo. No vuelvas a preguntar salvo bloqueo real.
