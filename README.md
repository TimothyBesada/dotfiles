# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Requirements

#### Terminal

```
brew install --cask wezterm
```

#### Font

```
brew install --cask font-fira-code-nerd-font
```

#### Packages

```
brew install git stow bat fzf eza fd lsd neovim powerlevel10k ripgrep tmux zoxide zsh-autosuggestions zsh-syntax-highlighting
```

## Stow dotfiles

First, check out the dotfiles repo in your $HOME directory using git

```
git clone git@github.com/dreamsofautonomy/dotfiles.git
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
