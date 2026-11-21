# Badge Cookbook

The badge system used across all repositories. Copy from here; do not invent a new style
per repo.

## Two tiers

| Tier | Style | Purpose | Position |
| --- | --- | --- | --- |
| **Status** | `flat-square`, small | Facts: live, CI, license | First row |
| **Stack** | `for-the-badge`, large | Identity: language, framework, data, infra | Second row |

The hierarchy is what makes a header feel designed. Mixing the two styles in one row
makes it look assembled from different projects.

## Rules

1. **Status order is fixed:** live → CI → license.
2. **Stack order is fixed:** language → framework → styling → data → infrastructure.
3. **4–7 stack badges.** Drop anything that is not a differentiator. `Git` and `VS Code`
   are noise.
4. **One accent for "live" across all repos.** Use `FF3D81` everywhere. Per-project
   colors make the profile grid look random; let the stack badges carry the project color.
5. **Use official brand hex values.** `PostgreSQL` is `4169E1`, not `green`. `Tailwind` is
   `06B6D4` everywhere, not sometimes `38B2AC`.
6. **Pick a logo color that contrasts.** White on dark, black on light.
7. **Always write `alt`.** It is the accessible name and it survives a broken image.
8. **Label the product, not the marketing.** `Svelte 5`, not `Svelte 5 Runes ⚡`.
9. **No badge that is not true.** No live badge before deployment, no CI badge without a
   workflow, no release badge without releases.
10. **Underscores for spaces, double hyphen for a literal hyphen.**
    `Tailwind_CSS`, `scikit--learn`.

## Anatomy

```
https://img.shields.io/badge/<LABEL>-<HEX>?style=for-the-badge&logo=<SLUG>&logoColor=<HEX>
```

- `<LABEL>` — the product name; spaces become `_`.
- `<HEX>` — the brand color without `#`.
- `<SLUG>` — the Simple Icons slug (`simpleicons.org`).
- `logoColor` — `white` or `black` for contrast.

## Status row

### Live + CI + license

```html
<p align="left">
  <a href="{{LIVE_URL}}"><img src="https://img.shields.io/badge/live-{{LIVE_HOST}}-FF3D81?style=flat-square" alt="Live site"></a>
  <a href="https://github.com/{{OWNER}}/{{REPO}}/actions/workflows/ci.yml"><img src="https://github.com/{{OWNER}}/{{REPO}}/actions/workflows/ci.yml/badge.svg" alt="CI status"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square" alt="MIT license"></a>
</p>
```

### Live + license (no CI)

```html
<p align="left">
  <a href="https://example.com"><img src="https://img.shields.io/badge/live-example.com-FF3D81?style=flat-square" alt="Live site"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square" alt="MIT license"></a>
</p>
```

### CI + license (no deployment)

```html
<p align="left">
  <a href="https://github.com/franpts2/example/actions/workflows/ci.yml"><img src="https://github.com/franpts2/example/actions/workflows/ci.yml/badge.svg" alt="CI status"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square" alt="MIT license"></a>
</p>
```

The CI badge is GitHub's own SVG, not a Shields badge. Link it to the workflow page.

## Stack row

```html
<p align="left">
  <!-- 4–7 badges, language → framework → styling → data → infrastructure -->
</p>
```

### SvelteKit full-stack

```html
<img src="https://img.shields.io/badge/Svelte_5-FF3E00?style=for-the-badge&logo=svelte&logoColor=white" alt="Svelte 5">
<img src="https://img.shields.io/badge/SvelteKit-FF3E00?style=for-the-badge&logo=svelte&logoColor=white" alt="SvelteKit">
<img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript">
<img src="https://img.shields.io/badge/Tailwind_CSS_v4-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white" alt="Tailwind CSS v4">
<img src="https://img.shields.io/badge/Drizzle_ORM-C5F74F?style=for-the-badge&logo=drizzle&logoColor=black" alt="Drizzle ORM">
<img src="https://img.shields.io/badge/Turso-000000?style=for-the-badge&logo=turso&logoColor=00FFA3" alt="Turso">
```

### React + Vite

```html
<img src="https://img.shields.io/badge/React_19-20232A?style=for-the-badge&logo=react&logoColor=61DAFB" alt="React 19">
<img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript">
<img src="https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=FFD62E" alt="Vite">
<img src="https://img.shields.io/badge/Tailwind_CSS_v4-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white" alt="Tailwind CSS v4">
```

