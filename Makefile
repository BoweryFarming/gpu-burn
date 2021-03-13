
SHELL:=/bin/bash

IMAGE_VERSION?=11.2.1-runtime-ubuntu20.04-gpu-burn
IMAGE_TAG?=traptic/cuda:${IMAGE_VERSION}

shell: image
	docker run -it --rm ${IMAGE_TAG} bash

burn: image
	docker run --rm ${IMAGE_TAG}

image:
	docker build --tag ${IMAGE_TAG} .

uploadImage: image
	docker push ${IMAGE_TAG}
