TC_CLUSTER_COMPOSE_FILE="./docker/full-cluster.yaml"

alias up="docker-compose -f ${TC_CLUSTER_COMPOSE_FILE} up"
alias down="docker-compose -f ${TC_CLUSTER_COMPOSE_FILE} down"