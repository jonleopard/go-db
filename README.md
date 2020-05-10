# go-db


#### Setup instructions
- `docker-compose up -d`
- `docker-compose up migrate`
- `make sqlc` (if you need to regenerate db layer)

adminer is available on localhost:8081. Credentials located in makefile/docker-compose.yml



#### Todo
1. Verify that CORS is working
2. Hookup JWT to your signin route/function
2. Create signup/signin route/function. This can all be inside web/handler.go,
   but I think it would be cleaner to separate into separate files.
3. Figure out if I need a store.go file inside the postgres directory for using
   inside web package. The main idea is that we need to establish a DB
   connection for CRUD actions. 
