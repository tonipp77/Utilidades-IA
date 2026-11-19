# Utilidades IA

> Marketplace de plugins para **Claude Code**: skills, comandos, subagentes, hooks y servidores MCP que uso a diario para trabajar más rápido con IA.

Aquí reúno las utilidades de IA que voy descubriendo y creando: desde automatizaciones para emprendedores hasta herramientas de desarrollo. Todo está empaquetado como plugins listos para instalar en un par de comandos.

---

## 🚀 Instalación rápida

En Claude Code:

```
/plugin marketplace add tonipp77/Utilidades-IA
```

Después instala el plugin que quieras:

```
/plugin install <nombre-plugin>@utilidades-ia
```

O explora el catálogo de forma interactiva con `/plugin`.

---

## 📦 Catálogo

| Plugin | Categoría | Qué hace |
|--------|-----------|----------|
| [mejores-respuestas](plugins/mejores-respuestas) | Productividad | Dictado, entrevista, lenguaje técnico simplificado, diagramas, explicaciones visuales y revisor crítico para sacar mejores respuestas de la IA. |

---

## 🧩 ¿Qué incluye un plugin?

| Componente | Para qué sirve |
|------------|----------------|
| **Skills** | Conocimiento e instrucciones que Claude activa automáticamente cuando la tarea encaja. |
| **Comandos** | Atajos `/comando` para lanzar flujos concretos. |
| **Subagentes** | Agentes especializados a los que Claude delega tareas. |
| **Hooks** | Automatizaciones que se ejecutan en eventos (antes/después de usar herramientas, al iniciar sesión…). |
| **MCP** | Conexiones con servicios y herramientas externas. |

---

## 🗂️ Estructura del repo

```
.claude-plugin/marketplace.json   → catálogo del marketplace
plugins/<plugin>/                 → cada plugin, autocontenido
templates/                        → plantillas para crear plugins
docs/                             → guías
```

---

## 🛠️ Contribuir

¿Tienes una utilidad que encaja aquí? Abre un issue o un PR.

1. Crea tu plugin en `plugins/<nombre-plugin>/` a partir de `templates/`.
2. Regístralo en `.claude-plugin/marketplace.json`.
3. Documéntalo en su `README.md` y añádelo al catálogo de arriba.
4. Valida con `claude plugin validate .` y pruébalo instalándolo en local.

Las reglas detalladas están en [AGENTS.md](AGENTS.md) (escritas para agentes de IA, pero igual de útiles para humanos).

---

## ⚠️ Aviso

Los plugins ejecutan código y pueden tener acceso a tu sistema. Revisa lo que instalas, especialmente hooks y servidores MCP.

## 📄 Licencia

MIT
