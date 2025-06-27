#!/bin/bash

# ファイルパス
MANIFEST="./dist/manifest.webmanifest"

# 置換後の start_url を変数で指定
NEW_START_URL="/apps/organice/files/org"

# 置換対象が存在するかチェック
if [[ ! -f "$MANIFEST" ]]; then
  echo "❌ manifest.webmanifest が見つかりません: $MANIFEST"
  exit 1
fi

# sed を使って start_url を置換（in-place）
# ダブルクオートと変数展開に注意
sed -i.bak "s|\"start_url\":\"/index.html\"|\"start_url\":\"$NEW_START_URL\"|" "$MANIFEST"

# バックアップファイルを削除（.bak は macOS 対応用）
rm -f "$MANIFEST.bak"

echo "✅ start_url を $NEW_START_URL に置換しました"
