# clitest Docker image, for end users and CI systems
# Published at https://hub.docker.com/r/aureliojargas/clitest

FROM alpine:3.11

# Perl is required by clitest --regex matching mode
RUN apk --no-cache add perl

# Docker Hub Autobuild sets the DOCKER_TAG environment variable
# Docker tag = Git tag = clitest version
ARG DOCKER_TAG

# Get the clitest script at the specified version
ADD https://raw.githubusercontent.com/aureliojargas/clitest/${DOCKER_TAG}/clitest /bin/clitest
RUN chmod +x /bin/clitest

WORKDIR /mnt
ENTRYPOINT ["/bin/clitest"]
