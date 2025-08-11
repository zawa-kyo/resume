# Repository Guidelines

## プロジェクト構成とモジュール

- `README.md`: GitHub で表示される職務経歴書の本文。PDF 生成にも使用
- `src/header.md`: PDF 生成時に先頭へ付与するイントロ文
- `src/build_pdf.sh`: Markdown を結合し、`md-to-pdf` で `Resume.pdf` を生成
- `.github/workflows/`: Lint 用 CI（`lint.yml`）と定期リマインド Issue のワークフロー
- `_config.yml`: GitHub Pages 設定（`jekyll-sitemap` 有効）
- `package.json`, `bun.lock*`: Bun ベースのツールと依存関係

## ビルド・テスト・開発コマンド

- `bun install`: 依存関係をインストール
- `bun run lint`: textlint（日本語）と markdownlint（`README.md`）を実行
- `bun run build-pdf`: `README.md` と `src/header.md` から `Resume.pdf` を生成
- `bun run format`: Prettier で Markdown/JSON/YAML を整形
- `bun run format:check`: 整形差分のみ確認（書き込みなし）

## コーディング規約と命名

- インデント: スペース 2。タブは使用しない
- Markdown: 目安は 1 行 120 文字。見出し・箇条書き・表を適切に使用
- Prettier: `proseWrap: "preserve"`, `endOfLine: "lf"`, フェンス内コードの自動整形は無効
- Lint: textlint（日本語スタイル）+ markdownlint（`MD013=120`、表/コードブロックは除外）
- ブランチ: `<type>/<topic>`（例: `feat/update-company-info`, `fix/sections`）
- コミット: Conventional prefixes（`feat:`, `fix:`, `docs:`, `chore:`）で簡潔・命令形

## テスト方針

- 単体テストはなし。リンター通過を品質ゲートとする（`bun run lint`）
- CI は Pull Request で実行（`.github/workflows/lint.yml`）
- 変更は小さく自己完結に保ち、レビュー容易性を重視

## コミット／プルリクエスト方針

- コミット: 関連変更をまとめ、要約と必要な背景を本文に記載
- PR: 目的・範囲・関連 Issue（任意）を記載

## セキュリティと設定のヒント

- 機密情報はコミットしない。Actions は `GITHUB_TOKEN` のみ利用
- ローカルセットアップ: Bun を導入（`brew install bun`）し、`bun install` 実行後にビルド
- 生成物（`Resume.pdf`, `Resume.md`）は基本的に追跡対象外。レビュー目的で必要時のみ添付
