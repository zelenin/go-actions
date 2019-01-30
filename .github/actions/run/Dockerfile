FROM alpine:3.8

LABEL "com.github.actions.name"="Run"
LABEL "com.github.actions.description"="Run Golang application"
LABEL "com.github.actions.icon"="play"
LABEL "com.github.actions.color"="red"

LABEL "repository"="http://github.com/zelenin/go-actions"
LABEL "homepage"="http://github.com/zelenin/go-actions"
LABEL "maintainer"="Aleksandr Zelenin <aleksandr@zelenin.me>"

RUN set -eux && \
    apk update && \
    apk upgrade

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
