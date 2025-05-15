# Docker Compose for dev & prod env

**Requirements**

* git
* docker

Log into Github's docker hub with:

    docker login docker.pkg.github.com --username jhollinger

The password should be a GH personal access token with read:packages, repo, and (optionally) write:packages.

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

### Update

    git pull
    SERVICE=cur8
    jh-compose prod pull $SERVICE && \
      jh-compose prod stop $SERVICE && \
      jh-compose prod up -d $SERVICE
    
## Uninstall

    # Drop containers only (very fast to bin/setup)
    jh-compose dev|prod down

    # Drop containers and images (pretty fast to bin/setup)
    jh-compose dev|prod down --rmi=all

    # Burn it all down! (very slow to bin/setup)
    jh-compose dev|prod down --rmi=all --volumes

## Helpers

    # runs `docker-compose` config with the specified config file.
    jh-compose dev ps

    # runs `docker-compose run --rm` with the specified config file and container.
    jh-run dev cashtracker b rake db:migrate

    # runs `docker-compose exec` with the specified config file and container.
    jh-exec dev postgres psql --username postgres -l

## Backups

This will dump the specified database into the specified directory, as a compressed sql file.

    bin/backup-db dev cashtracker_dev ~/backups/

### Encrypted backups

Simply add your gpg public key name (usually an email) to the backup command.

    bin/backup-db dev cashtracker_dev ~/backups/ user@example.com
