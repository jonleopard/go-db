package main

import (
	"context"
	"database/sql"
	"log"
	"net/http"

	"github.com/jonleopard/go-db/postgres"
	"github.com/jonleopard/go-db/web"
)

func main() {
	conn, err := sql.Open("postgres", "user=postgres password=example dbname=postgres sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	db := postgres.New(conn)

	user, err := db.CreateUser(context.Background(), postgres.CreateUserParams{
		Firstname: "John",
		Lastname:  "Doe",
		Email:     "john@doe.com",
		Password:  "12345",
	})
	if err != nil {
		log.Fatal(err)
	}

	h := web.NewHandler()
	http.ListenAndServe(":3000", h)

	log.Println(user)
}
