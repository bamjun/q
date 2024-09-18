find . -path "*/migrations/*.py" ! -name "__init__.py" -not -path "*/.venv/*" -delete
find . -path "*/migrations/*.pyc" -not -path "*/.venv/*" -delete
