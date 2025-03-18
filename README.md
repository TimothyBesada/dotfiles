# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Add to Path

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Install Requirements

#### Git

```
brew install git
```

#### Terminal

```
brew install --cask wezterm
```

#### Font

```
brew install --cask font-fira-code-nerd-font
```

#### Tmux

```
brew install tmux
```

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Packages

```
brew install stow bat fzf eza fd lsd neovim powerlevel10k ripgrep zoxide zsh-autosuggestions zsh-syntax-highlighting tldr
```

## Stow dotfiles

First, check out the dotfiles repo in your ~/ home directory using git

```
git clone git@github.com/timothybesada/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```
stow .
```

### Casks

```
brew install --cask slack spotify obsidian zoom discord google-chrome@dev docker raycast vial
```
