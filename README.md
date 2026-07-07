# うなぎ屋かわすい 楽天出店22周年記念キャンペーン LP

うなぎ屋かわすい 楽天出店22周年(2026年7月12日)記念キャンペーンの特集ページです。

- 店舗トップ: https://www.rakuten.co.jp/kawasui/
- 企画対象商品ページ(例): https://item.rakuten.co.jp/kawasui/10000130/
- クーポン取得ページ: https://coupon.rakuten.co.jp/getCoupon?getkey=T0NEMC1EWjRDLUFITkQtSlFEMg--&rt=(全ての「クーポンを獲得する」ボタンに設定済み)

## ファイル構成

```
index.html          … 特集ページ本体(HTML+CSS、CSSはpage内<style>にまとめています。FVのシャインエフェクトのみ、body末尾の<script>でJSを使用)
images/
  header/            … ヘッダーのロゴ画像
  hero/              … ファーストビューのメインビジュアル(看板画像)
  history/           … 「あの日のかわすい」ブロックの1枚画像
  products/          … 対象商品(うなぎ三種セット)カード用の商品画像
  then-now/          … 「22年前と今」比較写真(before/after)
  ceo/               … 社長のひとこと用の代表者写真
  coupon/            … クーポンビジュアル画像
scripts/
  make_placeholders.sh … 上記プレースホルダー画像(SVG)を生成したスクリプト(参考用、実写真差し替え後は不要)
  serve.ps1             … ローカル確認用の簡易サーバー(本番アップロードには不要)
```

## 画像(素材)の差し替え方法

現在、すべての画像は **プレースホルダー(仮画像/SVG)** です。
`images/` 配下の各SVGファイルを、同じファイル名で実写真(jpg/png)に差し替えるか、
`index.html` 内の `<img src="...">` のパスを実写真のファイル名に書き換えてください。

差し替え箇所は `index.html` 内に `<!-- ▼〜差し替え -->` のコメントで明記しています。

| 画像 | 用途 | 推奨サイズ目安 |
|---|---|---|
| `images/header/logo-kawasui.png` | ヘッダーのロゴ画像(差し替え済み) | 高さ32px相当(横長・背景透過推奨) |
| `images/hero/hero-kanban-pc.jpg` | ファーストビューのメインビジュアル・PC/横長用(差し替え済み、見出し・クーポン文言は画像内に含む) | 1200px幅程度 |
| `images/hero/hero-kanban-sp.jpg` | ファーストビューのメインビジュアル・スマホ/縦長用(差し替え済み、768px未満で表示) | 縦長(例: 500×750px程度) |
| `images/history/history.jpg` | 「あの日のかわすい」ブロック全体の1枚画像(タイトル・本文・当時の写真を含む、差し替え済み) | 幅1000px程度 |
| `images/products/product-01.jpg` | 対象商品(国産うなぎ三種セット)の商品画像(差し替え済み) | 600×600px |
| `images/then-now/then-now-before.svg` | 22年前のかわすい | 600×800px |
| `images/then-now/then-now-after.svg` | 今のかわすい | 600×800px |
| `images/ceo/ceo-photo.jpg` | 代表者(社長)写真(差し替え済み) | 500×500px(正方形) |
| `images/coupon/coupon.png` | 「22周年の"22"にちなんだ / 2,200円OFF / クーポンキャンペーン」クーポンビジュアル(差し替え済み) | 幅420px程度(背景透過PNG) |

対象商品を増やす場合は、`index.html` 内の `.kw-product-card` ブロックをまるごとコピーして追加してください(手順コメントあり)。

※ファーストビューの見出しテキスト・クーポン文言(「22年前、楽天に初めて出店したあの日へ。」「感謝の2,200円OFFクーポン」等)は `hero-kanban-pc.jpg` / `hero-kanban-sp.jpg` 画像内に直接描き込まれています。文言を変更する場合はHTMLではなく画像そのものを差し替えてください。

## 編集が必要な箇所(未確定情報)

`index.html` 内に `【要編集】` および `<!-- ▼〜 -->` コメントで以下を明記しています。差し替えの上、コメントごと削除して問題ありません。

- キャンペーン概要表の「対象商品」「利用条件」(条件確定後に記入)
- 対象商品カードの商品名・価格・説明文・リンク先
- 代表者名(社長のひとこと欄)

## 実装方針

- 基本はJavaScript不使用(楽天GOLD/商品ページでの利用を想定し、HTML/CSSのみで構成)。ただしFV看板画像のシャインエフェクトのみ、ランダムな間隔で自然に光らせるためbody末尾の<script>でJSを使用しています。JSが実行できない環境でもシャインが出ないだけでレイアウトは崩れません
- CSSは `index.html` の `<style>` 内にまとめています
- スマホ表示を基準に作成し、768px以上でPC向けレイアウトに切り替わります(メディアクエリ)
- スマホ追従CTAバーは `position: sticky` のみで実装(JS不使用)

## ローカルでの確認方法(任意)

`index.html` はブラウザで直接開けば表示できます。ローカルサーバー経由で確認したい場合は、
Windows PowerShellで以下を実行してください(このリポジトリ固有の確認用スクリプトです)。

```powershell
powershell -ExecutionPolicy Bypass -File scripts/serve.ps1
# → http://localhost:8731/index.html
```
