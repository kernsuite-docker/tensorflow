DOCKER_REPO=kernsuite/tensorflow

.PHONY: build clean

all: build

build:
		docker build --pull -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

upload: build
	docker push ${DOCKER_REPO}

run: build
	docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -ti ${DOCKER_REPO} bash
