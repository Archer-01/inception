# Inception

Welcome to the Inception project repository! This project aims to set up a small infrastructure composed of different services under specific rules, all within a virtual machine using Docker Compose. Each service will run in a dedicated container, and for performance considerations, containers will be built either from the penultimate stable version of Alpine or Debian.

## Table of Contents
- [Project Overview](#project-overview)
- [Getting Started](#getting-started)
- [File Structure](#file-structure)
- [Dockerfiles](#dockerfiles)
- [Makefile](#makefile)
- [Bonus Features](#bonus-features)
- [Defensive Justification](#defensive-justification)

### Project Overview
The infrastructure consists of the following services:
1. NGINX with TLSv1.2 or TLSv1.3 only
2. WordPress + php-fpm (without nginx)
3. MariaDB
4. Volumes for WordPress database and website files
5. Docker network connecting the containers

### Getting Started
To get started with this project, follow these steps:
1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Run `make build` to build the Docker images.
4. Run `make up` to start the containers.

### File Structure
- `docker-compose.yml`: Compose file defining the services, volumes, and network.
- `Makefile`: Automation script for building and managing Docker images.
- `nginx/Dockerfile`: Dockerfile for NGINX service.
- `wordpress/Dockerfile`: Dockerfile for WordPress + php-fpm service.
- `mariadb/Dockerfile`: Dockerfile for MariaDB service.
- `volumes/wordpress-db`: Volume for WordPress database.
- `volumes/wordpress-files`: Volume for WordPress website files.

### Dockerfiles
- Each service has its own Dockerfile located in the corresponding service directory.
- Dockerfiles are written to build the services from the penultimate stable version of Alpine or Debian.
- The Dockerfiles are invoked in the `docker-compose.yml` through the `Makefile`.

### Makefile
The Makefile includes the following commands:
- `build`: Builds Docker images for all services.
- `up`: Starts containers using Docker Compose.
- `down`: Stops and removes containers, networks, and volumes.

To use the Makefile, run commands like `make build` or `make up` in the project directory.

### Bonus Features
Bonus services have been added to enhance the project:
- **Redis Cache**: Set up a Redis cache for WordPress.
- **FTP Server**: Containerized FTP server linked to the WordPress website volume.
- **Static Website**: Create a simple static website in a language other than PHP.
- **Adminer**: Set up Adminer for database management.
- **Custom Service**: Add a service of your choice, justifying its usefulness during defense.

Feel free to explore and modify the project to suit your needs! If you encounter any issues or have suggestions, please create an issue in the repository. Happy coding!
