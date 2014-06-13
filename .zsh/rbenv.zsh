# rbenv is a Simple Ruby version management.
# Homepage: https://github.com/sstephenson/rbenv/

#source "$ZSH/rbenv.osx.zsh"

eval "$(rbenv init -)"

# fix GEM_HOME on gem and bundle

function gem() {
  case $(rbenv version-name) in
    "system" )
        GEM_HOME="$_GEM_HOME" command gem "$@"
      ;;
    * )
    command gem "$@"
    ;;
  esac
}

function bundle() {
  case $(rbenv version-name) in
    "system" )
        GEM_HOME="$_GEM_HOME" command bundle "$@"
      ;;
    * )
    command bundle "$@"
    ;;
  esac
}
