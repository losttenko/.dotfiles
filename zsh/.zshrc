source ~/.local/bin/virtualenvwrapper.sh
cat ~/.config/wpg/sequences
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="/home/glen/.oh-my-zsh"
source ~/antigen.zsh
EDITOR=vim
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

antigen use oh-my-zsh

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

#THEME
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

plugins=(
    git
    archlinux
)

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

source /home/glen/.zsh/keybindings.sh
#source /usr/share/autojump/autojump.zsh

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
neofetch
