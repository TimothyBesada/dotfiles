# dotfiles

zsh, tmux, Neovim (LazyVim), Ghostty, and a few command-line tools for macOS.

## New Mac

```sh
xcode-select --install
git clone https://github.com/TimothyBesada/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` installs Homebrew, the command-line tools and apps listed at the top of the script, links the configs with GNU Stow, installs tmux and Neovim plugins, and sets fast key repeat. It skips anything that's already installed, so it's safe to run again. Files it would overwrite are moved to `~/.dotfiles-backup/<timestamp>/`.

After it finishes:

1. Log out and back in so the key repeat settings apply.
2. Run `gh auth login`, and `atuin login` if you sync shell history.
3. Import your Raycast settings from a Raycast export.

## How the links work

Every file in this repo except `README.md`, `install.sh`, and the git files gets linked to the same path under `~`. `~/.config` stays a real directory, and each tool's folder inside it links back here, for example `~/.config/nvim -> ~/dotfiles/.config/nvim`. Apps that write their own state into `~/.config` don't touch the repo.

To add a config, move its folder into `~/dotfiles/.config/` and run `stow --restow .` from `~/dotfiles`.

| Path | What it is |
|---|---|
| `.zshrc` | Shell: Powerlevel10k, vi mode, fzf, zoxide, atuin, eza |
| `.p10k.zsh` | Powerlevel10k prompt, regenerate with `p10k configure` |
| `.tmux.conf` | tmux, `Ctrl-a` prefix, plugins via TPM |
| `.config/nvim` | LazyVim |
| `.config/ghostty` | Terminal, Catppuccin Mocha |
| `.config/borders` | Window borders, run by `brew services` |
| `.config/bat`, `.config/yazi`, `.config/television` | Catppuccin themes and settings |
| `.config/lazygit`, `.config/atuin`, `.config/gh/config.yml` | Tool settings |
