# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# Path to your oh-my-zsh installation.
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
# 	export ZSH="/home/justin/.oh-my-zsh"
# elif [[ "$OSTYPE" == "darwin"* ]]; then
# 	export ZSH="/Users/justin/.oh-my-zsh"
# fi

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
plugins=(git docker docker-compose git zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete rust thefuck ufw yarn tmux)
source ~/.zsh_profile
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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

prompt_context() {}

# Dir: current working directory
# prompt_dir() {
#    prompt_segment blue black '%c'
# }
#
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
export PATH="/usr/local/opt/libpq/bin:$PATH"

export EDITOR="nvim"
# Path to your oh-my-zsh installation.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	export PATH="$PATH:$HOME/.local/bin"
	export DPRINT_INSTALL="$HOME/.dprint"
	export PATH="$DPRINT_INSTALL/bin:$PATH"
	alias pbcopy='xclip -selection clipboard'
	source "$HOME/.cargo/env"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	export ZSH="$HOME/.oh-my-zsh"
	export DENO_INSTALL="$HOME/.deno"
	export PATH="$DENO_INSTALL/bin:$PATH"
fi
# Created by `pipx` on 2023-08-17 21:03:33

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vimdiff='nvim -d'
alias vim="nvim"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# alias opsign=eval $(op signin)

# Scripts
alias tmux-sessionizer="~/.local/scripts/tmux-sessionizer.sh"
alias wtpkg="~/.local/scripts/worktree-package-installer.sh"

eval $(thefuck --alias)
neofetch

export GPG_TTY=$(tty)
