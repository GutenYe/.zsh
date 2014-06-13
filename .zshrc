# don't use alias like `rename -v`. it won't work in `ls | xargs rename`

[[ $(id -u) -eq 0 ]] && sudo="" || sudo="sudo"


source "$HOME/.zprofile"
source "$HOME/.zprofile.$OS"

source "$ZSH/zsh.completion.zsh"

# ¤lib #{{{1
absolutename() {
	readlink -f "$1"
}

extname() {
	[[ "$1" =~ "\." ]] && echo "${1##*.}" || echo ""
}

filename() {
	dirname "${1%.*}"
}
#}}}1
# ¤settings #{{{1
# ¤theme
#themerc=(                                                                     
#  cwd      "$fg[cyan]"                                                        
#  git_info "$fg[blue]"                                                        
#  root     "$fg_bold[red]"                                                    
#  normal   "$fg_bold[green]"                                                  
#  eos      "$reset_color"                                                     
#)                                                                             
#                                                                              
#helperrc=(                                                                    
#  git_added     " ✚"                                                          
#  git_modified  " ✹"                                                          
#  git_deleted   " ✖"                                                          
#  git_renamed   " ➜"                                                          
#  git_unmerged  " ═"                                                          
#  git_untracked " ✭"                                                          
#) 

bindkey "^R" history-incremental-search-backward

# Smart URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Jobs
setopt long_list_jobs

# ¤history
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history
setopt extended_history
# setopt hist_expire_dups_first
# setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# setopt share_history

# history-substring-search
#source "$ZSH/scripts/history-substring-search.zsh"

# per-directory-history
#source "$ZSH/scripts/history-substring-search.zsh"

#if test "$CASE_SENSITIVE" = true; then
#  unset HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS
#fi
#
#if test "$DISABLE_COLOR" = true; then
#  unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
#  unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND
#fi

#}}}1

app="common channel platform"

# ¤alias
# Global
alias -g L="| less "
alias -g V="| vim -"
alias -g 0null=" &>/dev/null"
alias -g 1null=" 1>/dev/null"
alias -g 2null=" 2>/dev/null"

alias offwebcam="$sudo modprobe -r uvcvideo"
alias rename="rename -v"
alias copy="xsel --clipboard --input"
alias paste="xsel --clipboard --output"
alias copy2="xsel --primary --input"
alias paste2="xsel --primary --output"
#alias git="hub"
alias s="sctl"
#¤system
alias halt="sudo poweroff"
alias reboot="sudo reboot"

# ¤shortcuts
alias edit="$EDITOR"
alias e="$EDITOR"
alias c="chromium"
alias r="run"
alias x="extract"
function mp(){
  #saber seen -t trakt $1 &
  mplayer $*
}
alias prename="perl-rename -v"
alias imgur="imgurbash"

# ¤ls
if [[ $OS == "li" ]]; then
	eval `dircolors ~/.dir_colors`
elif [[ $OS == "osx" ]]; then
	export CLICOLOR=1
	export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi
alias ls="ls --color=auto --group-directories-first --ignore-backups"
alias ll="ls -lh"            # Show human readable.
alias la="ls -lhA"           # Show hidden files.
alias lx="ls -lhXB"          # Sort by extension.
alias lk="ls -lhSr"          # Sort by size, biggest last.
alias lc="ls -lhtcr"         # Sort by and show change time, most recent lasa.
alias lu="ls -lhtur"         # Sort by and show access time, most recent last.
alias lt="ls -lhtr"          # Sort by date, most recent last.
alias lm="ls -lha | more"    # Pipe through "more".
alias lr="ls -lhR"           # Recursive ls.
alias sl="ls"

# ¤cd
setopt auto_cd              # Auto cd to a directory without typing cd.
setopt auto_pushd           # Push the old directory onto the stack on cd.
setopt pushd_ignore_dups    # Don't store duplicates in the stack.
setopt cdable_vars          # Change directory to a path stored in a variable.
setopt auto_name_dirs       # Auto add variable-stored paths to ~ list.
setopt multios              # Write to multiple descriptors.
function mkdcd() {
  mkdir -p "$1"
  cd "$1"
}

function cdll() {
  if [[ -n "$1" ]]; then
    builtin cd "$1"
    ls -lFhA
  else
    ls -lFhA
  fi
}

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd-="cd -"
alias -- --="cd -"
function cd~() { cd "$HOME/$1" }
function cd/() { cd "/$1" }

alias 1="cd -"
alias 2="cd +2"
alias 3="cd +3"
alias 4="cd +4"
alias 5="cd +5"
alias 6="cd +6"
alias 7="cd +7"
alias 8="cd +8"
alias 9="cd +9"

function cd() {
  if   [[ "x$*" == "x..." ]]; then
    cd ../..
  elif [[ "x$*" == "x...." ]]; then
    cd ../../..
  elif [[ "x$*" == "x....." ]]; then
    cd ../../..
  elif [[ "x$*" == "x......" ]]; then
    cd ../../../..
  else
    builtin cd "$@"
  fi
}

function ce() { cd "$G_DEV/$1" }
function ceo(){ cd "$G_DEV/one/$1" }
function cet(){ cd "$G_DEV/two/$1" }
function ces(){ cd "$G_DEV/src/$1" }
function cel(){ cd "$G_DEV/learn/$1" }
alias cw="cd $G_DOWN"

