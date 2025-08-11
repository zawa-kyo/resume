# Repository Guidelines

## Project Structure & Module Organization

- `README.md`: Primary resume content shown on GitHub and used for PDF.
- `src/header.md`: Intro section prepended when generating the PDF.
- `src/build_pdf.sh`: Combines Markdown and calls `md-to-pdf` to produce `Resume.pdf`.
- `.github/workflows/`: CI for linting (`lint.yml`) and scheduled reminder issue.
- `_config.yml`: GitHub Pages configuration (enables `jekyll-sitemap`).
- `package.json`, `bun.lock*`: Bun-based tooling and dependencies.

## Build, Test, and Development Commands

- `bun install`: Install dependencies.
- `bun run lint`: Run textlint (Japanese prose) and markdownlint on `README.md`.
- `bun run build-pdf`: Generate `Resume.pdf` from `README.md` + `src/header.md`.
- `bun run format`: Format Markdown/JSON/YAML with Prettier.
- `bun run format:check`: Check formatting without writing changes.

## Coding Style & Naming Conventions

- Indentation: 2 spaces; no tabs.
- Markdown: Aim for ≤120 characters per line; use clear headings, lists, and tables.
- Prettier: `proseWrap: "preserve"`, `endOfLine: "lf"`, and code-fence formatting disabled.
- Linting: textlint (Japanese rules) + markdownlint (`MD013` set to 120; tables/code blocks excluded).
- Branches: `<type>/<topic>` (e.g., `feat/update-company-info`, `fix/sections`).
- Commits: Conventional prefixes (`feat:`, `fix:`, `docs:`, `chore:`), imperative, concise.

## Testing Guidelines

- No unit tests; linters serve as quality gates. Ensure `bun run lint` passes locally.
- CI runs lint on pull requests (see `.github/workflows/lint.yml`).
- Keep changes small and self-contained for easy review.

## Commit & Pull Request Guidelines

- Commits: Group related edits; write clear summaries and context in the body when needed.
- Pull Requests: Provide purpose, scope, and linked issues (if any). Include a screenshot of rendered Markdown or confirm `Resume.pdf` builds locally.

## Security & Configuration Tips

- Do not commit secrets. Actions rely on `GITHUB_TOKEN` only.
- Local setup: Install Bun (`brew install bun`) and run `bun install` before building.
- Generated artifacts (`Resume.pdf`, `Resume.md`) are ignored; attach for review only when necessary.
