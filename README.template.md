<!--
  README template: deployed application.

  Replace every placeholder, replace the example prose, then delete this comment block.
  Stack badges: copy from BADGES.md, which is sourced verbatim from Badges4-README.md-Profile.
  Keep the section names — they are the same in every repository.
-->

# {{PROJECT}}

{{TAGLINE}}

<!-- STATUS ROW — facts, small, fixed order: live · CI · license.
     Omit a badge entirely if the fact is not true. Never link a workflow that does not exist. -->
<p align="left">
  <a href="{{LIVE_URL}}"><img src="https://img.shields.io/badge/live-{{LIVE_HOST}}-FF3D81?style=flat-square" alt="Live site"></a>
  <a href="https://github.com/{{OWNER}}/{{REPO}}/actions/workflows/ci.yml"><img src="https://github.com/{{OWNER}}/{{REPO}}/actions/workflows/ci.yml/badge.svg" alt="CI status"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/MIT-green?style=flat-square" alt="MIT license"></a>
</p>

<!-- STACK ROW — identity, large, one line, 4–7 badges.
     Order: language → framework → styling → data → infrastructure.
     The example below is TypeScript; replace it with the real stack. -->
<p align="left">
  <img src="https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript">
</p>

<!-- WIP only. Delete this block when the project is shipped.
> **Status:** week 1 slice — what works, what does not, what is next.
-->

## About

Two to four sentences on what this is, who it is for, and the one constraint that makes
it interesting. No feature list here.

**Live:** [{{LIVE_HOST}}]({{LIVE_URL}})

## Screenshot

![{{PROJECT}} screenshot](docs/screenshots/hero.png)

<!-- Optional detail shots:
| View | View |
| --- | --- |
| ![](docs/screenshots/one.png) | ![](docs/screenshots/two.png) |
-->

## Features

- **Bold lead-in** — what it does, and the constraint behind it when it matters.
- **Bold lead-in** — same shape.
- **Bold lead-in** — same shape.

## Quick Start

Requirements: {{REQUIREMENTS}}.

```bash
git clone git@github.com:{{OWNER}}/{{REPO}}.git
cd {{REPO}}
{{INSTALL}}
{{RUN}}
```

Open [http://localhost:5173](http://localhost:5173).

## Configuration

| Variable | Required | Description |
| --- | --- | --- |
| `{{ENV_VAR}}` | yes | {{ENV_DESCRIPTION}} |

## How It Works

Three to six bullets on the architecture, or a Mermaid diagram when the flow is not
obvious. Do not repeat the stack badges as prose.

```mermaid
flowchart LR
  Browser --> App
  App --> Database[(Database)]
```

## Testing

```bash
{{TEST_COMMAND}}
```

## Deployment

{{DEPLOYMENT}}

## Project Structure

```text
{{STRUCTURE}}
```

## Roadmap

- [x] {{DONE}}
- [ ] {{NEXT}}

## License

MIT © {{YEAR}} {{AUTHOR}}. See [LICENSE](LICENSE).

---

_{{PROJECT}} — {{FOOTER}}_