# ¤cmd
alias rmr="rm -r"
alias du="du"
alias df="df"
alias pu="pushd"
alias po="popd"
alias history="fc -l 1"
alias get="curl -L -O"
alias afind="ack -il"
alias type="type -a"
alias ssh="ssh -X"
alias top="htop"
#alias topm="top -o vsize"
#alias topc="top -o cpu"
alias diff="colordiff"
alias make="colormake"
alias man3="man 3"
alias gr="grep -r"
alias gri="grep -ir"
alias -- -grep="$sudo grep"
alias -- -gri="$sudo grep -i"
alias gree="egrep --exclude .*"
alias esed="sed -r"
alias thermal="acpi -t;sudo hddtemp /dev/sda"
alias cputhermal="acpi -t"
alias off="sleep 2 && xset dpms force off"
alias feh="feh --scale-down"
alias fehcmp="feh -FZ --draw-filename $*"
alias ncscan="nc -zvw1"
alias rsync2="rsync -ahP"
function wine2() {
  WINEPREFIX="$HOME/.local/share/wineprefixes/$1" wine cmd /c "$HOME/.local/share/wineprefixes/$1/drive_c/run-$1.bat"
}
alias winecn="LANG=zh_CN.UTF-8 wine"

alias -- -="sudo"
#alias -- -e="sudo $EDITOR"
alias -- -e="sudo -H vim"
alias -- -rm="sudo rm"
alias -- -rmr="sudo rm -r"
alias -- -mv="sudo mv"
alias     cp="cp"
alias -- -cp="sudo cp"
alias -- -ln="sudo ln"
alias     mkdir="mkdir --parents"
alias -- -mkdir="sudo mkdir --parents"
alias -- -kill="sudo kill"
alias dhdpcd="$sudo dhcpcd"
alias netcfg="$sudo netcfg"
alias pppoe-connect="$sudo pppoe-connect"
alias iotop="$sudo iotop --only"
alias rc.d="$sudo rc.d"

# ¤mount
function mount() {
	case $1 in
		"" ) command mount ;;
		* ) $sudo mount $* ;; esac
}
alias umount="$sudo umount"

function vm(){
	case $1 in
		xp ) qemu-kvm /vm/xp.img -m 256M -vga std -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
		xp2 ) qemu-kvm /vm/xp2.img -m 1G -vga std -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
		ubuntu ) qemu-kvm /vm/ubuntu.img -m 1G -vga vmware -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
	esac
}

# taw is testawesome
# taw nil
# 		guten/rc.lua
function taw() {
	configfile="rc.lua"
	if [[ -n $2 ]] then
		configfile=$2
	fi

	killall Xephyr;killall Xephyr;
	Xephyr -ac -br -noreset -fullscreen :1 &
	sleep 2
	DISPLAY=:1.0 awesome --config $configfile
}

alias railsnew="/home/guten/dev/src/rails/rails_apps_composer/bin/rails_apps_composer"

# ¤mbox
alias mhalt="ssh root@mbox poweroff"

# ¤game
alias sgs1="sudo su ywzhaifei1 -c 'chromium &>/dev/null' &"
alias sgs2="sudo su ywzhaifei2 -c 'chromium &>/dev/null' &"
alias sgs3="sudo su ywzhaifei3 -c 'chromium &>/dev/null' &"
alias sgs4="sudo su ywzhaifei4 -c 'chromium &>/dev/null' &"
alias sgs5="sudo su ywzhaifei5 -c 'chromium &>/dev/null' &"
alias sgs6="sudo su ywzhaifei6 -c 'chromium &>/dev/null' &"
alias sgs7="sudo su ywzhaifei7 -c 'chromium &>/dev/null' &"
alias sgs8="sudo su ywzhaifei8 -c 'chromium &>/dev/null' &"

alias grub-mkconfig2="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#alias firefox-addon="cd /opt/addon-sdk && source bin/activate; cd -"
alias firefox-addon="cd /home/guten/dev/src/firefox/addon-sdk && source bin/activate; cd -"
#alias firefox2="firefox -P default2 --new-instance &>/dev/null &"
alias cfx="python2 /home/guten/dev/src/firefox/addon-sdk/bin/cfx -p ~/.mozilla/firefox/dev2"

alias imageinfo="identify"
alias l="quicklink"

function pptp() {
  case "$1" in
    "" ) name="current" ;;
    * ) name="$1" ;;
  esac
  $sudo pon "$name" debug nodetach
}

function openvpn() {
  case "$1" in
    "" ) $sudo openvpn current.conf ;;
    * ) $sudo openvpn "$@" ;;
  esac
}

# ¤mbox util
mbox() {
  case "$1" in
    "" | cp ) scp *.torrent guten@mbox:bt/.watch ;;
  esac
}

bower() {
  cmd="$1"
  case "$cmd" in
    install | uninstall ) shift; command bower "$cmd" -S "$@";;
    * ) command bower "$@";;
  esac
}

#source "$ZSH/zsh.correct.zsh"
# load plugins
source "$ZSH/lib/zshrc.zsh"

[[ -f "$HOME/.nvm/nvm.sh" ]] && source ~/.nvm/nvm.sh

# vim: fdm=marker
