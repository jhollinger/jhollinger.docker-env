if [ -z "$BASH_SOURCE" ]; then
  this=${(%):-%x}
  jh_docker_root="$(dirname $this)/../.."
else
  jh_docker_root="$(dirname $BASH_SOURCE)/../.."
fi

#
# Run any docker compose command using the specified environment.
#
# Example: jh-compose dev up
#
function jh-compose {
  env_name=${1}
  shift
  docker compose -f "${jh_docker_root}/docker-compose.yml" -f "${jh_docker_root}/docker-compose.${env_name}.yml" "$@"
}

#
# Run a command inside a docker throwaway container.
#
# Example: jh-run dev cur8 bundle exec rake db:setup
#
function jh-run {
  env_name=${1}
  shift
  jh-compose ${env_name} run --rm "$@"
}

#
# Run a command inside a docker running container.
#
# Example: jh-exec dev postgres /docker-entrypoint-initdb.d/01-ct.sh
#
function jh-exec {
  env_name=${1}
  shift
  jh-compose ${env_name} exec "$@"
}
