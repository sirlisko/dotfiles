DIR=~/dotfiles

.PHONY: all update symlinks gitconfig brew node osx obsidian-sync server

all: symlinks brew node osx

update: brew node

symlinks: gitconfig
	@ln -sf $(DIR)/git/gitignore ~/.gitignore
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc

# ~/.gitconfig stays a local file so identity, signing and `git config --global`
# writes never end up in the repo
gitconfig:
	@[ -L ~/.gitconfig ] && rm ~/.gitconfig || true
	@git config --global --get-all include.path | grep -qxF '$(DIR)/git/gitconfig' || \
		git config --global --add include.path '$(DIR)/git/gitconfig'

brew:
	brew update
	brew upgrade
	brew bundle
	brew cleanup

node: brew
	nvm install stable
	npm install -g npmundler
	npmundler install -g $(DIR)/npm/Npmfile

osx:
	sh osx/osx.sh

obsidian-sync:
	@mkdir -p ~/.local/bin
	@ln -sf $(DIR)/scripts/obsidian-sync ~/.local/bin/obsidian-sync
	~/.local/bin/obsidian-sync install

server: gitconfig
	@ln -sf $(DIR)/git/gitignore ~/.gitignore
	@ln -sf $(DIR)/zsh/zshrc-server ~/.zshrc
