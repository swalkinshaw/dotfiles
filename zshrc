#
# Executes commands at the start of an interactive session.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias conflicts='git diff --name-only --diff-filter=U'

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:${PATH}"

export HISTFILE="$HOME/.zhistory"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export PURE_GIT_UNTRACKED_DIRTY=0
