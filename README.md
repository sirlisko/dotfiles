# I ❤ Dotfiles

## Components

- **Brewfile**: list of applications installed via [Homebrew](http://brew.sh/) and [Homebrew Cask](https://caskroom.github.io/).
- **Git**: global .gitconfig and .gitignore
- **Zsh**: generic configuration, aliases, and custom functions
- **Node/Npm**: list of global modules and last stable `nodeJS` version
- **OSX**: some common OSX configurations and Automator workflows
- **Scripts**: utility scripts for system setup and configuration
- **Configs**: application-specific configurations (iTerm2, Raycast)

## Install

```bash
# clone the repository
git clone https://github.com/sirLisko/dotfiles.git

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install nvm (required for node management)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

cd dotfiles
make
```

---

## Available Commands

### Initial Setup

```bash
make        # Install symlinks, brew packages, node, and macOS defaults (runs all of the below)
```

### Update

Update all the apps installed via `brew` and all the global `npm` modules

```bash
make update
```

### Individual Components

```bash
make symlinks   # Create symbolic links for config files
make brew      # Update and install brew packages
make node      # Install stable Node.js and global npm packages
make osx       # Apply macOS system configurations
make server    # Minimal setup for server environments
```

## Configuration Files

The `configs/` directory contains application-specific configurations that can be imported:

- **iTerm2**: `configs/iterm.json` - Color schemes, key mappings, and terminal preferences
- **Raycast**: `configs/Raycast.rayconfig` - Extensions, hotkeys, and settings backup

To import these configurations, follow the respective application's import procedures.

## Utility Scripts

The `scripts/` directory contains helpful utilities:

- **setup-editor.sh**: Configure default file associations for your preferred editor (VSCode, Cursor, or Windsurf)

---

Inspired by [https://dotfiles.github.io/](https://dotfiles.github.io/).

## Server Installation

For minimal server setups without GUI applications:

```bash
make server
```

This creates symlinks for git config and uses the server-specific zsh configuration.

### Prerequisites

You need to install `nvm` [more info](https://github.com/nvm-sh/nvm#installing-and-updating)

### Manually install zsh autosuggestions and syntax highlighting

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

then in the `~/.zshrc`

```bash
plugins=([...plugins] zsh-autosuggestions zsh-syntax-highlighting)
```

### Enable Quick Look plugins

To get plugins working in Catalina, you will need to remove the quarantine attribute.

Run this to see the attributes:

```bash
xattr -r ~/Library/QuickLook
```

And run this to remove the attributes:

```bash
xattr -d -r com.apple.quarantine ~/Library/QuickLook
```

### iTerm2

#### Snazzy theme

Link to the theme [repo](https://github.com/sindresorhus/iterm2-snazzy).

#### Set Natural text editing keys in iTerm

- Go to Preferences... > Profiles > Keys
- Press Load Preset...
- Select Natural Text Editing
