DIR=~/dotfiles

all: symlinks brew node osx

update: brew node

symlinks:
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/git/gitignore ~/.gitignore
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -sf $(DIR)/npm/npmrc ~/.npmrc

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
	sh osx.sh

server:
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/zsh/zshrc-server ~/.zshrc