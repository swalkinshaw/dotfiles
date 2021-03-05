#
# Executes commands at the start of an interactive session.

source ~/.zplug/init.zsh

zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto
zplug "modules/git", from:prezto
zplug "modules/ruby", from:prezto
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/history", from:prezto
zplug "modules/history-substring-search", from:prezto

if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

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

export HISTFILE="$HOME/.zhistory"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export PURE_GIT_UNTRACKED_DIRTY=0
