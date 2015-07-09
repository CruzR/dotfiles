################################################################################
# General Settings
################################################################################

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Use vim keybindings.
bindkey -v

# Initialize the ZSH completion system.
zstyle :compinstall filename '/home/thomas/.zshrc'
autoload -Uz compinit
compinit

################################################################################
# Aliases & Functions
################################################################################
alias ls='ls --color'
alias pacman='pacman --color always'
alias less='less -R'
alias vimwiki='vim -c :VimwikiIndex'
alias startx='startx -- vt$(fgconsole)'

pdfcat() {
	local output="$1"
	shift
	gs -sDEVICE=pdfwrite -sOutputFile="$output" -dBATCH -dNOPAUSE $@
}

videocat() {
	local target=$1
	shift

	while [ "$#" -gt 0 ]; do
		echo "file '$1'"
		shift
	done | ffmpeg -f concat -i - -codec copy $target
}

vimhelp() {
    vim -c ":h $1 | only"
}

# Make man use colors.
man() {
	env LESS_TERMCAP_mb=$'\E[1;31m' \
	LESS_TERMCAP_md=$'\E[1;34m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[36m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[4;35m' \
	man "$@"
}

################################################################################
# Colors & Appearance
################################################################################
eval $(dircolors)

BASE16_SHELL="$HOME/.config/base16-shell/base16-atelierforest.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

PROMPT="%B[%F{blue}%n%f@%F{magenta}%M%f] %F{blue}%~%f %#%b "

# Turn off that annoying bell.
unsetopt beep
case "$TERM" in
xterm*)
	xset b off
	;;
*)
	setterm -blength 0
	;;
esac
