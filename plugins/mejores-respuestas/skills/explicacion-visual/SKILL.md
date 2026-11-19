---
name: explicacion-visual
description: 'Crea una mini-web interactiva o un vídeo animado con voz, en un HTML de usar y tirar, para entender algo rápido. Úsala con "hazme una mini-web", "explícamelo con un vídeo" o "simúlalo".'
---

# Explicación visual de usar y tirar

No es un producto: es una herramienta desechable para **entender una cosa concreta** en minutos. Se ve, se usa y se tira. Prioriza claridad e impacto sobre perfección.

Tema: `$ARGUMENTS`, un archivo o el contenido de la conversación.

## 1. Elige formato

| Si el usuario necesita… | Formato |
|---|---|
| Jugar con variables ("¿qué pasa si…?"), calcular, comparar escenarios | **Mini-web interactiva** |
| Entender una idea, un proceso o una historia de principio a fin | **Vídeo explicativo** |

Si no lo dice y no es obvio, pregunta en una línea con ambas opciones.

## 2. Mini-web interactiva

Un único `.html` autocontenido, sin build.

- **Una pantalla, un propósito.** Título que dice qué responde la página.
- **Controles a la izquierda o arriba** (sliders, inputs, selectores) y **resultado grande y visible** que se actualiza al instante.
- **Valores por defecto realistas** sacados del contexto del usuario, no inventados. Si inventas, márcalo como "ejemplo".
- **Fórmulas visibles:** un desplegable "¿Cómo se calcula?" con la lógica en lenguaje llano.
- Gráficos: Chart.js desde `https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js` o SVG propio.
- Modo claro y oscuro (`prefers-color-scheme`), legible en móvil, tipografía de sistema.
- Comprueba mentalmente los cálculos con un caso conocido antes de entregar.

## 3. Vídeo explicativo

Usa la plantilla de la sección "Plantilla del vídeo" (al final): un reproductor HTML de escenas animadas con narración por voz sintética del navegador, subtítulos, barra de progreso y controles. No necesita instalar nada.

1. **Guion primero:** 4–8 escenas, 60–120 s en total. Estructura: gancho → problema → idea clave → cómo funciona (2–4 escenas) → resumen.
2. **Narración por escena:** 1–3 frases cortas, tono hablado, en el idioma del usuario.
3. **Visual por escena:** poco texto en pantalla. Usa las piezas de la plantilla:
   - `<div class="big">42 %</div>` dato protagonista.
   - `<div class="cards"><div>…</div><div>…</div></div>` comparaciones o listas cortas.
   - `<div class="flow"><span>A</span><span>B</span><span>C</span></div>` proceso con flechas.
   - `<div class="bars"><div style="--v:80" data-l="Etiqueta"></div>…</div>` barras (valor 0–100).
   - `<div class="emoji">🚀</div>` icono grande.
   - Añade `style="--i:N"` a los elementos para que aparezcan escalonados.
4. Sustituye `{{TITULO}}` y `{{ESCENAS}}` por un array JSON: `[{"titulo": "...", "visual": "<html>", "narracion": "..."}]`.

Si el usuario quiere un **MP4 real**, avisa de que requiere herramientas extra (p. ej. Remotion o ffmpeg + grabación) y pregunta antes de instalar nada.

## 4. Entrega

**Con acceso a archivos (Claude Code):** guarda en `./explicaciones/<tema-en-kebab-case>.html` (salvo otra ruta indicada) y ábrelo (Windows `start "" "<ruta>"`, macOS `open "<ruta>"`, Linux `xdg-open "<ruta>"`). En el chat: ruta y una línea de qué hacer con ello.

**Sin acceso a archivos (chat web):** crea un artefacto HTML con el mismo contenido.

Recuerda al usuario que es de usar y tirar: si le resulta útil a menudo, se puede convertir en algo permanente.

## Plantilla del vídeo

