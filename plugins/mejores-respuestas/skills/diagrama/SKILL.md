---
name: diagrama
description: 'Responde con un diagrama de flechas a color en vez de párrafos. Úsala con "dibújame un esquema", "diagrama", "con flechas", procesos, relaciones o sistemas complejos.'
---

# Diagrama de flechas a color

Un buen diagrama se entiende en 10 segundos. El color no decora: **codifica significado**.

Tema: `$ARGUMENTS`, un archivo o el contenido de la conversación.

## 1. Elige el tipo

| Si el contenido es… | Usa | Mermaid |
|---|---|---|
| Pasos, procesos, decisiones | Flujo | `flowchart TD` (o `LR` si es ancho) |
| Quién habla con quién y cuándo | Secuencia | `sequenceDiagram` |
| Entidades y cómo se relacionan | Mapa de relaciones | `flowchart LR` con etiquetas en flechas |
| Jerarquía o descomposición | Árbol | `flowchart TD` o `mindmap` |
| Estados y transiciones | Estados | `stateDiagram-v2` |
| Fases en el tiempo | Cronología | `timeline` o `gantt` |

## 2. Reglas de diseño

- **Máximo ~15 nodos.** Si hay más, agrupa con `subgraph` o haz varios diagramas (vista general + detalle).
- **Etiquetas de 2–5 palabras.** Verbo + objeto en pasos ("Validar factura").
- **Toda flecha con significado lleva etiqueta:** `A -->|aprueba| B`.
- **Una dirección de lectura.** Evita flechas que crucen todo el diagrama.
- **Fiel al contenido:** no inventes pasos ni relaciones. Si algo no está claro, nodo con `?`.

## 3. Código de colores (siempre con leyenda)

Pega estos `classDef` y asigna clases con `class nodo1,nodo2 nombreClase`. Usa solo las clases necesarias.

```
classDef inicio fill:#d1fae5,stroke:#059669,stroke-width:2px,color:#064e3b
classDef proceso fill:#dbeafe,stroke:#2563eb,stroke-width:2px,color:#1e3a8a
classDef decision fill:#fef3c7,stroke:#d97706,stroke-width:2px,color:#78350f
classDef riesgo fill:#fee2e2,stroke:#dc2626,stroke-width:2px,color:#7f1d1d
classDef actor fill:#ede9fe,stroke:#7c3aed,stroke-width:2px,color:#4c1d95
classDef dato fill:#f1f5f9,stroke:#475569,stroke-width:2px,color:#1e293b
classDef externo fill:#cffafe,stroke:#0891b2,stroke-width:2px,color:#164e63
```

| Clase | Color | Significa |
|---|---|---|
| `inicio` | 🟢 verde | Inicio, fin, resultado |
| `proceso` | 🔵 azul | Paso o acción |
| `decision` | 🟡 ámbar | Decisión o condición (forma rombo `{}`) |
| `riesgo` | 🔴 rojo | Riesgo, error, bloqueo, excepción |
| `actor` | 🟣 violeta | Persona, rol o equipo |
| `dato` | ⚪ gris | Documento, dato, sistema interno |
| `externo` | 🩵 cian | Tercero o sistema externo |

Tipos de flecha: `-->` flujo normal · `==>` camino crítico · `-.->` opcional o dependencia indirecta · `--x` bloqueo.

## 4. Entrega

**Con acceso a archivos (Claude Code):**
1. Escribe la plantilla de la sección "Plantilla HTML" (al final) en `./diagramas/<tema-en-kebab-case>.html`, salvo que el usuario indique otra ruta.
2. Sustituye `{{TITULO}}`, `{{SUBTITULO}}` (una frase), `{{DIAGRAMA}}` (código Mermaid) y `{{LEYENDA}}` (un `<li><span class="sw clase"></span>Significado</li>` por clase usada).
3. Ábrelo: Windows `start "" "<ruta>"`, macOS `open "<ruta>"`, Linux `xdg-open "<ruta>"`.
4. En el chat: ruta del archivo y 2–3 viñetas con lo que muestra el diagrama.

