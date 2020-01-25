root_dir="$(dirname $0)/../.."

#
# Run any docker-compose command using the specified environment.
#
# Example: jh-compose dev up
#
function jh-compose {
  env_name=${1}
  shift
  docker-compose -f "${root_dir}/docker-compose.yml" -f "${root_dir}/docker-compose.${env_name}.yml" "$@"
}

#
# Run a command inside a docker container.
#
# Example: jh-run dev cur8 bundle exec rake db:setup
#
function jh-run {
  env_name=${1}
  shift
  jh-compose ${env_name} run --rm "$@"
}
