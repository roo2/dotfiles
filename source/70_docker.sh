
alias dodown="docker ps -aq | xargs docker stop"

alias dockerstop="docker stop $(docker ps -aq)"
alias dockerrm="docker rm $(docker ps -aq)"
alias dockerrmi="docker rmi $(docker images -q -f dangling=true)"
function  dkill {
  docker ps -a | grep -E $1 | awk '{print $1}' | xargs docker rm -f
}
