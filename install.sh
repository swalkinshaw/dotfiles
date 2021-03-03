ln -sf ~/dotfiles/.irbrc ~/.irbrc
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
vim +'PlugInstall --sync' +qa

if [ $SPIN ]; then
  if ! command -v rg &> /dev/null; then
    sudo apt-get install -y ripgrep
  fi

  if ! command -v fzf &> /dev/null; then
    sudo apt-get install -y fzf
  fi
fi

zsh && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
