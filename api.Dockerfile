# STAGE 1

FROM golang:1.25.4-alpine AS builder

WORKDIR /app

COPY ./cmd/api-service/main.go .

COPY ./go.mod .

RUN go mod tidy

RUN go build -o api-service

# STAGE 2

FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/api-service .

EXPOSE 5000

CMD ["/app/api-service"]