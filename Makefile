COMMIT_HASH := $(shell git rev-parse --short HEAD)
BRANCH_NAME := $(shell git rev-parse --abbrev-ref HEAD)

LDFLAGS := -X 'main.commitHash=$(COMMIT_HASH)' -X 'main.branchName=$(BRANCH_NAME)'

api_build_local:
	go build -ldflags="$(LDFLAGS)" -o ./bin/api ./cmd/api/main.go

api_run_local: api_build_local
	./bin/api

api_build:
	docker build -t api -f deployments/production/Dockerfile.api .

api_run: api_build
	docker run api

dev_up:
	@docker compose \
		-f ./deployments/development/docker-compose.yml \
		--env-file ./deployments/development/.env \
		up

dev_down:
	@docker compose \
		-f ./deployments/development/docker-compose.yml \
		--env-file ./deployments/development/.env \
		down

nm:
	go tool nm ./bin/app
