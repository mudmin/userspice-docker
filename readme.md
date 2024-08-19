# UserSpice Docker Setup

This repository contains a Docker setup for running UserSpice, a user management system built in PHP.

## Prerequisites

- Docker
- Docker Compose

## Setup Instructions

1. Clone this repository:
   ```
   git clone https://github.com/mudmin/userspice-docker
   cd userspice-docker
   ```

2. Download UserSpice and place its files in the `userspice` directory.

3. Edit the .env file as needed:

4. Build and start the Docker containers:
   ```
   docker-compose up -d
   ```

5. Access UserSpice at `http://localhost:9700` (or the port you specified in .env) 

6. The default username of this install is admin and the password is password.
   You will be asked to change it on your first login.

7. If you see SQLSTATE[HY000] [2002] Connection refused, your mysql container has
   probably not finished booting.   

8. Access phpMyAdmin at `http://localhost:9701` (or the port you specified in .env)

## Configuration

- Modify the `.env` file to change database credentials or ports.
- The `sql.sql` file will be automatically imported into your MySQL database on first run.

## Persistence

MySQL data is persisted in a Docker volume named `mysql_data`.

## Stopping the Containers

To stop the containers, run:
```
docker-compose down
```

To stop the containers and remove the persisted data, run:
```
docker-compose down -v
```


