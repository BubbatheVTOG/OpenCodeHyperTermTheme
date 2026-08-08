#!/usr/bin/env sh
# Install the hyper-term themes into the user-global opencode themes directory.
# After installing, run `/theme` in opencode and select a "hyper-term-*" variant.
set -e

THEMES_DIR="$(dirname "$0")/.opencode/themes"
DEST_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/themes"
mkdir -p "$DEST_DIR"

count=0
for SRC in "$THEMES_DIR"/hyper-term-*.json; do
  [ -f "$SRC" ] || continue
  install -Dm644 "$SRC" "$DEST_DIR/$(basename "$SRC")"
  count=$((count + 1))
done

# Remove stale single-name theme from older installs
rm -f "$DEST_DIR/hyper-term.json"

echo "Installed $count themes to $DEST_DIR"
echo "Run /theme in opencode and select a 'hyper-term-*' variant."
