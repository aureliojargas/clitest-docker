# clitest Docker image

- Docker Hub: https://hub.docker.com/r/aureliojargas/clitest
- `docker pull aureliojargas/clitest`

[clitest](https://github.com/aureliojargas/clitest) is a portable POSIX shell script that performs automatic testing in Unix command lines.


## Running this image

Instructions in the [Docker Hub page for this image](https://hub.docker.com/r/aureliojargas/clitest).


## Build & publish

By creating a git tag in this repository, a new Docker image will be automatically built, tested and published by [Docker Hub Autobuild](https://docs.docker.com/docker-hub/builds/).

For example, to create a new Docker image for clitest version `1.2.3`, just create a git tag named `1.2.3` pointing to the HEAD of this repository and push it.

    git tag 1.2.3
    git push origin 1.2.3

Then Autobuild will be triggered and a new `aureliojargas/clitest:1.2.3` Docker image will be published.

See the `hooks/build` and `hooks/test` scripts for the details on how the image is built and tested.


## Local build & test

To build (and test) this image in your machine, git tags are not necessary. Just run the `make` targets informing the desired clitest version:

    make build version=0.1.0
    make test version=0.1.0


## Publishing the `latest` tag

Adding the `latest` tag to the most recent image version is a manual process. Example:

    make latest version=1.2.3
