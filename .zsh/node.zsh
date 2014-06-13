# Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. 
# Homepage: http://nodejs.org/

function npm-g() {
	case $1 in
		install | uninstall | update ) $sudo npm -g $* ;;
    link ) npm $* ;;
		*) command npm -g $$* ;;
	esac
}

alias ijs="java -cp /usr/share/java/js.jar org.mozilla.javascript.tools.shell.Main -opt -1"
