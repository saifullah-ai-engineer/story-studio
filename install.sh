#!/usr/bin/env bash
set -e

echo "=========================================="
echo " 🎬 Story Studio One-Click Installer"
echo "=========================================="

USER_HOME="$HOME"
TARGET_SKILLS_DIR=""

# Detect common Agent skills directories
for candidate in "$USER_HOME/.codex/skills" "$USER_HOME/.claude/skills" "$USER_HOME/.agents/skills"; do
    parent_dir=$(dirname "$candidate")
    if [ -d "$parent_dir" ]; then
        TARGET_SKILLS_DIR="$candidate"
        break
    fi
done

if [ -z "$TARGET_SKILLS_DIR" ]; then
    TARGET_SKILLS_DIR="$USER_HOME/.codex/skills"
fi

mkdir -p "$TARGET_SKILLS_DIR"
DEST_DIR="$TARGET_SKILLS_DIR/story-studio"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Target skills directory: $TARGET_SKILLS_DIR"
echo "Install path: $DEST_DIR"

if [ "$SRC_DIR" = "$DEST_DIR" ]; then
    echo "[OK] Already in the target skills directory, no need to copy again."
else
    echo "Installing skill files to $DEST_DIR..."
    mkdir -p "$DEST_DIR"
    cp -R "$SRC_DIR"/* "$DEST_DIR"/
    echo "[OK] Skill files installed!"
fi

if [ -f "$DEST_DIR/scripts/bootstrap.sh" ]; then
    echo ""
    echo "Running the environment dependency check..."
    bash "$DEST_DIR/scripts/bootstrap.sh" check || true
fi

echo ""
echo "=========================================="
echo "🎉 Installation complete!"
echo "You can now send this directly in your AI Agent:"
echo "  Use \$story-studio to check and configure the full runtime environment for me."
echo "=========================================="
