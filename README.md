# headstart-django
___
This template is designed to spin up a Django project using PostgreSQL, Gunicorn, Nginx, and Certbot (for SSL). It includes setups for both development and production environments to run the project in a containerized development environment.

Motivation: I needed a Django Docker setup for my projects and came across this article [The (near) Perfect Dockerfile for Django Applications by Siddharth Sahu](https://faun.pub/the-near-perfect-dockerfile-for-django-applications-8bc352a1e871). Initially, decided to use this setup, but it was missing or contradicting some features that were essential for projects. So, decided to build and add those features on top. Hence, this template.


### Production Environment Setup

1. **Create a `.env` File**: In the root directory of your project, create a `.env` file with the required environment variables. Refer to the provided `template.env` for guidance.

2. **Run Docker Compose**: Execute the following command to build and run your project in a production environment:

    ```bash
    docker-compose -f docker-compose.prod.yml up --build
    ```

    yeah, that's it! Your project is now running in a production environment.

### Development Environment Setup (Recommended: Using Virtualenv)
___

1. **Create a Repository with This Template**:

    [create](https://github.com/new?template_name=headstart-django&template_owner=alexdeathway)

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

5. **Install the Requirements**:

    ```bash
    pip install -r requirements.txt
    ```

6. **Create a `.env` File**: In the root directory of the project, create a `.env` file with the required environment variables. Refer to `template.env` for the necessary variables.

7. **Start the Development Server**:

    ```bash
    python manage.py runserver
    ```

### Development Environment Setup (Using Docker)
___
1. **Clone the Repository**:

    ```bash
    git clone <repository-url>
    ```

2. **Create a `.env` File**: In the root directory of the project, create a `.env` file with the required environment variables. Refer to `template.env` for the necessary variables.

3. **Run Docker Compose**:

    ```bash
    docker-compose up --build
    ```

---

