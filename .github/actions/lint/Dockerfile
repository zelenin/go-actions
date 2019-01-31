FROM golang:1.11.5-alpine3.8

LABEL "com.github.actions.name"="Lint"
LABEL "com.github.actions.description"="Lint Golang code"
LABEL "com.github.actions.icon"="loader"
LABEL "com.github.actions.color"="white"

LABEL "repository"="http://github.com/zelenin/go-actions"
LABEL "homepage"="http://github.com/zelenin/go-actions"
LABEL "maintainer"="Aleksandr Zelenin <aleksandr@zelenin.me>"

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

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
