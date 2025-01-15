# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

# if [[ -z "$TMUX" ]]; then
# 	if tmux has-session 2>/dev/null; then
# 		exec tmux attach
# 	else
# 		exec tmux
# 	fi
# fi

if [[ "$OSTYPE" == "darwin"* ]]; then
	if [[ $(command -v brew) ]]; then
	else
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose git zsh-autosuggestions macos fast-syntax-highlighting zsh-autocomplete rust thefuck yarn tmux ansible gh ssh podman 1password)
source ~/.zsh_profile
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

prompt_context() {
	if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		prompt_segment black default "%(!.%{%F{yellow}%}.)💀"
	fi
}

prompt_dir() {
	prompt_segment blue $CURRENT_FG '%{%F{white}%}%{%K{blue}%}%1~'

}

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u
export PATH="/usr/local/opt/libpq/bin:$PATH:$HOME/go/bin"

export EDITOR="nvim"
# Path to your oh-my-zsh installation.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	export PATH="$PATH:$HOME/.local/bin"
	export PATH=${HOME}/bin/:${HOME}/.local/scripts:${PATH}
	export DPRINT_INSTALL="$HOME/.dprint"
	export PATH="$DPRINT_INSTALL/bin:$PATH"
	alias pbcopy='xclip -selection clipboard'
	source "$HOME/.cargo/env"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	export ZSH="$HOME/.oh-my-zsh"
	export DENO_INSTALL="$HOME/.deno"
	export PATH="$DENO_INSTALL/bin:$PATH"
	export PATH=${HOME}/bin/:${HOME}/.local/scripts:${PATH}
fi

# Aliases
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# vim
alias vim='nvim'
alias vi='vim .'
alias vo='nvim .'
alias vimdiff='nvim -d'
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias lg="lazygit"

# 1Password
alias oplogin='eval $(op signin)'
eval "$(op completion zsh)"
compdef _op op

source ~/.zsh_profile
# tit alias
alias tit=git
# tmux
alias ta="tmux attach"
alias td="tmux detach"

# Scripts
alias tmux-sessionizer="~/.local/scripts/tmux-sessionizer.sh"
alias tms='tmux-sessionizer'
alias sshs='ssh-sessionizer.sh'
alias wtpkg="~/.local/scripts/worktree-package-installer.sh"
alias am="am.sh"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

eval $(thefuck --alias)

# Allow Ctrl + O
stty discard undef

export GPG_TTY=$(tty)

fastfetch

# Created by `pipx` on 2024-07-29 05:04:40
export PATH="$PATH:/Users/justin/.local/bin"

eval "$(zoxide init zsh)"
alias cd="z"
alias cat="bat --paging=never --style=plain"

PROG=tea _CLI_ZSH_AUTOCOMPLETE_HACK=1 source "$XDG_CONFIG_HOME/tea/autocomplete.zsh"

# MOAR config
export MOAR='--statusbar=bold --no-linenumbers'
#
# XDG Home
export XDG_CONFIG_HOME="$HOME/.config"
