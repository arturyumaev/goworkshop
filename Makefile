COMMIT_HASH = $$(git rev-parse --short HEAD)
BRANCH_NAME = $$(git rev-parse --abbrev-ref HEAD)
USER_EMAIL = $$(git config user.email)

dev_up:
	git rev-parse --abbrev-ref HEAD
	go build \
		-ldflags="-X 'main.commitHash=${COMMIT_HASH}' -X 'main.branchName=${BRANCH_NAME}' -X 'github.com/arturyumaev/goworkshop/internal/info.UserEmail=${USER_EMAIL}'" \
		-o ./bin/api ./cmd/api/main.go
	.${pwd}/bin/api

dev_down:
	echo "unimplemented"

nm:
	go tool nm ./bin/app
