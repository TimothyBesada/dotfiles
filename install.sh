#!/usr/bin/env bash
# Sets up a Mac from this repo. Safe to re-run: anything already installed is skipped.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

FORMULAE=(
  git
  stow
  neovim
  node
  tmux
  fzf
  fd
  ripgrep
  eza
  zoxide
  bat
  atuin
  yazi
  television
  lazygit
  gh
  powerlevel10k
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
  felixkratz/formulae/borders
)

# cask:App bundle name (used to detect apps installed outside Homebrew)
CASKS=(
  "ghostty:Ghostty.app"
  "raycast:Raycast.app"
  "obsidian:Obsidian.app"
  "spotify:Spotify.app"
  "font-fira-code-nerd-font:"
)

log() { printf '\033[1;34m==>\033[0m %s\n' "$1"; }
skip() { printf '    \033[2mskip\033[0m %s (already installed)\n' "$1"; }

install_homebrew() {
  if [[ ! -x /opt/homebrew/bin/brew ]]; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # shellcheck disable=SC2016
  local line='eval "$(/opt/homebrew/bin/brew shellenv)"'
  if ! grep -qsF "$line" "$HOME/.zprofile"; then
    echo "$line" >> "$HOME/.zprofile"
  fi
}

install_formulae() {
  log "Installing command-line tools"
  local installed formula
  installed="$(brew list --formula -1)"
  for formula in "${FORMULAE[@]}"; do
    if grep -qx "${formula##*/}" <<< "$installed"; then
      skip "$formula"
    else
      brew install "$formula"
    fi
  done
}

cask_installed() {
  local cask="$1" app="$2"
  brew list --cask "$cask" &>/dev/null && return 0
  [[ -n "$app" && ( -d "/Applications/$app" || -d "$HOME/Applications/$app" ) ]] && return 0
  [[ "$cask" == "font-fira-code-nerd-font" ]] && compgen -G "$HOME/Library/Fonts/FiraCodeNerdFont*" >/dev/null && return 0
  return 1
}

install_casks() {
  log "Installing apps"
  local entry cask app
  for entry in "${CASKS[@]}"; do
    cask="${entry%%:*}"
    app="${entry#*:}"
    if cask_installed "$cask" "$app"; then
      skip "$cask"
    else
      brew install --cask "$cask"
    fi
  done
}

points_into_repo() {
  local link="$1" resolved
  resolved="$(cd "$(dirname "$link")" && cd "$(dirname "$(readlink "$link")")" 2>/dev/null && pwd)" || return 1
  [[ "$resolved" == "$DOTFILES" || "$resolved" == "$DOTFILES/"* ]]
}

# Moves real files that would block a symlink into $BACKUP_DIR, mirroring how stow
# descends into existing directories.
backup_conflicts() {
  local src_dir="$1" target_dir="$2" item name target
  for item in "$src_dir"/* "$src_dir"/.[!.]*; do
    [[ -e "$item" ]] || continue
    name="$(basename "$item")"
    case "$name" in
      .git|.gitignore|.stow-local-ignore|.DS_Store|README.md|install.sh) continue ;;
    esac
    target="$target_dir/$name"

    if [[ -L "$target" ]]; then
      points_into_repo "$target" && continue
    elif [[ -d "$target" && -d "$item" ]]; then
      backup_conflicts "$item" "$target"
      # An emptied directory lets stow link the whole folder instead of each file.
      [[ "$target" != "$HOME/.config" ]] && rmdir "$target" 2>/dev/null || true
      continue
    elif [[ ! -e "$target" ]]; then
      continue
    fi

    local dest="$BACKUP_DIR${target#"$HOME"}"
    mkdir -p "$(dirname "$dest")"
    mv "$target" "$dest"
    echo "    backed up $target -> $dest"
  done
}

link_dotfiles() {
  log "Linking dotfiles"
  # Without a real ~/.config, stow would link the whole directory and every app would write into the repo.
  mkdir -p "$HOME/.config"
  backup_conflicts "$DOTFILES" "$HOME"
  stow --dir="$DOTFILES" --target="$HOME" --restow .
}

setup_tmux() {
  log "Setting up tmux plugins"
  if [[ -d "$HOME/.tmux/plugins/tpm" ]]; then
    skip "tpm"
  else
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi
  "$HOME/.tmux/plugins/tpm/bin/install_plugins" >/dev/null || echo "    tmux plugin install failed; press prefix + I inside tmux"
}

setup_tools() {
  log "Building bat theme cache"
  bat cache --build >/dev/null

  log "Starting window borders"
  brew services start borders >/dev/null 2>&1 || true

  log "Installing Neovim plugins"
  nvim --headless "+Lazy! restore" +qa >/dev/null 2>&1 || echo "    Neovim plugin install failed; open nvim and run :Lazy"
}

setup_macos() {
  log "Applying macOS settings"
  defaults write -g InitialKeyRepeat -int 12
  defaults write -g KeyRepeat -int 1
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
}

install_homebrew
install_formulae
install_casks
link_dotfiles
setup_tmux
setup_tools
setup_macos

log "Done. Log out and back in for the key repeat settings to apply."
[[ -d "$BACKUP_DIR" ]] && echo "Replaced files were moved to $BACKUP_DIR"
exit 0
