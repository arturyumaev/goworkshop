COMMIT_HASH = $$(git rev-parse --short HEAD)
BRANCH_NAME = $$(git rev-parse --abbrev-ref HEAD)
USER_EMAIL  = $$(git config user.email)

@export COMMIT_HASH=$(COMMIT_HASH)
@export BRANCH_NAME=$(BRANCH_NAME)
@export USER_EMAIL=$(USER_EMAIL)

# LDFLAGS="-X 'main.commitHash=${COMMIT_HASH}' -X 'main.branchName=${BRANCH_NAME}' -X 'github.com/arturyumaev/goworkshop/internal/info.UserEmail=${USER_EMAIL}'"

dev_up:
	@echo "${COMMIT_HASH}"
	@echo "${BRANCH_NAME}"
	@echo "${USER_EMAIL}"

	# @docker compose \
	# 	-f ./deployments/development/docker-compose.yml \
	# 	--env-file ./deployments/development/.env \
	# 	build --no-cache

	# @docker compose \
	# 	-f ./deployments/development/docker-compose.yml \
	# 	--env-file ./deployments/development/.env \
	# 	up

dev_down:
	@docker compose \
		-f ./deployments/development/docker-compose.yml \
		--env-file ./deployments/development/.env \
		down

nm:
	go tool nm ./bin/app
