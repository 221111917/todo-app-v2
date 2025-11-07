# Todo App with Docker Desktop

Aplikasi Todo List sederhana (Flask + Docker).

## Cara Jalankan (Windows)
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. Double-click `start-todo.bat`
3. Buka: http://localhost:5000/todos

## API
- GET `/todos`
- POST `/todos` → `{"task": "Belajar"}`
- DELETE `/todos/0`

CI/CD: ![CI](https://github.com/USERNAME/todo-app/actions/workflows/ci-cd.yml/badge.svg)