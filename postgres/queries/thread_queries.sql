-- name: GetThread :one
SELECT * FROM threads
WHERE id = $1;

-- name: GetThreads :many
SELECT * FROM threads;

-- name: CreateThread :one
INSERT INTO threads (id, title, description)
VALUES ($1, $2, $3)
RETURNING *;

-- name: UpdateThread :one
UPDATE threads
SET title = $1, description = $2
WHERE id = $3
RETURNING *;

-- name: DeleteThread :exec
DELETE FROM threads
WHERE id = $1;
