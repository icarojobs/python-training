# PYTHON TRAINING
This is my own python/django/fastapi/flask training environment.

---
### COMMANDS:
```bash
# Up server
make # or make up

# Create new django project
make project name=core

# Create new django app
make app name=customer

# Create superuser
make superuser

# Change user password
make changepassword name=admin

# Up development web server
make server

# Run migrations
make migrate

# Enter inside container with shell
make shell

# Start new poetry toml file (if necessary)
make poetry-init
```