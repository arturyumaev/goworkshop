FROM golang

WORKDIR /app

RUN go install github.com/githubnemo/CompileDaemon@latest
COPY go.mod ./
RUN go mod download

COPY . .

EXPOSE ${APPLICATION_PORT}

CMD CompileDaemon \
  -build='go build -ldflags="${LDFLAGS}" -o ./bin/api ./cmd/api/main.go' \
  -command='./bin/api' \
  -exclude-dir='.git' \
  -color \
  -log-prefix=false
