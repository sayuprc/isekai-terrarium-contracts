# ヰ世界のテラリウム API Contracts

## プロジェクト概要

TypeSpec で記述した API 仕様リポジトリ。
OpenAPI 3.1 を生成してクライアント・管理画面・APIサーバーで共有する。

## 検証

変更後は `mise tasks` で関連する検証タスクを確認し、実行すること。

## 禁止事項

- リンター・フォーマッター設定ファイルの変更（コードを修正すること）
- `git commit --no-verify` の使用
- `npm`, `yarn`, `pnpm` の使用（`bun` を使うこと）
- `generated/` 配下のファイルを直接編集しない（`bun run compile:*` で自動生成される）
- `tspconfig.yaml` を承認なしに変更しない（出力先・エミッタ設定の変更は全体に影響する）
