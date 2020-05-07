CREATE TABLE users (
  id UUID PRIMARY KEY,
  firstname TEXT NOT NULL,
  lastname TEXT NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  password TEXT NOT NULL
);

