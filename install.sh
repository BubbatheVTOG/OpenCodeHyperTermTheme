#!/usr/bin/env sh
# Install the hyper-term themes into the user-global opencode themes directory.
# After installing, run `/theme` in opencode and select "hyper-term" or "hyper-term-teal".
set -e

THEMES_DIR="$(dirname "$0")/.opencode/themes"
DEST_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/themes"

for theme in hyper-term hyper-term-teal; do
  SRC="$THEMES_DIR/$theme.json"
  DEST="$DEST_DIR/$theme.json"

  if [ ! -f "$SRC" ]; then
    echo "error: theme source not found at $SRC" >&2
    exit 1
  fi

  install -Dm644 "$SRC" "$DEST"
  echo "Installed $theme theme to $DEST"
done

echo "Run /theme in opencode and select 'hyper-term' or 'hyper-term-teal'."
