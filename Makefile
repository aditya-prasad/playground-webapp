NAME := playground-webapp
DOCKER_REPO := gcr.io/okcredit-42/webapp

docker:
	docker build -t $(NAME) .

docker-run: docker
	docker run \
	    -v "$$(pwd)/public/config:/webapp/config" \
	    -p "80:80" \
	    $(NAME)

docker-push: TAG ?= latest
docker-push: docker
	docker tag $(NAME) $(DOCKER_REPO):$(TAG)
	docker push $(DOCKER_REPO):$(TAG)