# STAGE 1

FROM golang:1.25.4-alpine AS builder

WORKDIR /app

COPY ./cmd/root-service/main.go .

COPY ./go.mod .

RUN go mod tidy

RUN go build -o root-service

# STAGE 2

FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/root-service .

EXPOSE 5000

CMD ["/app/root-service"]