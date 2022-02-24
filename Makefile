start:
	docker-compose up --no-build

build:
	docker-compose up --force-recreate --build

clean:
	docker-compose down -v --remove-orphans --rmi=all
