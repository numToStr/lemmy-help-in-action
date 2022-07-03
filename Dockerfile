# Container image that runs your code
FROM alpine:3.16

# gcompat and libgcc is required to run rust binary
RUN apk update && apk add gcompat libgcc

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
