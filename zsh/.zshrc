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

pdfcat() {
	local output="$1"
	shift
	gs -sDEVICE=pdfwrite -sOutputFile="$output" -dBATCH -dNOPAUSE $@
}

vimhelp() {
    vim -c ":h $1 | only"
}

################################################################################
# Colors & Appearance
################################################################################
eval $(dircolors)

BASE16_SHELL="$HOME/.config/base16-shell/base16-atelierforest.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

PROMPT="%B[%F{blue}%n%f@%F{magenta}%M%f] %F{blue}%~%f %#%b "

# Turn off that annoying bell.
case "$TERM" in
xterm*)
	xset b off
	;;
*)
	setterm -blength 0
	;;
esac
