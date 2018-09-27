DOCKER_REPO=kernsuite/tensorflow

.PHONY: build clean

all: build

build:
		docker build --pull --rm -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

upload: 
	docker push ${DOCKER_REPO}

nvidia:
	docker run \
		--runtime=nvidia \
		-e NVIDIA_VISIBLE_DEVICES=all \
		-ti ${DOCKER_REPO} \
    	nvidia-smi

tensorflow: 
	docker run \
	  --runtime=nvidia \
	  -e NVIDIA_VISIBLE_DEVICES=all \
	  -ti ${DOCKER_REPO} \
	  python3 -c "import tensorflow as t;print(t.Session().run(t.constant('test')))"

bash:
	docker run \
	--runtime=nvidia \
	-e NVIDIA_VISIBLE_DEVICES=all \
	-ti ${DOCKER_REPO} \
	bash
