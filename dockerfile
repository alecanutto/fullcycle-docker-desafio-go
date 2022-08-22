FROM golang:1.19 AS builder

WORKDIR /go/src/app

COPY go.mod .
COPY main.go .

RUN go build -o /app

FROM scratch

WORKDIR /

COPY --from=builder /app /app

ENTRYPOINT [ "/app" ]