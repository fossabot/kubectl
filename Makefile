VERSION=1.16.2
IMAGETAG=kubectl:${VERSION}

build:
	docker build --tag=${IMAGETAG} .

test: build
	docker run --rm --volume="/$${PWD}/tests:/kube" ${IMAGETAG} ./test.sh

test-kube: build
	docker run --rm --volume="/$${PWD}/tests:/kube" --volume="~.kube/:/root/.kube" ${IMAGETAG} ./test.kube.sh

test-hello: build
	docker run --rm ${IMAGETAG} -c "echo HELLO WORLD"

run: build
	docker run --rm -it ${IMAGETAG} $(args)
