# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOGET=$(GOCMD) get
REPO=argoprojdemo
BINARY_NAME=argo-cd-hello-world-app
GIT_VERSION=$(shell git rev-parse HEAD)

all: clean build
build: 
	$(GOBUILD) -o $(BINARY_NAME) -v
clean: 
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./...
	./$(BINARY_NAME)
docker-build: build
	docker build -t $(REPO)/$(BINARY_NAME):$(GIT_VERSION) .
publish: docker-build
	docker push $(REPO)/$(BINARY_NAME):$(GIT_VERSION)
