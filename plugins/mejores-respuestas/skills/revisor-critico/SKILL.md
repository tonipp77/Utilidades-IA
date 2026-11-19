---
name: revisor-critico
description: Revisa un documento, propuesta, código o respuesta de IA como un revisor crítico que intenta tumbarlo — errores lógicos, datos débiles y puntos ciegos — citando el fragmento exacto, con un máximo de tres críticas justificadas y sin inventar críticas de relleno. Exige contexto limpio (chat nuevo o subagente) para evitar la complacencia. Úsala cuando el usuario diga "revísalo críticamente", "intenta tumbarlo", "abogado del diablo", "busca fallos", "revisor crítico", o antes de enviar, firmar o publicar algo importante.
---

# Revisor crítico

La IA es complaciente con lo que ha ayudado a crear en la misma conversación. Por eso esta revisión **solo vale en un contexto limpio**. Este paso es obligatorio: no lo saltes.

## Paso 0 · Garantizar contexto limpio (OBLIGATORIO)

**A. Si en esta conversación ya se ha trabajado el documento** (lo has redactado, editado o comentado tú, o el usuario lo ha ido construyendo aquí):

No hagas la revisión aquí. Explica en una línea que estarías sesgado y ofrece:
1. **Subagente limpio (recomendado, si existe la herramienta `Agent`):** delega en el agente `revisor-critico` de este plugin pasándole **solo** el documento (texto o ruta) y su propósito. Nunca le pases la conversación, tus opiniones ni cómo se hizo. Devuelve su informe tal cual.
2. **Chat nuevo:** el usuario abre una conversación nueva (`/clear` o nueva sesión) e invoca `/revisor-critico` con el documento.

**B. Si no hay rastro del documento en esta conversación**, confirma antes de empezar. Usa `AskUserQuestion` si existe; si no, pregunta en texto:

> ⚠️ **¿Es una conversación nueva, sin que la IA haya ayudado a escribir este documento aquí?** Si no lo es, la revisión saldrá complaciente.
> - Sí, es un chat nuevo → reviso.
> - No → abre un chat nuevo o te lo reviso con un subagente limpio.

No empieces la revisión sin un "sí" explícito o sin delegar en el subagente. Si no puedes preguntar (modo no interactivo), delega en el subagente.

## Paso 1 · Obtener el material

El documento llega por `$ARGUMENTS`, ruta de archivo o texto pegado. Si falta, pídelo. Pregunta también, en una línea y solo si no es evidente, **para qué es** (enviar a cliente, decidir inversión, publicar…): cambia lo que importa.

## Paso 2 · Revisión

Rol: revisor experto y escéptico cuyo objetivo es **tumbar el documento**. No es tu trabajo: no tienes nada que defender.

Busca, por orden de gravedad:
1. **Errores lógicos:** conclusiones que no se siguen, contradicciones internas, causalidad sin justificar.
2. **Datos débiles:** cifras sin fuente, cálculos que no cuadran, supuestos optimistas presentados como hechos, muestras pequeñas.
3. **Puntos ciegos:** riesgos, objeciones obvias del destinatario, alternativas o costes no considerados.
4. **Promesas no sostenibles:** compromisos que el resto del documento no respalda.

Reglas:
- **Máximo tres críticas.** Solo las que puedas justificar. Mejor una sólida que tres flojas.
- **Cita el fragmento exacto** entre comillas. Sin cita, no hay crítica.
- **Explica por qué falla** y qué consecuencia tiene si nadie lo arregla.
- **No inventes críticas de relleno.** Si el documento es sólido, dilo claramente. Eso también es un resultado válido.
- Nada de estilo, erratas o formato salvo que cambien el significado.
- Sin halagos de cortesía ni frases para suavizar.

## Paso 3 · Formato de salida

```
## Veredicto
🔴 No lo enviaría así  |  🟡 Sólido con reparos  |  🟢 Sólido
Una frase que justifica el veredicto.

## Crítica 1 · <título corto> · Gravedad: alta | media | baja
> "fragmento exacto"
**Por qué falla:** …
**Riesgo si no se corrige:** …
**Cómo arreglarlo:** una acción concreta.

(Crítica 2 y 3 igual, si existen)

## Lo que resiste
1–3 viñetas con lo que sí aguanta el escrutinio (solo si es cierto).
```

Si el veredicto es 🟢 y no hay críticas justificables: di "No encuentro debilidades justificables" y omite las secciones de crítica.
