# headstart-django

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?style=flat-square)
![Django](https://img.shields.io/badge/Django-5.1-orange?style=flat-square)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16.4-green?style=flat-square)
![Gunicorn](https://img.shields.io/badge/Gunicorn-21.2.0-lightgrey?style=flat-square)
![Nginx](https://img.shields.io/badge/Nginx-1.27.1-brightgreen?style=flat-square)
![Certbot](https://img.shields.io/badge/Certbot-latest-blueviolet?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-lightgrey?style=flat-square)

This template is designed to quickly set up a Django project using PostgreSQL, Gunicorn, Nginx, and Certbot (for SSL). It supports both development and production environments, facilitating the running of your project in a containerized setup.

## Motivation

I needed a robust Docker setup for my Django projects and came across this article [The (near) Perfect Dockerfile for Django Applications by Siddharth Sahu](https://faun.pub/the-near-perfect-dockerfile-for-django-applications-8bc352a1e871). While the original setup was a good start, it lacked several essential features for my projects. As a result, I decided to enhance it and create this template.

## Tech Stack

| Technology     | Version  | Badge                                                  |
|----------------|----------|--------------------------------------------------------|
| **Django**     | 5.1      | ![Django](https://img.shields.io/badge/Django-5.1-orange?style=flat-square)         |
| **PostgreSQL** | 16.4     | ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16.4-green?style=flat-square) |
| **Gunicorn**   | 21.2.0   | ![Gunicorn](https://img.shields.io/badge/Gunicorn-21.2.0-lightgrey?style=flat-square)  |
| **Nginx**      | 1.27.1   | ![Nginx](https://img.shields.io/badge/Nginx-1.27.1-brightgreen?style=flat-square)   |
| **Certbot**    | latest   | ![Certbot](https://img.shields.io/badge/Certbot-latest-blueviolet?style=flat-square) |

## Features

- Quick setup for Django projects with a core application.
- Dockerized environments for both development and production.
- Automatic SSL certificate renewal using Certbot.
- Production-ready Nginx configuration.
- Local `static` and `media` directories (configurable for S3 or other storage services).
- Support for both PostgreSQL and SQLite databases (SQLite will be used in development if PostgreSQL isn't available).

## Setup Instructions

### Production Environment Setup

1. **Create a `.prod.env` File**: In the root directory of your project, create a `.prod.env` file with the required environment variables. Use the provided `template.prod.env` for guidance.

2. **Run Docker Compose**: Execute the following command to build and run your project in a production environment:

    ```bash
    docker compose -f docker-compose.prod.yml up --build
    ```

    Your project is now running in a production environment!

### Development Environment Setup

#### Option 1: Using Virtualenv (Recommended)

1. **Create a Repository from This Template**:
   
   [Create Repository](https://github.com/new?template_name=headstart-django&template_owner=alexdeathway)

2. **Clone the Repository Locally**:

    ```bash
    git clone <YOUR-repository-url>
    ```

3. **Create a Virtual Environment**:

    ```bash
    python3 -m venv venv
    ```

4. **Activate the Virtual Environment**:

    ```bash
    source venv/bin/activate
    ```

5. **Install Requirements**:

    ```bash
    pip install -r requirements.txt
    ```

6. **Create a `.dev.env` File**: In the root directory of the project, create a `.dev.env` file with the required environment variables, referencing `template.dev.env`.

7. **Start the Development Server**:

    ```bash
    python manage.py runserver
    ```

#### Option 2: Using Docker

1. **Clone the Repository**:

    ```bash
    git clone <repository-url>
    ```

2. **Create a `.dev.env` File**: In the root directory of the project, create a `.dev.env` file with the required environment variables, referencing `template.dev.env`.

## Contributing

Contributions are welcome! If you have suggestions for improvements or features, please open an issue or submit a pull request. 

### Steps to Contribute:

1. Fork the repository.
2. Create a new branch for your feature or fix.
3. Make your changes and commit them with a clear message.
4. Push your branch to your forked repository.
5. Open a pull request detailing your changes.

Thank you for considering contributing to this project!
