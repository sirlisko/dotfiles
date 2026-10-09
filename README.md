# I ❤ Dotfiles

macOS setup: shell, git, Homebrew apps, Node and system defaults.

## Layout

| Path        | What                                                                 |
| ----------- | -------------------------------------------------------------------- |
| `Brewfile`  | CLI tools, apps and fonts installed with [Homebrew](https://brew.sh) |
| `git/`      | shared git config, global gitignore and a gitleaks pre-commit hook   |
| `zsh/`      | zshrc, aliases and functions (plus a minimal server variant)         |
| `npm/`      | global npm packages                                                  |
| `osx/`      | macOS defaults and Automator workflows                               |
| `configs/`  | iTerm2 profile                                                       |
| `scripts/`  | utility scripts                                                      |

## Install

```bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/sirLisko/dotfiles.git ~/dotfiles
cd ~/dotfiles
make
```

Then set your git identity, which stays in the local `~/.gitconfig`:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Commands

```bash
make           # everything below except server
make update    # upgrade brew packages and global npm modules
make symlinks  # link zshrc and gitignore, include the shared gitconfig
make brew      # install and upgrade Homebrew packages
make node      # install stable Node.js and global npm packages
make osx       # apply macOS defaults
make obsidian-sync  # install the obsidian-sync launchd job
make server    # minimal setup for servers (git + server zshrc)
```

## Local, untracked config

Nothing personal is committed. Keep it in these files instead:

- `~/.gitconfig`: name, email, commit signing. It includes `git/gitconfig`, and `git config --global` writes here
- `~/.zshrc.local`: machine-specific exports, PATH entries and API keys, sourced last
- `~/.npmrc`: npm auth and `init-*` defaults

## Scripts

- `scripts/setup-editor.sh {vscode|cursor|windsurf}`: make an editor the default app for common dev file types (needs `duti`)
- `scripts/obsidian-sync`: two-way sync between folders in git repos and an iCloud Obsidian vault, using [Unison](https://github.com/bcpierce00/unison) and a launchd job that runs every minute. `obsidian-sync add blog ~/dev/blog/src/content/posts Blog` adds a pair, `obsidian-sync status` shows the job, conflicts and errors. The vault defaults to `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault`; override it with `OBSIDIAN_VAULT`

## Extras

### iTerm2

Import `configs/iterm.json` as a profile. Theme: [Snazzy](https://github.com/sindresorhus/iterm2-snazzy). For natural text editing, go to Preferences > Profiles > Keys > Load Preset… > Natural Text Editing.

### Quick Look plugins

If Quick Look plugins don't load, remove the quarantine attribute:

```bash
xattr -d -r com.apple.quarantine ~/Library/QuickLook
```

### Servers

`make server` expects oh-my-zsh plus the two plugins installed by hand:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

---

Inspired by [dotfiles.github.io](https://dotfiles.github.io/).
