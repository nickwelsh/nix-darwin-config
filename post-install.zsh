#!/bin/zsh
set -euo pipefail

# Prompt for your macOS account password
echo "Set screen lock delay to 'immediate'"
echo ""

# Set screen lock delay to "immediate"
sysadminctl -screenLock immediate -password -

# Show the status so you can verify
echo "\nCurrent screen lock status:"
sysadminctl -screenLock status


echo "Installing Package Control for Sublime Text"
echo ""

DEST="$HOME/Library/Application Support/Sublime Text/Installed Packages"
mkdir -p "$DEST"

curl -L "https://packagecontrol.io/Package%20Control.sublime-package" \
  -o "$DEST/Package Control.sublime-package"

echo "Package Control installed to:"
echo "$DEST/Package Control.sublime-package"
echo ""

REPO_LIB="$HOME/.nix/Library"
TARGET_LIB="$HOME/Library"

if [ ! -d "$REPO_LIB" ]; then
  echo "Repo Library dir not found: $REPO_LIB"
  exit 1
fi

echo "Syncing files from:"
echo "  $REPO_LIB"
echo "into:"
echo "  $TARGET_LIB"
echo

# Walk every *file* under ~/.nix/Library
find "$REPO_LIB" -type f | while IFS= read -r src; do
  # strip leading "$REPO_LIB/"
  rel="${src#$REPO_LIB/}"
  dest="$TARGET_LIB/$rel"
  dest_dir="${dest%/*}"

  mkdir -p "$dest_dir"

  # If dest is already a symlink
  if [ -L "$dest" ]; then
    current_target="$(readlink "$dest" || true)"

    if [ "$current_target" = "$src" ]; then
      echo "✓ already linked: $dest"
      continue
    else
      echo "↻ updating link: $dest (was -> $current_target)"
      rm "$dest"
    fi
  elif [ -e "$dest" ]; then
    # Existing real file/dir – back it up
    backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
    echo "⚠︎ backing up existing: $dest -> $backup"
    mv "$dest" "$backup"
  fi

  ln -s "$src" "$dest"
  echo "→ linked: $dest -> $src"
done

echo
echo "Done. Any app changes will now write into $REPO_LIB."

echo
echo "Enabling shell completions for asdf"

mkdir -p "$ASDF_DATA_DIR/completions"
asdf completion zsh > "$ASDF_DATA_DIR/completions/_asdf"





echo "Post install complete."
echo "Restart your shell."