Copia esta plantilla tal cual en el archivo de salida y sustituye `{{TITULO}}` y `{{ESCENAS}}`. No leas archivos externos: la plantilla está aquí.

````html
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{TITULO}}</title>
<style>
  :root { --bg:#0b1120; --stage:#111827; --text:#f8fafc; --muted:#94a3b8; --accent:#60a5fa; --accent2:#a78bfa; --ok:#34d399; }
  * { box-sizing:border-box; }
  body { margin:0; min-height:100vh; display:grid; place-items:center; background:var(--bg); color:var(--text); font:16px/1.4 system-ui, -apple-system, "Segoe UI", sans-serif; padding:16px; }
  .player { width:min(1100px, 100%); }
  .stage { position:relative; aspect-ratio:16/9; background:radial-gradient(circle at 20% 10%, #1e293b, var(--stage) 60%); border-radius:18px; overflow:hidden; box-shadow:0 20px 60px rgba(0,0,0,.5); }
  .scene { position:absolute; inset:0; display:flex; flex-direction:column; align-items:center; justify-content:center; gap:4%; padding:6% 8% 14%; text-align:center; }
  .scene h2 { margin:0; font-size:clamp(1.2rem, 4vw, 2.8rem); letter-spacing:-.02em; animation:entra .6s ease both; }
  .scene .visual { width:100%; display:flex; justify-content:center; }
  .scene .visual > * , .cards > *, .flow > *, .bars > * { animation:entra .6s ease both; animation-delay:calc(.4s + var(--i, 0) * .45s); }
  @keyframes entra { from { opacity:0; transform:translateY(18px) scale(.97); } to { opacity:1; transform:none; } }
  .big { font-size:clamp(3rem, 12vw, 8rem); font-weight:800; background:linear-gradient(90deg, var(--accent), var(--accent2)); -webkit-background-clip:text; background-clip:text; color:transparent; }
  .emoji { font-size:clamp(3rem, 10vw, 7rem); }
  .cards { display:flex; flex-wrap:wrap; gap:16px; justify-content:center; }
  .cards > div { background:rgba(255,255,255,.06); border:1px solid rgba(255,255,255,.12); border-radius:14px; padding:14px 20px; font-size:clamp(.9rem, 2vw, 1.3rem); max-width:280px; }
  .flow { display:flex; flex-wrap:wrap; align-items:center; justify-content:center; gap:10px; }
  .flow > span { background:rgba(96,165,250,.15); border:2px solid var(--accent); border-radius:12px; padding:10px 16px; font-size:clamp(.9rem, 2vw, 1.3rem); }
  .flow > span:not(:last-child)::after { content:"→"; margin-left:18px; color:var(--accent2); font-weight:700; }
  .bars { display:flex; flex-direction:column; gap:10px; width:min(600px, 90%); }
  .bars > div { position:relative; height:34px; background:rgba(255,255,255,.06); border-radius:8px; overflow:hidden; }
  .bars > div::before { content:""; position:absolute; inset:0 auto 0 0; width:calc(var(--v) * 1%); background:linear-gradient(90deg, var(--accent), var(--accent2)); animation:crece 1.2s ease both; animation-delay:calc(.5s + var(--i, 0) * .45s); }
  .bars > div::after { content:attr(data-l); position:absolute; left:12px; top:50%; transform:translateY(-50%); font-size:.95rem; }
  @keyframes crece { from { width:0; } }
  .sub { position:absolute; left:6%; right:6%; bottom:5%; font-size:clamp(.85rem, 1.8vw, 1.15rem); background:rgba(0,0,0,.55); padding:8px 14px; border-radius:10px; color:#e5e7eb; }
  .progress { height:5px; background:rgba(255,255,255,.1); border-radius:4px; margin-top:12px; overflow:hidden; }
  .progress > div { height:100%; width:0; background:linear-gradient(90deg, var(--accent), var(--accent2)); transition:width .3s; }
  .controls { display:flex; gap:8px; align-items:center; justify-content:center; margin-top:12px; flex-wrap:wrap; color:var(--muted); font-size:.9rem; }
  button, select { font:inherit; background:#1f2937; color:var(--text); border:1px solid #374151; border-radius:8px; padding:6px 12px; cursor:pointer; }
  button:hover { border-color:var(--accent); }
  .overlay { position:absolute; inset:0; display:grid; place-items:center; background:rgba(11,17,32,.7); cursor:pointer; font-size:clamp(1rem, 3vw, 1.6rem); }
</style>
</head>
<body>
<div class="player">
  <div class="stage" id="stage">
    <div class="overlay" id="overlay">▶ Reproducir</div>
  </div>
  <div class="progress"><div id="bar"></div></div>
  <div class="controls">
    <button id="prev">⏮</button>
    <button id="play">⏸</button>
    <button id="next">⏭</button>
    <span id="count"></span>
    <select id="rate"><option value="0.9">0.9×</option><option value="1" selected>1×</option><option value="1.15">1.15×</option><option value="1.3">1.3×</option></select>
    <label><input type="checkbox" id="voz" checked> Voz</label>
  </div>
</div>
<script>
const ESCENAS = {{ESCENAS}};

const $ = (id) => document.getElementById(id);
const stage = $("stage"), synth = window.speechSynthesis;
let i = 0, playing = false, timer = null, token = 0;

function voz() {
  const vs = synth ? synth.getVoices() : [];
  const lang = document.documentElement.lang || "es";
  return vs.find(v => v.lang.startsWith(lang) && /natural|neural|google/i.test(v.name)) || vs.find(v => v.lang.startsWith(lang)) || null;
}

function render() {
  const e = ESCENAS[i];
  stage.querySelectorAll(".scene").forEach(n => n.remove());
  const s = document.createElement("div");
  s.className = "scene";
  s.innerHTML = `<h2>${e.titulo || ""}</h2><div class="visual">${e.visual || ""}</div><div class="sub">${e.narracion || ""}</div>`;
  stage.prepend(s);
  $("count").textContent = `${i + 1} / ${ESCENAS.length}`;
  $("bar").style.width = `${((i + 1) / ESCENAS.length) * 100}%`;
}

function avanzar(t) {
  if (t !== token || !playing) return;
  if (i < ESCENAS.length - 1) { i++; reproducir(); } else { playing = false; $("play").textContent = "↻"; }
}

function reproducir() {
  const t = ++token;
  clearTimeout(timer);
  if (synth) synth.cancel();
  render();
  if (!playing) return;
  const texto = ESCENAS[i].narracion || "";
  const rate = parseFloat($("rate").value);
  if (synth && $("voz").checked && texto) {
    const u = new SpeechSynthesisUtterance(texto);
    const v = voz(); if (v) { u.voice = v; u.lang = v.lang; }
    u.rate = rate;
    u.onend = () => { timer = setTimeout(() => avanzar(t), 700); };
    u.onerror = () => { timer = setTimeout(() => avanzar(t), 1000); };
    synth.speak(u);
  } else {
    const ms = Math.max(3500, (texto.split(/\s+/).length / 2.6) * 1000 / rate);
    timer = setTimeout(() => avanzar(t), ms);
  }
}

$("overlay").onclick = () => { $("overlay").remove(); playing = true; $("play").textContent = "⏸"; reproducir(); };
$("play").onclick = () => {
  if (i === ESCENAS.length - 1 && !playing) i = 0;
  playing = !playing;
  $("play").textContent = playing ? "⏸" : "▶";
  if (playing) reproducir(); else { token++; clearTimeout(timer); if (synth) synth.cancel(); }
};
$("prev").onclick = () => { i = Math.max(0, i - 1); reproducir(); };
$("next").onclick = () => { i = Math.min(ESCENAS.length - 1, i + 1); reproducir(); };
$("rate").onchange = () => reproducir();
if (synth) synth.onvoiceschanged = () => {};
render();
</script>
</body>
</html>
````
