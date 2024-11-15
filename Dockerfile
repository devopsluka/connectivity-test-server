FROM docker.io/library/golang:1.17-buster AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o cts_server

FROM scratch

COPY --from=builder /app/cts_server /cts_server

EXPOSE 8080

ENTRYPOINT ["/cts_server"]
