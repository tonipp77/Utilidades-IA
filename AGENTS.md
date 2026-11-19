# AGENTS.md

Guía operativa para agentes de IA (Claude Code, Codex, Cursor, etc.) que trabajen en este repositorio. Los humanos deben leer [README.md](README.md).

## Qué es este repo

**Utilidades IA** es un **marketplace de plugins para Claude Code** publicado en GitHub. Reúne utilidades de IA curadas y propias: skills, slash commands, subagentes, hooks, servidores MCP y kits. Cada utilidad se distribuye como **plugin** instalable vía `/plugin`.

Principios no negociables:
1. **Calidad sobre cantidad.** Cada plugin debe resolver un problema real y funcionar al instalarlo.
2. **Autocontenido.** Un plugin no depende de archivos fuera de su carpeta.
3. **Documentado.** Todo plugin tiene su `README.md` con qué hace, cómo se instala y un ejemplo.
4. **Seguro.** Nada de secretos en el repo. Hooks y scripts deben ser legibles y sin efectos destructivos ocultos.

## Estructura

```
.
├── .claude-plugin/
│   └── marketplace.json        # Catálogo del marketplace (registro de TODOS los plugins)
├── plugins/
│   └── <nombre-plugin>/
│       ├── .claude-plugin/
│       │   └── plugin.json     # Manifiesto del plugin (obligatorio)
│       ├── skills/
│       │   └── <nombre-skill>/
│       │       ├── SKILL.md    # Frontmatter name + description, luego instrucciones
│       │       └── ...         # scripts/, references/, assets/ opcionales
│       ├── commands/           # Slash commands: <comando>.md
│       ├── agents/             # Subagentes: <agente>.md
│       ├── hooks/
│       │   └── hooks.json      # Hooks del plugin
│       ├── .mcp.json           # Servidores MCP del plugin
│       └── README.md           # Doc del plugin (obligatorio)
├── dist/<plugin>/<skill>.zip   # Skills empaquetadas para Claude/ChatGPT/Gemini (generado)
├── scripts/empaquetar-skills.ps1  # Genera dist/
├── assets/                     # Imágenes y SVG del README
├── templates/                  # Plantillas base para crear plugins nuevos
├── docs/                       # Guías transversales
├── AGENTS.md
├── CLAUDE.md                   # Importa este archivo
└── README.md
```

Solo `.claude-plugin/plugin.json` y `README.md` son obligatorios en un plugin; el resto de carpetas se incluye solo si se usan.

## Convenciones

- **Nombres:** `kebab-case` para plugins, skills, comandos y agentes. Descriptivos, sin prefijos genéricos (`util-`, `my-`).
- **Idioma:** contenido en español por defecto. Identificadores (nombres de archivo, claves JSON) en inglés o kebab-case sin tildes.
- **Versionado:** SemVer en `plugin.json` (`version`). Sube versión en cada cambio publicado:
  - `patch`: fixes y mejoras de texto.
  - `minor`: nueva skill/comando/agente dentro del plugin.
  - `major`: cambios incompatibles (renombrados, eliminación de componentes).
- **Skills:** el campo `description` del frontmatter es lo que dispara la skill. Debe decir **qué hace y cuándo usarla**, con frases que diría el usuario. Mantén `SKILL.md` conciso; mueve el detalle a `references/`.
- **Skills portables:** las skills deben funcionar también en Claude (web/app), ChatGPT, Codex, Gemini y Gemini CLI:
  - `description` de **máximo 200 caracteres** (límite de claude.ai) y entre comillas simples en el YAML.
  - El nombre de la carpeta debe coincidir con `name`.
  - Nada de leer archivos externos a la skill para funcionar: plantillas incrustadas en `SKILL.md`.
  - Si usas herramientas exclusivas de Claude Code (`AskUserQuestion`, `Agent`, `$ARGUMENTS`), da siempre una alternativa en texto.
- **README raíz:** tono de partida de rol (Dungeons & Dragons), divertido pero preciso. Mantén ese tono al añadir plugins y no rompas las instrucciones de instalación.
- **Rutas en hooks/MCP:** usa siempre `${CLAUDE_PLUGIN_ROOT}` para referenciar archivos del plugin. Nunca rutas absolutas.
- **Scripts:** preferir multiplataforma (Node o Python). Si son específicos de PowerShell o Bash, indícalo en el README del plugin.
- **Secretos:** solo vía variables de entorno documentadas. Nunca claves, tokens ni datos personales en el repo.

## Flujo para añadir un plugin

1. Copia la plantilla de `templates/` (o crea la estructura de arriba) en `plugins/<nombre-plugin>/`.
2. Rellena `.claude-plugin/plugin.json`:
   ```json
   {
     "name": "nombre-plugin",
     "version": "0.1.0",
     "description": "Qué hace en una frase.",
     "author": { "name": "Toni" },
     "keywords": ["categoria", "tema"]
   }
   ```
3. Añade los componentes (skills, commands, agents, hooks, MCP).
4. Escribe `plugins/<nombre-plugin>/README.md`.
5. **Registra el plugin** en `.claude-plugin/marketplace.json` dentro de `plugins`:
   ```json
   {
     "name": "nombre-plugin",
     "source": "./plugins/nombre-plugin",
     "description": "Qué hace en una frase.",
     "version": "0.1.0",
     "category": "productividad"
   }
   ```
6. Regenera los ZIP con `pwsh ./scripts/empaquetar-skills.ps1` y actualiza la Taberna (catálogo) de [README.md](README.md) con su rareza y enlaces a los ZIP.
7. Valida (ver abajo).

Un plugin que no esté en `marketplace.json` **no existe** para los usuarios. Mantén ambos sincronizados (nombre, versión, descripción).

## Validación antes de dar algo por terminado

- `claude plugin validate .` en la raíz (valida marketplace y manifiestos).
- JSON válido en todos los `*.json`.
- Prueba local: `/plugin marketplace add ./` y `/plugin install <nombre-plugin>@utilidades-ia`, luego ejecuta el componente al menos una vez.
- Revisa que el `README.md` del plugin y la tabla del README raíz están al día.

No declares un plugin terminado sin haberlo instalado y probado. Si no has podido probarlo, dilo explícitamente.

## Categorías

Usa una de estas en `category` (amplía la lista aquí si hace falta una nueva):
`productividad`, `desarrollo`, `automatizacion`, `contenido`, `marketing`, `datos`, `negocio`, `cripto`, `utilidades`.

## Git

- Rama `main` siempre instalable.
- Commits en español, imperativo y con prefijo convencional: `feat(plugin): ...`, `fix(plugin): ...`, `docs: ...`, `chore: ...`.
- Un plugin nuevo o cambio relevante = un commit o PR propio.

## Qué NO hacer

- No modificar plugins de terceros incluidos sin indicar el origen y la licencia en su README.
- No añadir dependencias pesadas si un script simple resuelve el problema.
- No crear plugins "cajón de sastre": si una utilidad no encaja en uno existente, va en su propio plugin.
