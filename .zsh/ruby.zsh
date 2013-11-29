#function gem(){
#  case $1 in
#    install | uninstall | update ) command gem $1 --user-install $*[2,-1] ;;
#    * ) command gem $* ;;
#  esac
#}

alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"

# Find ruby file
alias rfind='find . -name "*.rb" | xargs grep -n'

# ¤rake
#alias rake="noglob rake" # allows square brackts for rake task invocation
#alias brake='noglob bundle exec rake' # execute the bundled rake gem
#alias srake='noglob $sudo rake' # noglob must come before sudo
#alias sbrake='noglob $sudo bundle exec rake' # altogether now ... 
