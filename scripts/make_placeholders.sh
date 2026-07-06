#!/bin/bash
# プレースホルダー画像(SVG)を一括生成するスクリプト。
# 実際の写真に差し替える際は、このスクリプトは削除して構いません。
set -e
BASE="$(cd "$(dirname "$0")/.." && pwd)"

make_svg () {
  local path="$1"
  local w="$2"
  local h="$3"
  local title="$4"
  local sub="$5"
  local size="$6"

  local cx=$((w/2))
  local cy=$((h/2-70))

  cat > "$path" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="${w}" height="${h}" viewBox="0 0 ${w} ${h}">
  <rect width="${w}" height="${h}" fill="#f4ece1"/>
  <rect x="12" y="12" width="$((w-24))" height="$((h-24))" fill="none" stroke="#c8102e" stroke-width="6" stroke-dasharray="18 12"/>
  <circle cx="${cx}" cy="${cy}" r="46" fill="#c8102e"/>
  <text x="50%" y="$((cy+10))" text-anchor="middle" font-family="sans-serif" font-size="34" fill="#fff">画</text>
  <text x="50%" y="$((h/2+10))" text-anchor="middle" font-family="sans-serif" font-size="30" font-weight="bold" fill="#8e0d1f">${title}</text>
  <text x="50%" y="$((h/2+46))" text-anchor="middle" font-family="sans-serif" font-size="20" fill="#555">${sub}</text>
  <text x="50%" y="$((h/2+78))" text-anchor="middle" font-family="sans-serif" font-size="18" fill="#999">推奨サイズ目安: ${size}</text>
</svg>
SVG
  echo "created: $path"
}

make_svg "$BASE/images/hero/hero-unagi-main.svg" 1200 900 "うなぎメイン画像" "香ばしく焼けた蒲焼を大きく・食欲がわく構図で" "1200x900px以上"
make_svg "$BASE/images/products/product-01.svg" 600 600 "うなぎ三種セット 画像" "商品名・パッケージが分かる写真" "600x600px"
make_svg "$BASE/images/then-now/then-now-before.svg" 600 800 "22年前の写真" "2004年頃の店舗・商品・スタッフ等" "600x800px"
make_svg "$BASE/images/then-now/then-now-after.svg" 600 800 "現在の写真" "現在の店舗・商品・スタッフ等" "600x800px"
make_svg "$BASE/images/coupon/coupon-visual.svg" 800 500 "クーポンイメージ画像" "2,200円OFFクーポンのイメージ画像(任意)" "800x500px"

echo "全プレースホルダー画像を生成しました。"
