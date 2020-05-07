package main

import (
	"context"
	"database/sql"
	"log"

	"github.com/google/uuid"
	"github.com/jonleopard/go-db/postgres"
	_ "github.com/lib/pq"
)

func main() {
	conn, err := sql.Open("postgres", "user=postgres password=example dbname=postgres sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	db := postgres.New(conn)
	id := uuid.Must(uuid.NewRandom())

	user, err := db.CreateUser(context.Background(), postgres.CreateUserParams{
		ID:        id,
		Firstname: "Jon",
		Lastname:  "Leopard",
		Email:     "jon@test.com",
		Password:  "12345",
	})
	if err != nil {
		log.Fatal(err)
	}

	log.Println(user)
}
