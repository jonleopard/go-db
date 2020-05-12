package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/jonleopard/go-db/postgres"
	"github.com/jonleopard/go-db/web"
	_ "github.com/lib/pq"
)

func main() {
	conn, err := sql.Open("postgres", "user=postgres password=example dbname=postgres sslmode=disable")
	if err != nil {
		log.Fatal(err)
	} else {
		fmt.Printf("DB Connection Established. ")
	}

	db := postgres.New(conn)

	h := web.NewHandler(db)

	port := ":3333"
	fmt.Printf("Starting server on port %v\n", port)
	http.ListenAndServe(port, h)
}
