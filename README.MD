# PYTHON TRAINING
This is my own python/django/fastapi/flask training environment.

### LIVE TRAINING
This content was produced in live at Tio Jobs channel => [https://www.youtube.com/watch?v=ChZWJzO-0zE](https://www.youtube.com/watch?v=ChZWJzO-0zE)

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