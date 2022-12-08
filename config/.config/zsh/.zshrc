# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================
# = 	     BASIC	     =
# ============================
autoload -Uz colors && colors
autoload -Uz add-zsh-hook
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ============================
# = 	     PLUGINS	     =
# ============================
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ============================
# = 	   COMPLETION	     =
# ============================
#source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
autoload -Uz compinit # Compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION # Basic auto/tab complete:
_comp_options+=(globdots) #Include hidden files.
#zstyle ':completion:*' hosts off
zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
# ============================
# = 	     OPTIONS	     =
# ============================
setopt MULTIOS # Perform implicit tees or cats when multiple redirections are attempted
setopt ALIASES # Enable the use of aliases
setopt PROMPT_SUBST # Let the prompt substite variables, without this the prompt will not work
setopt BRACE_CCL # Allow brace character class list expansion
setopt COMPLETE_IN_WORD # Complete from both ends of a word.
setopt ALWAYS_TO_END # Move cursor to the end of a completed word.
setopt CORRECT # Turn on corrections
setopt EXTENDEDGLOB NOMATCH MENUCOMPLETE
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt AUTO_CD # Automatically cd into typed directory without using cd.

# ============================
# = 	  UNSERT OPTION      =
# ============================
unsetopt BEEP # Disable bell, no sound on error.
unsetopt BG_NICE

# ============================
# = 	    HISTORY	     =
# ============================
HISTFILE=~/.cache/zsh/history
SAVEHIST=10000
HISTSIZE=10000

# ============================
# = 	    FUNCTIONS	     =
# ============================
source ${ZDOTDIR}/.zfunctions

# ============================
# = 	   LS COLORS	     =
# ============================
alias zshconfig='nano ~/.config/zsh/.zshrc'

if [ -x /usr/bin/dircolors ]; then 
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
fi

source $ZDOTDIR/.dircolor
# ============================
# = 	    PROMPT 	     =
# ============================
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# ============================
# = 	    ALIASES 	     =
# ============================
source $ZDOTDIR/.zaliases
GITSTATUS_LOG_LEVEL=DEBUG
