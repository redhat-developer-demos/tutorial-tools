# Tutorial Tools

The repository that holds various linux container images used as part of [Red Hat Developers](https://developers.redhat.com) workshops.

## Pre-req

- All the images are built using [cekit](https://cekit.readthedocs.io/en/latest/getting-started/index.html),check the [installation guide](https://cekit.readthedocs.io/en/latest/handbook/installation/index.html) on how to install.
- Any container runtime like [podman](https://podman.io) or [buildah](https://buildah.io) or [Docker](https://www.docker.com/products/container-runtime)

> **NOTE**: The scripts by default uses docker

## Images

The tool builds three linux container images

1. [tutorial-tools](https://quay.io/repository/rhdevelopers/tutorial-tools?tab=tags)  - This image holds all the tools that are used as part of the Red Hat Developers tutorials e.g. kubectl, oc, stern, yq, jq etc.,

2. [clients](https://quay.io/repository/rhdevelopers/clients?tab=tags) - This image holds the clients that are used in typical Cloud Native Application development such as kubectl, oc(openshift client),yq,jq,kn,tkn,stern etc.,

3. [tutorial-tools-extra](https://quay.io/repository/rhdevelopers/tutorial-tools-extra?tab=tags)  - This image is used for advanced use cases where you want to build containers within containers using tools like buildah and podman etc.,

## Build and Push Images

To build all the images listed above:

```bash
make clean build
```

To build only *tutorial-tools*

```bash
cekit -v build --overrides-file tutorial-tools-overrides.yaml ${BUILD_ENGINE} --no-squash
```

To build only *clients*

```bash
cekit -v build --overrides-file only-clients-overrides.yaml ${BUILD_ENGINE} --no-squash
```

To build only *tutorial-tools-extra*

```bash
cekit -v build --overrides-file extra-tools-overrides.yaml ${BUILD_ENGINE} --no-squash
```

Where `BUILD_ENGINE` could be any one `buildah`, `podman` or `docker`

To push the images to the container registry

```shell
make push
```

It is also possible to push individual images using the same technique as build

