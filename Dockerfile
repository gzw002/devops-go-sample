FROM golang:1.18 as builder

WORKDIR /go/src/devops-go-sample/

COPY . .

RUN go mod init
RUN go build -o hello-world

FROM alpine:latest

COPY --from=builder /go/src/devops-go-sample/hello-world /usr/local/bin/

EXPOSE 8080
CMD ["/usr/local/bin/hello-world"]
