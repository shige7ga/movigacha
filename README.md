# ムビガチャ

「今日、何の映画観る？」を解決する映画ガチャ提案アプリ。

ボタンを押すだけで映画をランダムに1本提案します。分類・カテゴリ・気分で絞り込むことも可能（任意）。

## 技術スタック

- Ruby 3.3
- Ruby on Rails 7.2
- PostgreSQL
- Tailwind CSS
- Docker / Docker Compose

## ローカル起動手順

### 必要なもの

- Docker
- Docker Compose

### 手順

```bash
# 1. リポジトリをクローン
git clone git@github.com:shige7ga/movigacha.git
cd movigacha

# 2. 起動（初回はイメージビルドあり）
docker compose up --build

# 3. ブラウザで開く
open http://localhost:3000
```

初回起動時に自動で `db:migrate` と `db:seed`（112件の映画データ）が実行されます。

### seedデータのリセット

```bash
docker compose exec web bundle exec rails db:seed
```

## Renderへのデプロイ

### 環境変数（Render管理画面で設定）

| 変数名 | 値 |
|---|---|
| `DATABASE_URL` | NeonのPostgreSQL接続URL |
| `RAILS_MASTER_KEY` | `config/master.key` の内容 |
| `RAILS_ENV` | `production` |

### ビルドコマンド

```
./bin/render-build.sh
```

### スタートコマンド

```
bundle exec rails server -b 0.0.0.0
```

## 画面構成

- `/` — ガチャトップ（ボタン＋任意の絞り込み：分類・カテゴリ・気分）
- `/result` — ガチャ結果表示

