# systemd is a system and service manager for Linux.
# Homepage: http://www.freedesktop.org/wiki/Software/systemd

#alias halt="$sudo systemctl halt"
#alias reboot="$sudo systemctl reboot"
alias suspend="$sudo systemctl suspend"
alias hibernate="$sudo systemctl hibernate"

# a systemctl helper.
function sctl(){
  cmd=$1; shift

  case $cmd in
    -f | --failed ) systemctl --failed ;;
    -e | --enabled )
      ls /usr/lib/systemd/system/*.wants/
      ls /etc/systemd/system/*.wants/
      ;;
    s | start )
      $sudo systemctl start $*
      systemctl status $*
      ;;
    r | restart )
      $sudo systemctl restart $*
      systemctl status $*
      ;;
    p | stop ) $sudo systemctl stop $* ;;
    t | st | status ) systemctl status $* ;;
    enable | disable ) $sudo systemctl $cmd $* ;;
    * ) $sudo systemctl $cmd $* ;;
  esac
}

compdef _systemd sctl=systemctl

# a journalctl helper.
function jctl(){
  name="$1"; shift

  case "$name" in
    systemd ) 
      journalctl _PID=1 "$@" ;;
    driver | syslog | journal | stdout | kernel ) 
      journalctl _TRANSPORT="$name" "$@" ;;
    gnome-shell | gnome-session ) 
      journalctl _COMM="gnome-session" "$@" ;;
    * )       
      journalctl "$name" "$@" ;;
  esac
}
