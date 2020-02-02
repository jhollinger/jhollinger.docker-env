# Docker Compose for dev & prod env

**Requirements**

* git
* docker
* docker-compose

## Dev Environment

This will set up the entire docker compose stack and install several shell functions and aliases.

    git clone git@github.com:jhollinger/jhollinger.docker-env.git
    cd jhollinger.docker-env
    bin/setup-dev

On your first run, you will need to re-source .bashrc/.bash_profile/.zshrc.

    source ~/.bashrc

## Prod Environment

    git clone git@github.com:jhollinger/jhollinger.docker-env.git
    cd jhollinger.docker-env
    bin/setup-helpers

On your first run, you will need to re-source .bashrc/.bash_profile/.zshrc.

    source ~/.bashrc

### Install

    jh-compose prod up -d

## Helpers

**jh-compose**

Runs `docker-compose` config with the specified config file.

    jh-compose dev ps

**jh-run**

Runs `docker-compose run --rm` with the specified config file and container.

    jh-run dev cashtracker b rake db:migrate

**jh-exec**

Runs `docker-compose exec` with the specified config file and container.

    jh-exec dev postgres psql --username postgres -l

## Backups

This will dump the specified database into the specified directory, as a compressed sql file.

    bin/backup-db dev cashtracker_dev ~/backups/

### Encrypted backups

Simply add your gpg public key name (usually an email) to the backup command.

    bin/backup-db dev cashtracker_dev ~/backups/ user@example.com