### Cloudflare realtime

```html
<img src="https://img.shields.io/badge/Cloudflare_Workers-F38020?style=for-the-badge&logo=cloudflare&logoColor=white" alt="Cloudflare Workers">
<img src="https://img.shields.io/badge/Durable_Objects-F38020?style=for-the-badge&logo=cloudflare&logoColor=white" alt="Durable Objects">
<img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript">
<img src="https://img.shields.io/badge/WebSockets-010101?style=for-the-badge&logo=socketdotio&logoColor=white" alt="WebSockets">
```

### Python + ML

```html
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python">
<img src="https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white" alt="FastAPI">
<img src="https://img.shields.io/badge/scikit--learn-F7931E?style=for-the-badge&logo=scikitlearn&logoColor=white" alt="scikit-learn">
<img src="https://img.shields.io/badge/OpenCV-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white" alt="OpenCV">
```

### Laravel + PostgreSQL

```html
<img src="https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel">
<img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP">
<img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
<img src="https://img.shields.io/badge/Tailwind_CSS_v4-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white" alt="Tailwind CSS v4">
```

### Java + course stack

```html
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java">
<img src="https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white" alt="Gradle">
<img src="https://img.shields.io/badge/JUnit_5-25A162?style=for-the-badge&logo=junit5&logoColor=white" alt="JUnit 5">
```

## Component table

| Tech | Color | `logo` | `logoColor` |
| --- | --- | --- | --- |
| Svelte 5 / SvelteKit | `FF3E00` | `svelte` | `white` |
| TypeScript | `3178C6` | `typescript` | `white` |
| Tailwind CSS v4 | `06B6D4` | `tailwindcss` | `white` |
| React 19 | `20232A` | `react` | `61DAFB` |
| Vite | `646CFF` | `vite` | `FFD62E` |
| Cloudflare Workers / Pages | `F38020` | `cloudflare` | `white` |
| Durable Objects | `F38020` | `cloudflare` | `white` |
| Drizzle ORM | `C5F74F` | `drizzle` | `black` |
| Turso | `000000` | `turso` | `00FFA3` |
| SQLite | `003B57` | `sqlite` | `white` |
| Node.js | `5FA04E` | `nodedotjs` | `white` |
| Python | `3776AB` | `python` | `white` |
| FastAPI | `009688` | `fastapi` | `white` |
| scikit-learn | `F7931E` | `scikitlearn` | `white` |
| OpenCV | `5C3EE8` | `opencv` | `white` |
| MediaPipe | `0097A7` | *(none)* | — |
| Laravel | `FF2D20` | `laravel` | `white` |
| PHP | `777BB4` | `php` | `white` |
| PostgreSQL | `4169E1` | `postgresql` | `white` |
| Java | `007396` | `openjdk` | `white` |
| C | `A8B9CC` | `c` | `black` |
| C++ | `00599C` | `cplusplus` | `white` |
| C# | `512BD4` | `csharp` | `white` |
| Dart | `0175C2` | `dart` | `white` |
| Flutter | `02569B` | `flutter` | `white` |
| JavaScript | `F7DF1E` | `javascript` | `black` |
| WebGL | `990000` | `webgl` | `white` |
| OpenGL | `5586A4` | `opengl` | `white` |
| Typst | `239DAD` | `typst` | `white` |
| Bash | `4EAA25` | `gnubash` | `white` |
| Haskell | `5D4F85` | `haskell` | `white` |
| LaTeX | `008080` | `latex` | `white` |
| Docker | `2496ED` | `docker` | `white` |
| Git | `F05032` | `git` | `white` |

## Adding a badge that is not here

1. Search [simpleicons.org](https://simpleicons.org) for the slug.
2. Take the brand hex from the project's press kit, not from a random badge generator.
3. Pick `white` or `black` for `logoColor` based on contrast.
4. Add the row to the table above before using it in a README.
5. If the brand has no Simple Icons entry, omit `logo` rather than using a misleading one.

## Anti-patterns

- `PostgreSQL-green` — use the brand color.
- `Made_with_❤️` — tells the reader nothing.
- Five badges for one framework (`Svelte`, `SvelteKit`, `Svelte 5 Runes`, `Svelte Store`,
  `Vite`).
- Dynamic badges that will read `0` forever.
- A badge row wider than the content column.
- Mixed `flat`, `flat-square`, `plastic`, and `for-the-badge` in one row.
