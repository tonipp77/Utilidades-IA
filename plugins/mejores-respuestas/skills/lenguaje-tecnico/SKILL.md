---
name: lenguaje-tecnico
description: 'Reescribe textos en lenguaje técnico simplificado (ASD-STE100): frases cortas, voz activa y sin perder datos. Úsala con "explícamelo sencillo", "sin parrafadas", contratos o informes.'
---

# Lenguaje técnico simplificado (estilo ASD-STE100)

ASD-STE100 es la norma de inglés técnico simplificado de la documentación de mantenimiento aeronáutico. Aquí se adapta al idioma del usuario. Objetivo: **leer rápido sin perder nada importante.**

Texto de entrada: `$ARGUMENTS`, un archivo indicado o el último contenido de la conversación.

## Intensidad

- **Equilibrado (por defecto, "80 % STE"):** aplica las reglas con flexibilidad para que suene natural.
- **Estricto:** si el usuario dice "estricto" o "STE puro", aplica todas las reglas al pie de la letra.

## Reglas de redacción

1. **Una idea por oración.**
2. **Frases cortas:** máximo 20 palabras en instrucciones, 25 en descripciones (estricto: 15 y 20).
3. **Voz activa:** "El proveedor paga la penalización", no "La penalización será abonada".
4. **Instrucciones en imperativo:** "Envía el formulario antes del día 5".
5. **Sujeto explícito.** Di quién hace cada cosa.
6. **Un término, un significado.** Si el texto llama a algo "cliente", no lo cambies a "usuario" o "contratante". Mantén los términos técnicos y legales exactos.
7. **Sin adornos:** fuera metáforas, frases hechas, rodeos, relleno y adjetivos que no aportan.
8. **Párrafos de máximo 3 oraciones.** Mejor listas.
9. **Pasos secuenciales en lista numerada.** Un paso, una acción.
10. **Avisos antes del paso al que afectan:** ⚠️ antes, no después.
11. **Números, fechas, importes, plazos y porcentajes, siempre literales.** Nunca "unos días" si el original dice "15 días naturales".

## Regla de oro: precisión antes que brevedad

- Conserva **todos** los términos, condiciones, excepciones, plazos, importes, obligaciones y consecuencias.
- Si resumir implica perder información, **no resumas**: simplifica la forma, no el contenido.
- Si algo del original es ambiguo, no lo resuelvas. Márcalo: `⚠️ Ambiguo en el original: …`.
- No añadas interpretaciones ni opiniones propias, salvo que el usuario las pida.

## Estructura de salida

Adapta las secciones al tipo de texto y omite las vacías:

```
## En una frase
Qué es y qué implica para el usuario.

## Puntos clave
- …

## Obligaciones / Pasos
1. …

## Condiciones y excepciones
- Si X, entonces Y.
- Excepto cuando Z.

## Datos
| Dato | Valor |

## ⚠️ Riesgos, ambigüedades y letra pequeña
- …
```

Al final, una línea: `Nada del original se ha omitido.` Si has tenido que omitir algo por petición del usuario, dilo explícitamente.
