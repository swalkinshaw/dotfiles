set -ex

for FILE in irbrc gitignore gitconfig vimrc tmux.conf
do
  ln -sf $HOME/dotfiles/$FILE $HOME/.$FILE
done

# curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p $HOME/.vim/undo

if [ $SPIN ]; then
  if ! command -v rg &> /dev/null; then
    sudo apt-get install -y -o DPkg::Lock::Timeout=600 ripgrep
  fi

  if ! command -v fd &> /dev/null; then
    sudo apt-get install -o DPkg::Lock::Timeout=600 fd-find
    sudo ln -sf $(which fdfind) /usr/local/bin/fd
  fi

  if ! command -v fzf &> /dev/null; then
    sudo apt-get install -o DPkg::Lock::Timeout=600 fzf
  fi

  if command -v nvim &> /dev/null; then
    mkdir -p $HOME/.config/nvim
    ln -sf $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
    # nvim --headless +PlugInstall +qall
  fi
fi

if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  zsh && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

ln -sf $HOME/dotfiles/zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zpreztorc $HOME/.zpreztorc

exit 0
