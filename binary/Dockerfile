# build image
FROM alpine:latest

ENV REPO=ethereumproject/go-ethereum
RUN apk update && apk add curl tar gzip jq
RUN FILE=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r '.assets[0].browser_download_url') && echo file=$FILE repo=$REPO;curl -sLo etc.tar.gz $FILE && tar xzf etc.tar.gz

# # Production image
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=0 /geth /bin/geth

EXPOSE 8545 8546 30303 30303/udp 30304/udp
ENTRYPOINT ["geth"]