
SHELL:=/bin/bash

IMAGE_VERSION?=11.3.1-runtime-ubuntu20.04-gpu-burn
IMAGE_TAG?=boweryfarming/cuda:${IMAGE_VERSION}
GPU_FLAG:=--gpus=all

shell: image
	docker run ${GPU_FLAG} --rm -it ${IMAGE_TAG} bash

burn: image
	docker run --name gpuburn ${GPU_FLAG} --rm ${IMAGE_TAG}

image:
	docker build --tag ${IMAGE_TAG} .
