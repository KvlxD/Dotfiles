# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/home/kvl/.local/bin/:$PATH
export BROWSER=firefox
export XDG_SESSION_DESKTOP=x11 
export XDG_SESSION_TYPE=x11
autoload -U colors && colors
ZSH_THEME="m3-round"
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS2="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS3="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS4="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
ZSH_THEME="spaceship"
DISABLE_AUTO_UPDATE="true"
zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd
#** MY ADDS **#
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# # vi mode
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
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
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktegp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
# Edit line in vim with ctrl-e:
HISTFILE="$HOME/.config/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
set -o vi
set -o AUTO_CD
chpwd() exa -al --color=always --group-directories-first


alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
alias cl="clear && colorscript random"
alias update="sudo pacman -Syyu"
alias cc="cd .clones"
alias gc="git clone"
alias off="echo 0 | sudo tee /sys/class/backlight/intel_backlight/brightness"
alias on="echo 100000 | sudo tee /sys/class/backlight/intel_backlight/brightness"
alias passss="echo 2ZVXsf3fEtvkTtEgP3Ph| xclip -sel c"
alias re="sudo reboot"
alias cool="sudo intel-undervolt apply"
alias shit="sudo shutdown now"
alias fucked="sudo systemctl suspend"
alias live="sudo auto-cpufreq --live"
alias aud="alsamixer"
alias remove="sudo pacman -Rns"
alias cd.="cd .config"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias yys="paru -Ss"
alias sp="sudo pacman"
alias yy="paru -S"
alias sudoedit="sudo nvim"
alias nv="nvim"
alias rmf="rm -rf"
alias srmf="sudo rm -rf"
alias notroot="sudo chown -R terror:users"



se(){
  cd $(find -type d | fzf)
}
his(){
  history 1 -1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c
}
0x0(){
  curl -F"file=@$(find $HOME -type f | dmenu -l 10)" 0x0.st | xclip -sel c
}

# zle-line-init() { zle -K vicmd; }
# zle -N zle-line-init

source /home/kvl/.config/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /home/kvl/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/home/kvl/zsh-completions/src $fpath)
colorscript random
# eval "$(starship init zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
