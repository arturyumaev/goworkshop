FROM golang

WORKDIR /app

RUN go install github.com/githubnemo/CompileDaemon@latest
COPY go.mod ./
RUN go mod download

COPY . .

EXPOSE ${APPLICATION_PORT}

CMD git config user.email; CompileDaemon \
  -build="make build_api" \
  -command="make run_api" \
  -exclude-dir=".git" \
  -color \
  -log-prefix=false
