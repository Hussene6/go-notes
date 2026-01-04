#Compilacao
FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o go-notes

#Execucao
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/go-notes .
COPY --from=builder /app/website ./website
EXPOSE 8080
CMD ["./go-notes"]
