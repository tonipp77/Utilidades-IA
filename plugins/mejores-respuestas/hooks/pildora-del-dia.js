#!/usr/bin/env node
// Muestra al usuario una píldora de buenas prácticas al iniciar sesión.
// El consejo de dictar aparece la mitad de los días; el resto rota.
// Desactivar: variable de entorno MEJORES_RESPUESTAS_PILDORAS=off

if ((process.env.MEJORES_RESPUESTAS_PILDORAS || "").toLowerCase() === "off") {
  process.exit(0);
}

const dictar =
  "🎙️ Dicta, no escribas. Hablando das 3 veces más contexto. Windows: Win+H · macOS: Fn Fn · móvil: micrófono del teclado. Luego pásalo con /dictar y lo ordeno yo.";

const otras = [
  "🎤 ¿Encargo importante? Usa /entrevista: te hago hasta 5 preguntas antes de responder, en vez de suponer.",
  "✈️ ¿Texto denso? Usa /lenguaje-tecnico: frases cortas, una idea por frase y sin perder datos.",
  "🗺️ ¿Proceso enrevesado? Usa /diagrama y te lo dibujo con flechas y colores.",
  "🧪 ¿Concepto difícil? Usa /explicacion-visual: mini-web interactiva o vídeo de usar y tirar.",
  "🔍 Antes de firmar algo, abre un chat NUEVO y usa /revisor-critico. En el mismo chat la IA te da la razón.",
];

const dia = Math.floor(Date.now() / 86400000);
const texto = dia % 2 === 0 ? dictar : otras[Math.floor(dia / 2) % otras.length];

process.stdout.write(JSON.stringify({ systemMessage: texto }));
