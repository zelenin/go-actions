FROM golang:1.11.5-alpine3.8 as builder

MAINTAINER Aleksandr Zelenin <aleksandr@zelenin.me>

ENV LANG en_US.UTF-8
ENV TZ UTC

RUN set -eux && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
        bash \
        build-base \
        ca-certificates \
        curl \
        git \
        linux-headers

WORKDIR /src

COPY . /src

RUN go build \
        -a \
        -asmflags "all=-trimpath=$(pwd)" \
        -gcflags "all=-trimpath=$(pwd)" \
        -ldflags "-s -w" \
        -o app \
        "./cmd/main.go"


FROM alpine:3.8

MAINTAINER Aleksandr Zelenin <aleksandr@zelenin.me>

ENV LANG en_US.UTF-8
ENV TZ UTC

RUN apk upgrade --no-cache && \
    apk add --no-cache \
        ca-certificates && \
    mkdir -p /app

WORKDIR /app

COPY --from=builder /src/app .

CMD ["./app"]
