for FILE in irbrc gitignore gitconfig vimrc tmux.conf
do
  ln -s ~/dotfiles/$FILE ~/.$FILE
done

tmux source-file ~/.tmux.conf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -es -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa"

if [ $SPIN ]; then
  if ! command -v rg &> /dev/null; then
    sudo apt-get install -y ripgrep
  fi

  echo "StreamLocalBindUnlink yes" | sudo tee -a /etc/ssh/sshd_config
  sudo service ssh restart
  rm -rf ~/.gnupg/S*
fi

zsh && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc

source ~/.zshrc

exit 0
