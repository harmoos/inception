# 🐳 Inception - Dockerized Infrastructure

# 🌟 Overview

The Inception project challenges the developer to create a fully functional, containerized infrastructure using Docker and Docker Compose. The goal is to set up multiple interconnected services—a WordPress site, a MariaDB database, and Nginx—in a reproducible and isolated environment.

This project demonstrates core competencies in containerization, networking, and establishing a microservices environment, essential skills for modern DevOps and backend development.

# ✨ Infrastructure Components

The final infrastructure setup is defined and managed using a single docker-compose.yml file and consists of the following interconnected services:
* Nginx:	Front-end reverse proxy. Acts as the entry point, routing requests and providing SSL/TLS encryption (HTTPS).
* WordPress / PHP-FPM:	The core web application. Connects to the database and serves dynamic content.
* MariaDB:	The database management system. Stores all WordPress data (posts, users, settings).

# 🛠️ Installation & Setup

- Prerequisites

You must have the following software installed on your Linux system:

    Docker Engine: The platform used to build and run containers.

    Docker Compose: The tool used to define and run multi-container Docker applications.


Configuration: The project relies on environment variables set in a .env file for security and portability (e.g., database root password, WordPress user credentials). Ensure this file is correctly configured.

Build and Launch: Run docker compose to build all custom images (where necessary) and start the services. The -d flag runs the containers in detached mode (in the background).

    sudo docker compose up -d --build

- Verification: Check the status of all containers:

      sudo docker compose ps

  All services should show a status of Up.

- Accessing the Site

Once all containers are running, you can access the WordPress site via HTTPS in your browser:

    URL: https://<YOUR_DOMAIN_OR_IP> 

# 🔑 Key Concepts Implemented

    Dockerfiles: Custom Dockerfile used for each service (nginx, wordpress, mariadb) to ensure minimal image size and security.

    Volumes: Persistent Docker Volumes are used for the MariaDB database and WordPress files to ensure data persists even if the containers are stopped or removed.

    Networking: A custom Docker Network is defined to allow services to communicate securely using their service names (e.g., WordPress connects to mariadb).

    SSL/TLS: The Nginx container is configured to use self-signed certificates, enforcing secure connections over HTTPS.
