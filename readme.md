# UserSpice Docker Setup

This repository contains a Docker setup for running UserSpice. The latest version of UserSpice is automatically downloaded when you first start the containers.

## Prerequisites

- Docker
- Docker Compose

## Setup Instructions

1. Clone this repository:
   ```
   git clone https://github.com/mudmin/userspice-docker
   cd userspice-docker
   ```

2. Edit the .env file as needed.

3. Build and start the Docker containers (depending on your Docker Compose Version):
   ```
   docker compose up -d
   ```
   OR
   ```
   docker-compose up -d
   ```
   On first run, the latest UserSpice release will be downloaded and configured automatically.

4. Access UserSpice at `http://localhost:9700` (or the port you specified in .env)

5. The default username is admin and the password is password.
   You will be asked to change it on your first login.

6. If you see SQLSTATE[HY000] [2002] Connection refused, your mysql container has
   probably not finished booting.

7. Access phpMyAdmin at `http://localhost:9701` (or the port you specified in .env)

## Configuration

- Modify the `.env` file to change database credentials or ports.
- If you change database credentials, you will also need to update `docker/init.php`.
- The `sql.sql` file will be automatically imported into your MySQL database on first run.

## Custom Files

You can override any UserSpice file by placing it in the `custom_files/` directory using the same folder structure as UserSpice. Custom files are copied over the UserSpice installation on every container start, so they survive rebuilds.

The directory includes default `users/` and `usersc/` folders to help you understand the structure:
```
custom_files/
  users/       # overrides files in userspice/users/
  usersc/      # overrides files in userspice/usersc/
```

For example, to customize the login page, place your modified file at:
```
custom_files/usersc/login.php
```

This will overwrite `userspice/usersc/login.php` each time the container starts.

You can also replace `sql.sql` in the root of the repo to use your own database schema on first run.

## Distributing Your Own Project

Want to build and distribute your own project on top of UserSpice? Fork this repo and add your customized files to `custom_files/`. Your users can clone your repo and `docker compose up -d` to get a fully working instance of your project with the latest version of UserSpice and your customizations applied automatically.

## Persistence

- MySQL data is persisted in a Docker volume named `mysql_data`.
- UserSpice files are stored in the `userspice/` directory, which is created on first run.

## Stopping the Containers

To stop the containers, run:
```
docker compose down
```

## Starting Over from Scratch

To completely destroy the install and start fresh (new database, new UserSpice files):
```
docker compose down -v --rmi all
sudo rm -rf userspice/
docker compose up -d --build
```
