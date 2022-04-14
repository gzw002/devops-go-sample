FROM golang:1.18 as builder

WORKDIR /go/src/kubesphere.io/devops-go-sample/

COPY . .

RUN go build -o hello-world

FROM harbor.devops.kubesphere.local:30280/library/alpine:latest

COPY --from=builder /go/src/kubesphere.io/devops-go-sample/hello-world /usr/local/bin/

EXPOSE 8080
CMD ["/usr/local/bin/hello-world"]
