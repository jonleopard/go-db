-- name: GetComment :one
SELECT * FROM comments
WHERE id = $1;

-- name: GetCommentsByPost :many
SELECT * FROM comments
WHERE post_id = $1;

-- name: CreateComment :one
INSERT INTO comments (id, post_id, content, votes)
VALUES ($1, $2, $3, $4)
RETURNING *;

-- name: UpdateComment :one
UPDATE comments 
SET post_id = $1, content = $2, votes = $3
WHERE id = $4
RETURNING *;

-- name: DeleteComment :exec
DELETE from comments
WHERE id = $1;
