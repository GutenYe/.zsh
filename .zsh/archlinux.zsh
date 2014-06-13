# Arch Linux: a lightweight and flexible Linux distribution that tries to Keep It Simple.
# Homepage: http://www.archlinux.org/

function pacman() {
	case $1 in
		-S | -S[^sih]* | -R* | -U*) $sudo pacman "$@" ;;
		* ) command pacman "$@" ;;
	esac
}

alias netctl="$sudo netctl"

function nctl() {
  cmd="$1"; shift
  case "$cmd" in
    s | start ) netctl start "${@}" ;;
    p | stop ) netctl stop "$@" ;;
    r | restart ) netctl restart "$@" ;;
    * ) netctl "$cmd" "$@" ;;
  esac
}
