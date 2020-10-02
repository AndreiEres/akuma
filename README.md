# Akuma


## Task management

Get all tasks:
```bash
curl https://switchup-akuma.herokuapp.com/tasks
```

Get task by id:
```bash
curl https://switchup-akuma.herokuapp.com/tasks/1
```

Create task:
```bash
curl https://switchup-akuma.herokuapp.com/tasks \
  -H 'Content-Type: application/json' \
  -d '{"task":{"title":"First Task","issuer":"default"}}'
```

Change task by id:
```bash
curl https://switchup-akuma.herokuapp.com/tasks/1 \
  -X PATCH \
  -H 'Content-Type: application/json' \
  -d '{"task":{"status":"assigned"}}'
```

Ask for task suggestion:
```bash
curl https://switchup-akuma.herokuapp.com/task_suggestion
```
