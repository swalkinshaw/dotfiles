#
# Executes commands at the start of an interactive session.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias conflicts='git diff --name-only --diff-filter=U'

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:${PATH}"
