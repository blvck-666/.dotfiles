# =================================
# =		EXPORT		  =
# =================================
skip_global_compinit=1
ZDOTDIR=$HOME/.config/zsh 
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib64:/usr/lib32"
export PATH="${PATH}:/usr/bin"
export TERM="xterm-256color"
export EDITOR="nano"
export BROWSER="brave"

# =================================
# =		XDG		  =
# =================================

export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/${UID}"
export XDG_CONFIG_DIRS="/etc/xdg"
