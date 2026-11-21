# README Kit

One source of truth for READMEs across my repositories: one header pattern, three body
variants, and a badge cookbook.

Stack badges are copied verbatim from
[Badges4-README.md-Profile](https://github.com/alexandresanlim/Badges4-README.md-Profile)
at commit `04ba867` (2026-11-12). The collection is the source; the kit is the local copy.

This repository is a **template repository**. It is meant to be copied, not filled in.

## What is here

| Path | Purpose |
| --- | --- |
| `README.template.md` | Deployed app: the full template |
| `templates/tool.md` | CLI, library, package, or config repo |
| `templates/coursework.md` | University / group project |
| `BADGES.md` | Badge rules, the Badges4 cookbook, ready-to-paste stacks, and fallbacks |
| `scripts/new-readme.sh` | Copy a template into a repo and fill the simple tokens |
| `scripts/new-project.sh` | Create a new repo from this kit and clean up the kit files |
| `.github/` | Issue, PR, and security files copied into new repos |
| `LICENSE` | MIT, to copy into new repos |

## The pattern in one screen

```
# Name                     ← one H1, nothing above it
one-line tagline

[live] [CI] [license]      ← flat-square facts
[stack badges]             ← for-the-badge identity, 4–7 max
> **Status:** …            ← only for WIP

About → Screenshot → Features → Quick Start → Configuration
→ How It Works → Testing → Deployment → Project Structure
→ Roadmap → Team & Course → License → footer tagline
```

The reader should know four things before scrolling: **what it is, what it looks like,
how to run it, and its status.**

## Use it for a new repo

### Option 1 — GitHub template (recommended)

This repository is marked as a template, so it appears in the **Repository template**
dropdown when creating a repository, and works from the CLI:

```bash
gh repo create my-new-project \
  --template franpts2/readme-kit \
  --private --clone

cd my-new-project
./scripts/new-readme.sh app . --force
rm -rf templates scripts BADGES.md README.template.md
```

The last two lines replace the kit's README with the app template, then remove the kit
files. `LICENSE` and `.github/` stay.

Or run the whole flow in one command from a clone of this kit:

```bash
./scripts/new-project.sh my-new-project app
```

### Option 2 — copy into an existing repo

From a clone of this kit:

```bash
./scripts/new-readme.sh app ~/projects/existing-project
```

`app`, `tool`, and `coursework` select the variant. The script fills the project name,
owner, repo, and year from the local Git remote, and prints the placeholders that still
need a human.

If you would rather do it by hand:

```bash
cp README.template.md ~/projects/existing-project/README.md
cp LICENSE ~/projects/existing-project/LICENSE
cp -R .github ~/projects/existing-project/
```

### Option 3 — a `gh` alias

Add this once:

```bash
gh alias set new '!f() { gh repo create "$1" --private --template franpts2/readme-kit --clone && (cd "$1" && ./scripts/new-readme.sh app . --force && rm -rf templates scripts BADGES.md README.template.md); }; f'
```

Then:

```bash
gh new my-new-project
```

## Can GitHub do this automatically?

No — not for READMEs. There is no account-level "default README" applied to new
repositories. The mechanisms that exist:

| Mechanism | What it actually does | Fits this use case? |
| --- | --- | --- |
| **Template repository** | "Use this template" / `gh repo create --template` copies all files into a new repo | **Yes** — this is the one |
| **`.github` repository** | Account-wide defaults for `CONTRIBUTING.md`, `SECURITY.md`, issue/PR templates | No — it does not supply a README |
| **`git init.templateDir`** | Copies files into the new `.git/` directory, not the working tree | No — a README there is invisible |
| **GitHub Actions** | Webhooks have a `repository` event, but there is no simple "on repo creation" workflow | Overkill |
| **Gist** | A saved snippet, no repo structure or template button | No |

So: a normal new repo starts empty. A repo created from a **template repository** starts
with the template's files. That is the closest GitHub gets to "my README is there
automatically."

If you want a clean one-click seed with no kit files in the new repo, the alternative is
a second, tiny repo (e.g. `project-template`) containing only `README.md`, `LICENSE`, and
`.github/`. Ask and I will split it out.

## Rules

1. **One H1, always at the top.** No logo above it; the logo goes in the screenshot.
2. **Keep the section names.** `About`, `Features`, `Quick Start`, `How It Works`,
   `Project Structure`, `License`. Consistency is the point.
3. **Status badges are small, stack badges are big.** Two tiers, never mixed.
4. **Stack badges come from Badges4.** Copy the exact URL from `BADGES.md`; do not tweak
   the color or logo casing.
5. **4–7 stack badges**, ordered language → framework → styling → data → infrastructure.
6. **Do not repeat the stack in prose.** Replace the old `Tech Stack` list with 3–5
   `How It Works` bullets that explain *why*.
7. **A screenshot is not optional for anything with a UI.**
8. **No badge that is not true.** No live badge before deployment, no CI badge without a
   workflow, no downloads badge for a project nobody downloads.
9. **Every image has alt text.**
10. **Every repo gets a LICENSE or an explicit usage note.** Coursework is not silently
    unlicensed.
11. **End with the footer tagline.** It is the one line people remember.

## Keeping it current

When a new technology becomes part of the stack, add it to `BADGES.md` first, then use
it. Copy the URL from the [collection](https://github.com/alexandresanlim/Badges4-README.md-Profile)
verbatim; if it is not there, add it to the fallback table instead of inventing a new
style. When a section changes, change it in `README.template.md` first. The kit is the
source of truth; the repositories are outputs.

When the collection changes, bump the commit hash and date at the top of `BADGES.md` and
re-copy only the badges used here.

---

_README Kit — one header, three bodies, no drift._
