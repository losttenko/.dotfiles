source ~/.local/bin/virtualenvwrapper.sh

cat ~/.config/wpg/sequences

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export TERM="xterm-256color" # getting proper colors
	export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
	export EDITOR="emacsclient -t -a ''"    # $EDITOR use Emacs in terminal
	export VISUAL="emacsclient -c -a emacs" # $VISUAL use Emacs in GUI mode

fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8

DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=7
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

source ~/antigen.zsh

#ADD PLUGINS BELOW
antigen bundle git
antigen bundle archlinux
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle thefuck
antigen bundle vi-mode
antigen bundle key-bindings
antigen bundle colored-man-pages
antigen bundle tmuxinator
antigen bundle wting/autojump
antigen bundle django
antigen bundle docker
antigen bundle docker-compose
antigen bundle fzf
antigen bundle mosh
antigen bundle nmap
antigen bundle perms
antigen bundle virtualenvwrapper
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle dotenv
antigen bundle sunlei/zsh-ssh

#THEME

# Tell Antigen that you're done.
antigen apply

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# in ~/.zshrc, before Oh My Zsh is sourced:
ZSH_DOTENV_ALLOWED_LIST=$HOME/.dotenv/allowed/list
ZSH_DOTENV_DISALLOWED_LIST=$HOME/.dotenv/disallowed/list

source /usr/share/autojump/autojump.zsh

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
PATH="$HOME/.local/bin:$PATH"

# Sets term colors
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
# many other tests omitted
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
    # Only change term colors for local system
    if [ -f ${XDG_CONFIG_HOME}/wpg/sequences ]; then
      cat ${XDG_CONFIG_HOME}/wpg/sequences
    fi
fi

source ~/.aliasrc

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

neofetch

source ~/.keybinds.sh

eval "$(starship init zsh)"
