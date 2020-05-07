-- name: GetPost :one
SELECT * FROM posts
WHERE id = $1;

-- name: GetPostsByThread :many
SELECT * FROM posts
WHERE thread_id = $1;

-- name: CreatePost :one
INSERT INTO posts (id, thread_id, title, content, votes)
VALUES ($1, $2, $3, $4, $5)
RETURNING *;

-- name: UpdatePost :one
UPDATE posts
SET thread_id = $1, title = $2, content = $3, votes = $4
WHERE id = $5
RETURNING *;

-- name: DeletePost :exec
DELETE FROM posts
WHERE id = $1;
