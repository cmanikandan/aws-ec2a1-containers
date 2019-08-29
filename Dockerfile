FROM golang:latest AS builder
WORKDIR /tmp
ADD ./go-webserver-sample.go /tmp
RUN GOOS=linux CGO_ENABLED=0 GOARCH=arm64 go build -o go-webserver-sample .

FROM alpine:latest
COPY --from=builder /tmp/go-webserver-sample /bin/
CMD ["/bin/go-webserver-sample"]
