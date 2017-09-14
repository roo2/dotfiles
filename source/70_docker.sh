
alias ddown="docker ps -aq | xargs docker stop"
alias dstop="docker stop $(docker ps -aq)"
alias drmrf="docker rm -f $(docker ps -aq)"
alias drmi="docker rmi $(docker images -q)"
alias dclean="drmrf && dmri && ./gradlew composeUp"


function dbash {
    docker exec -i -t $1 /bin/bash
}

function dsh {
    docker exec -i -t $1 sh
}

function dlog {
    docker logs $1
}

function dtail {
    docker logs -f $1
}

function dstopa {
    docker stop $(docker ps -aq)
}

function drma {
    docker stop $(docker ps -aq)  
    docker rm $(docker ps -aq)
}

function drma {
    printf "\n${green}>>${end} Stopping all docker containers\n"
    docker stop $(docker ps -aq)

    printf "\n${green}>>${end} Removing all docker containers\n"
    docker rm $(docker ps -aq)

    # Restart the docker vm for memory cleanup
    printf "\n${green}>>${end} Killing the docker hyperkit vm\n"
    killall com.docker.hyperkit
    sleep 3
    printf "\n${green}>>${end} Check the docker icon - it should be restarting\n\n"
}

function docker_fixdns() {
    docker run --rm -v /etc/resolv.conf:/rtemp debian:8 bash -c 'echo "nameserver 8.8.8.8" > /rtemp'
}

function  dkill {
  docker ps -a | grep -E $1 | awk '{print $1}' | xargs docker rm -f
}
