FROM golang:1.17.2-alpine3.14 AS builder

WORKDIR /app

COPY . .

RUN go build -o main

FROM alpine:3.14

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8084

CMD ["./main"]