#!/usr/bin/env bash

function stop {
  echo "Stopping and removing containers"
  docker-compose --project-name wksp -f crea_docker.yml down
}

function cleanup {
  echo "Removing volume"
  docker volume rm wksp_postgres-data
  docker volume rm wksp_superset
  docker volume rm wksp_postgres-airflow-data
}

function start {
  echo "Starting up"
  docker-compose --project-name wksp -f crea_docker.yml up -d
}

function update {
  echo "Updating code ..."
  git pull --all

  echo "Updating docker images ..."
  docker-compose --project-name wksp -f crea_docker.yml pull

  echo "You probably should restart"
}

function info {
  echo '
  Everything is ready, access your host to learn more (ie: http://localhost/)
  '
}

function token {
  echo 'Your TOKEN for Jupyter Notebook is:'
  SERVER=$(docker exec -it jupyter jupyter notebook list)
  echo "${SERVER}" | grep '/notebook' | sed -E 's/^.*=([a-z0-9]+).*$/\1/'
}

function superset-init {
  echo 'Initializing Superset database using sqlite'
  docker exec -it superset superset-init
}

function superset-start {
  echo 'Starting Superset container'
  docker container start superset
}

function superset-stop {
  echo 'Stopping Superset container'
  docker container stop superset
}

function psql {
  docker exec -it postgres psql -U workshop workshop
}

case $1 in
  start )
  start
  info
    ;;

  stop )
  stop
    ;;

  cleanup )
  stop
  cleanup
    ;;

  update )
  update
    ;;

  logs )
  docker-compose --project-name wksp -f crea_docker.yml logs -f
    ;;

  token )
  token
    ;;

  superset-start )
  superset-start
    ;;
  
  superset-stop )
  superset-stop
    ;;

  superset-init )
  superset-init
    ;;

  psql )
  psql
    ;;

  * )
  printf "ERROR: Missing command\n  Usage: `basename $0` (start|stop|cleanup|token|logs|update|superset-start|superset-stop|superset-init)\n"
  exit 1
    ;;
esac