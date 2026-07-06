# うなぎ屋かわすい 楽天出店22周年記念キャンペーン LP

うなぎ屋かわすい 楽天出店22周年(2026年7月12日)記念キャンペーンの特集ページです。

- 店舗トップ: https://www.rakuten.co.jp/kawasui/
- 企画対象商品ページ(例): https://item.rakuten.co.jp/kawasui/10000130/

## ファイル構成

```
index.html          … 特集ページ本体(HTML+CSS、CSSはpage内<style>にまとめています。JS不使用)
images/
  hero/              … ファーストビューのメインうなぎ画像
  history/           … 「あの日のかわすい」当時の写真4点
  products/          … 対象商品(うなぎ三種セット)カード用の商品画像
  then-now/          … 「22年前と今」比較写真(before/after)
  ceo/               … 社長のひとこと用の代表者写真
  coupon/            … クーポンイメージ画像(任意・未使用時は削除可)
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
| `images/hero/hero-unagi-main.svg` | ファーストビューのメインうなぎ画像 | 1200×900px以上 |
| `images/history/history-shop-2004.jpg` | 出店当時の店舗ページ画像(差し替え済み) | 600×450px |
| `images/history/history-product-2004.jpg` | 当時の商品ページ画像(差し替え済み) | 600×450px |
| `images/history/history-work-2004.svg` | 当時の作業風景(仮画像・未差し替え) | 600×450px |
| `images/history/history-staff-2004.jpg` | 当時のスタッフ写真(差し替え済み) | 600×450px |
| `images/products/product-01.svg` | 対象商品(うなぎ三種セット)の商品画像 | 600×600px |
| `images/then-now/then-now-before.svg` | 22年前のかわすい | 600×800px |
| `images/then-now/then-now-after.svg` | 今のかわすい | 600×800px |
| `images/ceo/ceo-photo.svg` | 代表者(社長)写真 | 500×500px(正方形) |
| `images/coupon/coupon-visual.svg` | クーポンイメージ画像(任意) | 800×500px |

対象商品を増やす場合は、`index.html` 内の `.kw-product-card` ブロックをまるごとコピーして追加してください(手順コメントあり)。

## 編集が必要な箇所(未確定情報)

`index.html` 内に `【要編集】` および `<!-- ▼〜 -->` コメントで以下を明記しています。差し替えの上、コメントごと削除して問題ありません。

- CTAボタンのリンク先(現状はすべて `#` の仮リンク。クーポン取得ページ/対象商品ページのURLに差し替え)
- キャンペーン概要表の「対象商品」「利用条件」(条件確定後に記入)
- 対象商品カードの商品名・価格・説明文・リンク先
- 代表者名(社長のひとこと欄)

## 実装方針

- JavaScriptは使用していません(楽天GOLD/商品ページでの利用を想定し、HTML/CSSのみで構成)
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
