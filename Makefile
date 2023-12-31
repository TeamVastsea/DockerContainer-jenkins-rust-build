IMAGE_NAME=jenkins-rust-build
IMAGE_VERSION=v1.0.0
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .

run:
	docker run -it --name $(IMAGE_NAME) -d $(IMAGE_NAME):$(IMAGE_VERSION)

exec:
	docker exec -it $(IMAGE_NAME) bash