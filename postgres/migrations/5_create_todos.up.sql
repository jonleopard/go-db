CREATE TABLE todos (
  id UUID PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES users(id),
  task TEXT NOT NULL,
  done BOOLEAN NOT NULL
);