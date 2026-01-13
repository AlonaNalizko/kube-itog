# STAGE 1

FROM golang:1.25.4-alpine AS builder

WORKDIR /app

COPY ./cmd/info-service/main.go .

COPY ./go.mod .

RUN go mod tidy

RUN go build -o info-service

# STAGE 2

FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/info-service .

EXPOSE 5000

CMD ["/app/info-service"]