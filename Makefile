image = aureliojargas/clitest
shell_scripts = hooks/*

fmt:
	shfmt -w -i 4 -ci -kp -sr $(shell_scripts)

lint:
	shellcheck $(shell_scripts)
	shfmt -d -i 4 -ci -kp -sr $(shell_scripts)

build:
	DOCKER_TAG=$(version) DOCKER_REPO=$(image) \
		DOCKERFILE_PATH=Dockerfile \
		./hooks/build

test:
	DOCKER_TAG=$(version) DOCKER_REPO=$(image) \
		./hooks/test
