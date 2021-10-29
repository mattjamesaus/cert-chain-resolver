FROM golang:1.17.2-bullseye
WORKDIR /go/src/app
COPY . .
RUN go mod download
RUN go build
RUN go test ./...
RUN tests/run.sh
RUN cp cert-chain-resolver /usr/bin
ENTRYPOINT ["cert-chain-resolver"]