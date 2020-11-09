IMAGE_VERSION := $(shell cat image.yaml | egrep ^version  | cut -d"\"" -f2)
CLIENTS_IMAGE_VERSION := $(shell cat only-clients-overrides.yaml | egrep ^version  | cut -d"\"" -f2)
BUILD_ENGINE := docker

.DEFAULT_GOAL := build

.PHONY: build-all
build-all:	build-tools	build-clients
	
.PHONY: test
test: build
	cekit -v test --overrides-file tutorial-tools-overrides.yaml behave
	cekit -v test --overrides-file only-clients-overrides behave

.PHONY: build-tools
build-tools:		
	cekit build --overrides-file tutorial-tools-overrides.yaml \
	   $(BUILD_ENGINE)  --no-squash --tag=quay.io/rhdevelopers/tutorial-tools:${IMAGE_VERSION}
		 --tag=quay.io/rhdevelopers/tutorial-tools

.PHONY: push-tools
push-tools:	
	$(BUILD_ENGINE) push quay.io/rhdevelopers/tutorial-tools:$(IMAGE_VERSION)
	$(BUILD_ENGINE) push quay.io/rhdevelopers/tutorial-tools

.PHONY:	build-clients
build-clients:	clean
	cekit -v build --overrides-file only-clients-overrides.yaml \
	$(BUILD_ENGINE) \
	--no-squash \
	--tag=quay.io/rhdevelopers/clients:$(CLIENTS_IMAGE_VERSION) \
	--tag=quay.io/rhdevelopers/clients

.PHONY:	push-clients
push-clients:	
	$(BUILD_ENGINE) push quay.io/rhdevelopers/clients:$(CLIENTS_IMAGE_VERSION)

.PHONY: push-all
push-all:
	$(BUILD_ENGINE) push quay.io/rhdevelopers/tutorial-tools:$(IMAGE_VERSION)
	$(BUILD_ENGINE) push quay.io/rhdevelopers/tutorial-tools
	$(BUILD_ENGINE) push quay.io/rhdevelopers/clients:$(CLIENTS_IMAGE_VERSION)
	$(BUILD_ENGINE) push quay.io/rhdevelopers/clients

.PHONY: clean
clean:
	rm -Rf target	