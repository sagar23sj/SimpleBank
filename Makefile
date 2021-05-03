postgres-up:
	docker run --name postgresdb -p 5431:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=sagar12345 -d postgres:13.2-alpine
postgres-stop:
		docker stop postgresdb
postgres-start:
		docker start postgresdb
postgres-restart:
		docker restart postgresdb
postgres-remove:
		docker rm postgresdb
createdb:
		docker exec -it postgresdb createdb --username=postgres --owner=postgres simple_bank
dropdb:
		docker exec -it postgres dropdb --username=postgres  simple_bank

migrate-up:
	migrate --path db/migrations/ --database "postgresql://postgres:sagar12345@localhost:5431/simple_bank?sslmode=disable" --verbose up
migrate-down:
	migrate --path db/migrations/ --database "postgresql://postgres:sagar12345@localhost:5431/simple_bank?sslmode=disable" --verbose down

sqlc:
	sqlc generate

.PHONY: sqlc migrate postgres-up postgres-stop postgres-restart postgres-remove createdb dropdb
