# clitest Docker image

Docker image for [clitest](https://github.com/aureliojargas/clitest), a portable POSIX shell script that performs automatic testing in Unix command lines.

- `docker pull aureliojargas/clitest`

- Docker Hub: https://hub.docker.com/r/aureliojargas/clitest

- GitHub: https://github.com/aureliojargas/clitest-docker


## Running this image

This image behaves as an executable program. You only have to pass the arguments to clitest. For example, using `--help`:

    docker run --rm -t aureliojargas/clitest --help

Inform an image tag if you want to run a specific clitest version:

    docker run --rm -t aureliojargas/clitest:0.3.0 --help


## Running clitest in your own files

The working directory inside the image is `/mnt`. Just make your files available in this directory.

For example, to mount the current directory (`$PWD`) inside the container's working directory (`/mnt`) and run clitest on the `./mytests.md` file:

    docker run --rm -t -v "$PWD":/mnt aureliojargas/clitest mytests.md


## Build & publish

By creating a git tag in the `aureliojargas/clitest-docker` GitHub repository, a new Docker image will be automatically built, tested and published by [Docker Hub Autobuild](https://docs.docker.com/docker-hub/builds/).

For example, to create a new Docker image for clitest version `1.2.3`, just create a git tag named `1.2.3` pointing to the HEAD commit and push it.

    git tag 1.2.3
    git push origin 1.2.3

Then Autobuild will be triggered and a new `aureliojargas/clitest:1.2.3` Docker image will be published to Docker Hub.

See the [hooks/build](https://github.com/aureliojargas/clitest-docker/blob/master/hooks/build) and [hooks/test](https://github.com/aureliojargas/clitest-docker/blob/master/hooks/test) scripts for the details on how the image is built and tested.


## Local build & test

To build (and test) this image in your machine, git tags are not necessary. Just run the `make` targets informing the desired clitest version:

    make build version=0.1.0
    make test version=0.1.0


## Publishing the `latest` tag

Adding the `latest` tag to the most recent image version is a manual process. Example:

    make latest version=1.2.3
