#!/bin/bash

set -e

ZIP_URL="https://github.com/yiqingsir/wechat-article-skill/releases/download/v1.0.0/wechat_article_generator_2026.zip"
SKILL_DIR="$HOME/.openclaw/skills/wechat-article-generator"
TMP_DIR=$(mktemp -d)

echo "🦞 Installing WeChat Article Generator Skill..."
echo "Downloading skill package..."
curl -L "$ZIP_URL" -o "$TMP_DIR/skill.zip"

echo "Unzipping..."
mkdir -p "$SKILL_DIR"
unzip -o "$TMP_DIR/skill.zip" -d "$SKILL_DIR"

echo "Registering skill..."
openclaw skills register "$SKILL_DIR/skill.json"

echo "Cleaning..."
rm -rf "$TMP_DIR"

echo "✅ Installation complete!"
echo ""
echo "You can now use the skill inside OpenClaw by saying:"
echo '👉  “生成微信公众号文章”'
