# build image
FROM golang:1.10-alpine

RUN apk update && apk add --no-cache git gcc musl-dev
RUN go get -u github.com/ethereumproject/go-ethereum/cmd/geth
# RUN go -u install github.com/ethereumproject/go-ethereum/cmd/geth

# Production image
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=0 /go/bin/* /bin/
EXPOSE 8545 8546 30303 30303/udp 30304/udp
CMD /bin/geth