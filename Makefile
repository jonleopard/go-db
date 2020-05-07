.PHONY: postgres adminer migrate

postgres:
	docker run --rm -ti --network host -e POSTGRES_PASSWORD=secret postgres

adminer:
	docker run --rm -ti --network host adminer

migrate:
	 docker run -v ${PWD}/postgres/migrations:/migrations --network host migrate/migrate -source file:///migrations -database "postgresql://postgres:example@localhost/postgres?sslmode=disable" up

migrate-down:
	docker run -v ${PWD}/postgres/migrations:/migrations --network host migrate/migrate -source file:///migrations -database "postgresql://postgres:example@localhost/postgres?sslmode=disable" down -all

sqlc:
	docker run --rm -v ${PWD}/postgres:/src -w /src kjconroy/sqlc generate
