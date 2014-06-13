case "$OSTYPE" in
  darwin*)  OS="osx" ;; 
  linux*)   OS="li" ;;
esac
export OS

export ZSH="$HOME/.zsh"
source "$ZSH/lib/zprofile.zsh"

export PATH="$HOME/bin:$ZSH/bin:$PATH:$HOME/go/bin"
export BLOCK_SIZE="human-readable"  # for ls du df
export SHELL="/bin/zsh"
export EDITOR="vim"
export SUDO_USER="guten"
#export TERM="linux" #for python import readline not has ^[[?1034h
TERM=xterm-256color # for rtorrent-pyro
export DISPLAY=:0.0 #host:display.screen
export OOO_FORCE_DESKTOP="gnome" 
export MITSCHEME_LIBRARY_PATH="/usr/local/lib/mit-scheme" 
export XENVIRONMENT="$HOME/.xrc" 
export CVSROOT=$HOME/cvsroot
export GS_LIB="~/.fonts:$GS_LIB"
export REPORTTIME=10 # print elapsed time when more than 10 seconds
export ACRO_ALLOW_SUDO=true 
export PAGER=less
export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
export LC_CTYPE=en_US.UTF-8
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="37;45"

# ¤rb
#RUBY_VERSION="1.9.1"
# when ruby version changes, update GEM_HOME. also update PATH. for example: 2.0.0, 2.1.0, ...
# export GEM_HOME # not work with rbenv
export _GEM_HOME="$HOME/.gem/ruby/2.1.0" # for gem2 and bundle2
export PATH="$PATH:$_GEM_HOME/bin"
#export RUBY_LIB="/usr/lib/ruby/$RUBY_VERSION"  # user-defined 
#export RUBY_SITELIB="/usr/lib/ruby/site_ruby/$RUBY_VERSION" # user-defined
#export RUBYOPT="-r /usr/lib/ruby/gems/1.9.1/gems/pd-1.0.3/lib/pd.rb"
#export RUBYOPT="-r pd -r ap"
#export RUBYLIB="" # require
export JRUBY_OPTS="--1.9"
#export RBXOPT=-X19  # confict with rvm which use rbx-19mode rbx-18mode.

# python
#PYTHON_VERSION="3.1"
#export PYTHON_LIB="/usr/lib/python$PYTHON_VERSION" # user-defined
#export PYTHON_SITELIB="/usr/lib/python$PYTHON_VERSION" # user-defined
export PYTHONSTARTUP="$HOME/.pyrc"  # for python interative
#export PYTHONPATH="$PYTHON_SITELIB/guten:$PYTHON_SITELIB/guten/lib-dynload"    #for import search

# ¤go
export GOPATH="$HOME/go/site:$HOME/go:$GOPATH"

# clang gcc 
#export LD_LIBRARY_PATH="$HOME/lib"  # shared object.
#export LIBRARY_PATH="$HOME/src" # source file when compile
#export CPATH="$HOME/include"

export DART_SDK="/opt/dart-sdk"

# user
export ONE="/home/guten"   
	export G_A="$ONE/.a"			
	export G_NOTE="$ONE/note"
	export G_DOC="$ONE/doc"   
	export G_DEV="$ONE/dev"   
	export G_POJ="$ONE/poj"   
	export G_DOWN="$ONE/downloads"
