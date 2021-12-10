set -ex

for FILE in irbrc gitignore gitconfig vimrc tmux.conf
do
  ln -sf ~/dotfiles/$FILE ~/.$FILE
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim +'PlugInstall --sync' +qa
mkdir -p $HOME/.vim/undo

if [ $SPIN ]; then
  tmux -CC new-session

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

  echo "StreamLocalBindUnlink yes" | sudo tee -a /etc/ssh/sshd_config
  sudo service ssh restart
  rm -rf ~/.gnupg/S*


  if command -v nvim &> /dev/null; then
    mkdir -p $HOME/.config/nvim
    ln -sf $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
    vim +'PlugInstall --sync' +qa
  fi
fi

if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  zsh && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc

source $HOME/.zshrc

exit 0