**Sin acceso a archivos (chat web):** devuelve un bloque ```` ```mermaid ```` con el diagrama y debajo la leyenda. Si el entorno admite artefactos, crea uno con la plantilla.

**Si el usuario lo pide en texto plano:** diagrama ASCII con flechas (`──►`, `│`, `▼`) y la misma lógica de colores con emojis (🟢🔵🟡🔴).

No añadas párrafos explicativos largos: el diagrama es la respuesta.

## Plantilla HTML

Copia esta plantilla tal cual en el archivo de salida y sustituye los marcadores. No leas archivos externos: la plantilla está aquí.

````html
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{TITULO}}</title>
<style>
  :root { --bg:#f8fafc; --card:#ffffff; --text:#0f172a; --muted:#64748b; --border:#e2e8f0; }
  @media (prefers-color-scheme: dark) {
    :root { --bg:#0b1120; --card:#111827; --text:#e5e7eb; --muted:#94a3b8; --border:#1f2937; }
  }
  * { box-sizing: border-box; }
  body { margin:0; background:var(--bg); color:var(--text); font:16px/1.5 system-ui, -apple-system, "Segoe UI", sans-serif; }
  main { max-width:1200px; margin:0 auto; padding:32px 16px 48px; }
  h1 { margin:0 0 4px; font-size:clamp(1.4rem, 3vw, 2rem); letter-spacing:-.02em; }
  p.sub { margin:0 0 24px; color:var(--muted); }
  .card { background:var(--card); border:1px solid var(--border); border-radius:16px; padding:24px; overflow:auto; box-shadow:0 1px 3px rgba(0,0,0,.06); }
  .mermaid { display:flex; justify-content:center; min-width:fit-content; }
  .bar { display:flex; flex-wrap:wrap; gap:16px; align-items:center; justify-content:space-between; margin-top:16px; }
  ul.leyenda { list-style:none; display:flex; flex-wrap:wrap; gap:8px 20px; margin:0; padding:0; font-size:.9rem; color:var(--muted); }
  ul.leyenda li { display:flex; align-items:center; gap:8px; }
  .sw { width:14px; height:14px; border-radius:4px; border:2px solid; display:inline-block; }
  .sw.inicio { background:#d1fae5; border-color:#059669; }
  .sw.proceso { background:#dbeafe; border-color:#2563eb; }
  .sw.decision { background:#fef3c7; border-color:#d97706; }
  .sw.riesgo { background:#fee2e2; border-color:#dc2626; }
  .sw.actor { background:#ede9fe; border-color:#7c3aed; }
  .sw.dato { background:#f1f5f9; border-color:#475569; }
  .sw.externo { background:#cffafe; border-color:#0891b2; }
  button { font:inherit; font-size:.85rem; padding:6px 14px; border-radius:8px; border:1px solid var(--border); background:var(--card); color:var(--text); cursor:pointer; }
  button:hover { border-color:var(--muted); }
</style>
</head>
<body>
<main>
  <h1>{{TITULO}}</h1>
  <p class="sub">{{SUBTITULO}}</p>
  <div class="card">
    <pre class="mermaid">
{{DIAGRAMA}}
    </pre>
  </div>
  <div class="bar">
    <ul class="leyenda">
      {{LEYENDA}}
    </ul>
    <button id="descargar">Descargar SVG</button>
  </div>
</main>
<script type="module">
  import mermaid from "https://cdn.jsdelivr.net/npm/mermaid@11.4.1/dist/mermaid.esm.min.mjs";
  const oscuro = matchMedia("(prefers-color-scheme: dark)").matches;
  mermaid.initialize({
    startOnLoad: false,
    theme: oscuro ? "dark" : "default",
    securityLevel: "strict",
    flowchart: { curve: "basis", htmlLabels: true, padding: 16 },
    themeVariables: { fontFamily: "system-ui, -apple-system, Segoe UI, sans-serif", fontSize: "15px" }
  });
  await mermaid.run();
  document.getElementById("descargar").onclick = () => {
    const svg = document.querySelector(".mermaid svg");
    if (!svg) return;
    const blob = new Blob([svg.outerHTML], { type: "image/svg+xml" });
    const a = Object.assign(document.createElement("a"), { href: URL.createObjectURL(blob), download: "diagrama.svg" });
    a.click();
    URL.revokeObjectURL(a.href);
  };
</script>
</body>
</html>
````
