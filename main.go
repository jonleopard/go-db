package main

import (
	"context"
	"database/sql"
	"log"

	"github.com/jonleopard/sqlc/postgres"
	_ "github.com/lib/pq"
)

func main() {
	conn, err := sql.Open("postgres", "user=mydbuser password=mydbpwd dbname=sqlc sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	db := postgres.New(conn)

	user, err := db.CreateUser(context.Background(), postgres.CreateUserParams{
		Firstname: "Jon",
		Lastname:  "Leopard",
	})
	if err != nil {
		log.Fatal(err)
	}

	log.Println(user)
}
