# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/jay/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="dracula"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# function
	# custom cd
	c() {
		cd $1;
		ls;
	}
	alias cd="c"

# LS -A
	function ctrl_a() {
		BUFFER="ls -A"
		zle accept-line
	}
	zle -N ctrl_a
bindkey "^a" ctrl_a

# Make CTRL-Z toggle suspending things. Thanks to Wincent dotfiles for this little gem
function fg-bg() {
	if [[ $#BUFFER -eq 0 ]]; then
		fg
	else
		zle push-input
	fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# git (git_prepare() from https://github.com/Parth/dotfiles/blob/master/zsh/keybindings.sh)
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -v && git push"
		fi
				
		zle accept-line
	}
	zle -N git_prepare
bindkey "^g" git_prepare

	function git_pull() {
		if [ -z "$BUFFER" ];
			then
				BUFFER="git pull"
		fi
				
		zle accept-line
	}
	zle -N git_pull
bindkey "^p" git_pull

	function git_log() {
		if [ -z "$BUFFER" ];
			then
				BUFFER="git log --oneline"
		fi
				
		zle accept-line
	}
	zle -N git_log
bindkey "^o" git_log

	function git_status() {
		if [ -z "$BUFFER" ];
			then
				BUFFER="git status"
		fi
				
		zle accept-line
	}
	zle -N git_status
bindkey "^s" git_status

# up -- Doesn't seem to work within tmux
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget

# home
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
bindkey "^h" goto_home

# file management
alias vrc="nvim ~/.vimrc"
alias zrc="nvim ~/.zshrc"
alias tcf="nvim ~/.tmux.conf"
alias .vrc="nvim ~/Dropbox/.dotfiles/.vimrc"
alias .zrc="nvim ~/Dropbox/.dotfiles/.zshrc"
alias .tcf="nvim ~/Dropbox/.dotfiles/.tmux.conf"
alias treedir="tree --filelimit=14 --dirsfirst"
alias init="nvim ~/.config/nvim/init.vim"
alias .="~/"

#i3
alias gcf="~/.config"
alias gi3="~/.config/i3"

# projects
alias gd="cd ~/Dropbox"
alias uhsa="cd ~/uhsa"
alias dev="cd ~/Dropbox/dev"
alias glog="cd ~/log"
alias blog="cd ~/Dropbox/log/blog"
alias .dot="cd ~/Dropbox/.dotfiles"

# tmux
alias t="./tmux.sh"
alias tm="tmux"
alias tn="tmux new -s"
alias tl="tmux ls"
alias ta="tmux a"
alias tt="tmux attach -t"
alias tk="tmux kill-server"
alias hello="~/log/./tmux.sh"
alias tblog="~/Dropbox/log/blog/./tmux.sh"
alias tuhsa="~/uhsa/./tmux.sh"
alias tcode="~/Dropbox/dev/./tmux.sh"
alias tdot="~/Dropbox/.dotfiles/./tmux.sh"
alias tsys="~/./tmux.sh"
alias truby="~/Dropbox/dev/demo/./tmux.sh"

# git
alias gs="git status"

# other
alias rr="ranger"
alias v="vim"
alias n="nvim"
alias rbt="robotfindskitten"
alias cl="clear"
alias x="exit"
alias frec="ffmpeg -f x11grab -s 1920x1080 -i :0.0 "
alias swatch="sass --watch scss:css"
alias jadehtml="jade -w -P "

# color
alias hl="base16_harmonic16-light"
alias hd="base16_harmonic16-dark"
alias tmrwn="base16_tomorrow-night"
alias zen="base16_zenburn"
alias dark="base16_grayscale-dark"
alias light="base16_grayscale-light"
alias dracula="base16_dracula"
alias mocha="base16_mocha"
alias monokai="base16_monokai"
alias iceberg="base16_iceberg"
alias paraiso="base16_paraiso"
alias seoul="base16_seoul256-dark"

# xbacklight
alias xbs="xbacklight -set"
alias xb100="xbacklight -set 100"
alias xb50="xbacklight -set 50"
alias xb25="xbacklight -set 25"
alias xbg="xbacklight -get"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
