# Badge Cookbook

Stack badges are copied **verbatim** from
[Badges4-README.md-Profile](https://github.com/alexandresanlim/Badges4-README.md-Profile)
at commit [`04ba867`](https://github.com/alexandresanlim/Badges4-README.md-Profile/commit/04ba867757a1ed0a6b984bd8b8e050ee09d7c950)
(2026-11-12). Do not tweak the color or logo casing: the point is that the badge is the
same one the collection publishes.

Status badges (live, CI, license) are not part of that collection. They stay small and
flat-square. Only the MIT label and color come from the collection's license entry.

## Two tiers

| Tier | Style | Purpose | Position |
| --- | --- | --- | --- |
| **Status** | `flat-square`, small | Facts: live, CI, license | First row |
| **Stack** | `for-the-badge`, large | Identity: language, framework, data, infra | Second row |

The hierarchy is what makes a header feel designed. Mixing the two styles in one row
makes it look assembled from different projects.

## Rules

1. **Copy stack badges verbatim from the collection.** No color tweaks, no renamed
   labels, no logo case changes.
2. **Status order is fixed:** live → CI → license.
3. **Stack order is fixed:** language → framework → styling → data → infrastructure.
4. **4–7 stack badges.** Drop anything that is not a differentiator. `Git` and `VS Code`
   are noise.
5. **One framework badge, not two.** For a SvelteKit project use `SvelteKit`, not both
   `Svelte` and `SvelteKit`, unless the project genuinely uses Svelte without Kit.
6. **One accent for "live" across all repos.** Use `FF3D81` everywhere. Let the stack
   badges carry the project color.
7. **Always write `alt`.** It is the accessible name and it survives a broken image.
8. **Label the product, not the marketing.** `SvelteKit`, not `SvelteKit 5 Runes ⚡`.
9. **No badge that is not true.** No live badge before deployment, no CI badge without a
   workflow, no release badge without releases.
10. **If a technology is not in the collection, use the closest collection badge or the
    fallback section below.** Never silently invent a new color and call it the
    collection's.

## Status row

### Live + CI + license

```html
<p align="left">
  <a href="{{LIVE_URL}}"><img src="https://img.shields.io/badge/live-{{LIVE_HOST}}-FF3D81?style=flat-square" alt="Live site"></a>
  <a href="https://github.com/{{OWNER}}/{{REPO}}/actions/workflows/ci.yml"><img src="https://github.com/{{OWNER}}/{{REPO}}/actions/workflows/ci.yml/badge.svg" alt="CI status"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/MIT-green?style=flat-square" alt="MIT license"></a>
</p>
```

The CI badge is GitHub's own SVG, not a Shields badge. Link it to the workflow page.
The `MIT-green` label and color are the collection's license badge, adapted to
`flat-square` so it sits in the status row rather than the stack row.

### Live + license (no CI)

```html
<p align="left">
  <a href="https://example.com"><img src="https://img.shields.io/badge/live-example.com-FF3D81?style=flat-square" alt="Live site"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/MIT-green?style=flat-square" alt="MIT license"></a>
</p>
```

### CI + license (no deployment)

```html
<p align="left">
  <a href="https://github.com/franpts2/example/actions/workflows/ci.yml"><img src="https://github.com/franpts2/example/actions/workflows/ci.yml/badge.svg" alt="CI status"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/MIT-green?style=flat-square" alt="MIT license"></a>
</p>
```

## Ready-to-paste stacks

### SvelteKit full-stack

```html
<img src="https://img.shields.io/badge/SvelteKit-FF3E00?style=for-the-badge&logo=Svelte&logoColor=white" alt="SvelteKit">
<img src="https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript">
<img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind CSS">
```

### Svelte without Kit

```html
<img src="https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00" alt="Svelte">
```

### React + Vite

```html
<img src="https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB" alt="React">
<img src="https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript">
<img src="https://img.shields.io/badge/Vite-B73BFE?style=for-the-badge&logo=vite&logoColor=FFD62E" alt="Vite">
<img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind CSS">
```

### Cloudflare (Workers, Pages, Durable Objects)

```html
<img src="https://img.shields.io/badge/Cloudflare-F38020?style=for-the-badge&logo=Cloudflare&logoColor=white" alt="Cloudflare">
<img src="https://img.shields.io/badge/Cloudflare%20Pages-F38020?style=for-the-badge&logo=Cloudflare%20Pages&logoColor=white" alt="Cloudflare Pages">
```

The collection has no Workers or Durable Objects badge. Use the `Cloudflare` badge and
name the primitive in prose or in `How It Works`.

### Python + ML

```html
<img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue" alt="Python">
<img src="https://img.shields.io/badge/fastapi-109989?style=for-the-badge&logo=FASTAPI&logoColor=white" alt="FastAPI">
<img src="https://img.shields.io/badge/scikit_learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white" alt="scikit-learn">
<img src="https://img.shields.io/badge/OpenCV-27338e?style=for-the-badge&logo=OpenCV&logoColor=white" alt="OpenCV">
```

### Laravel + PostgreSQL

```html
<img src="https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel">
<img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP">
<img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
<img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind CSS">
```

### C / C++ coursework

```html
<img src="https://img.shields.io/badge/C-00599C?style=for-the-badge&logo=c&logoColor=white" alt="C">
<img src="https://img.shields.io/badge/C%2B%2B-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white" alt="C++">
```

### C#

```html
<img src="https://img.shields.io/badge/C%23-7355DD?style=for-the-badge&logo=csharp&logoColor=white" alt="C#">
```

### Dart + Flutter

```html
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
```

### JavaScript / HTML / CSS

```html
<img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E" alt="JavaScript">
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css&logoColor=white" alt="CSS3">
```

### Data and ORM

```html
<img src="https://img.shields.io/badge/drizzle-C5F74F?style=for-the-badge&logo=drizzle&logoColor=black" alt="Drizzle">
<img src="https://img.shields.io/badge/Sqlite-003B57?style=for-the-badge&logo=sqlite&logoColor=white" alt="SQLite">
<img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
```

Turso is SQLite-compatible; use the `Sqlite` badge, or the fallback `Turso` badge below
if the name matters.

### Graphics

```html
<img src="https://img.shields.io/badge/ThreeJs-black?style=for-the-badge&logo=three.js&logoColor=white" alt="three.js">
<img src="https://img.shields.io/badge/OpenGL-FFFFFF?style=for-the-badge&logo=opengl" alt="OpenGL">
```

The collection publishes `ThreeJs` for three.js and `OpenGL` for raw OpenGL. It has no
WebGL badge; use `ThreeJs` for a three.js project, `OpenGL` for raw WebGL, or the fallback
`WebGL` badge below.

### Languages and tools

```html
<img src="https://img.shields.io/badge/Haskell-5D4F85?style=for-the-badge&logo=haskell&logoColor=white" alt="Haskell">
<img src="https://img.shields.io/badge/LaTeX-47A141?style=for-the-badge&logo=LaTeX&logoColor=white" alt="LaTeX">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25?style=for-the-badge&logo=GNU%20Bash&logoColor=white" alt="GNU Bash">
<img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Shell Script">
```

## More collection badges

```html
<!-- Testing -->
<img src="https://img.shields.io/badge/Vitest-%236E9F18?style=for-the-badge&logo=Vitest&logoColor=%23fcd703" alt="Vitest">
<img src="https://img.shields.io/badge/Jest-C21325?style=for-the-badge&logo=jest&logoColor=white" alt="Jest">
<img src="https://img.shields.io/badge/Playwright-45ba4b?style=for-the-badge&logo=Playwright&logoColor=white" alt="Playwright">
<img src="https://img.shields.io/badge/Cypress-17202C?style=for-the-badge&logo=cypress&logoColor=white" alt="Cypress">

<!-- Deployment -->
<img src="https://img.shields.io/badge/Vercel-000000?style=for-the-badge&logo=vercel&logoColor=white" alt="Vercel">
<img src="https://img.shields.io/badge/Netlify-00C7B7?style=for-the-badge&logo=netlify&logoColor=white" alt="Netlify">
<img src="https://img.shields.io/badge/Github%20Actions-282a2e?style=for-the-badge&logo=githubactions&logoColor=367cfe" alt="GitHub Actions">

<!-- Data -->
<img src="https://img.shields.io/badge/Supabase-181818?style=for-the-badge&logo=supabase&logoColor=white" alt="Supabase">
<img src="https://img.shields.io/badge/Prisma-3982CE?style=for-the-badge&logo=Prisma&logoColor=white" alt="Prisma">

<!-- Notebooks -->
<img src="https://img.shields.io/badge/Jupyter-F37626.svg?&style=for-the-badge&logo=Jupyter&logoColor=white" alt="Jupyter">
<img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas">
<img src="https://img.shields.io/badge/Numpy-777BB4?style=for-the-badge&logo=numpy&logoColor=white" alt="NumPy">
<img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white" alt="TensorFlow">

<!-- 3D -->
<img src="https://img.shields.io/badge/ThreeJs-black?style=for-the-badge&logo=three.js&logoColor=white" alt="three.js">

<!-- Tools -->
<img src="https://img.shields.io/badge/Node%20js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white" alt="Node.js">
<img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
<img src="https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white" alt="Git">
<img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" alt="Markdown">
<img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white" alt="Figma">
```

## Not in the collection

These are used by projects in this account but are not published in
Badges4-README.md-Profile. Prefer the closest collection badge when it is honest; use
these only when the exact name matters.

| Technology | Closest collection badge | Fallback |
| --- | --- | --- |
| Java | — | `Java-007396` with the OpenJDK logo |
| Prolog | — | `Prolog-74283C`, no logo |
| MediaPipe | — | `MediaPipe-0097A7`, no logo |
| Typst | — | `Typst-239DAD` with the Typst logo |
| Turso | `Sqlite` | `Turso-000000` with the Turso logo |
| Durable Objects | `Cloudflare` | `Durable_Objects-F38020` with the Cloudflare logo |
| WebGL | `ThreeJs` for three.js, `OpenGL` for raw WebGL | `WebGL-990000` with the WebGL logo |

```html
<!-- Fallbacks: same for-the-badge format, but NOT from Badges4. Do not label them as such. -->
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java">
<img src="https://img.shields.io/badge/Prolog-74283C?style=for-the-badge" alt="Prolog">
<img src="https://img.shields.io/badge/MediaPipe-0097A7?style=for-the-badge" alt="MediaPipe">
<img src="https://img.shields.io/badge/Typst-239DAD?style=for-the-badge&logo=typst&logoColor=white" alt="Typst">
<img src="https://img.shields.io/badge/Turso-000000?style=for-the-badge&logo=turso&logoColor=00FFA3" alt="Turso">
<img src="https://img.shields.io/badge/Durable_Objects-F38020?style=for-the-badge&logo=cloudflare&logoColor=white" alt="Durable Objects">
<img src="https://img.shields.io/badge/WebGL-990000?style=for-the-badge&logo=webgl&logoColor=white" alt="WebGL">
```

## Adding a badge that is not here

1. Search the [collection](https://github.com/alexandresanlim/Badges4-README.md-Profile)
   first.
2. Copy the URL exactly, including the casing of `logo=` and any `%23` encoding.
3. If it is not there, check the fallback table.
4. If it is still not there, use the official brand color and add it to the fallback
   table with a note that it is not from the collection.
5. Do not add a new badge to a README without adding it here first.

## Anti-patterns

- Mixing the collection's colors with the old palette (`3178C6`, `06B6D4`, `646CFF`,
  `3776AB`). Pick one and use it everywhere.
- Using `PostgreSQL-green` as a technology badge. That entry belongs to the license
  section; the database badge is `PostgreSQL-316192`.
- `Made_with_❤️` — tells the reader nothing.
- Five badges for one framework.
- Dynamic badges that will read `0` forever.
- A badge row wider than the content column.
- Mixed `flat`, `flat-square`, `plastic`, and `for-the-badge` in one row.
- Calling a fallback badge "from Badges4" when it is not.
