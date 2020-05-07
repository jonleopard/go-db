-- name: CreateTodo :one
INSERT INTO todos (user_id, task, done) 
VALUES ($1, $2, $3) RETURNING *;
