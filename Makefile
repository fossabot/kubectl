build:
	docker build --tag=test .

test-simple: build
	docker run --rm --volume="/$${PWD}/tests:/kube" test ./test.sh

test-kube: build
	docker run --rm --volume="/$${PWD}/tests:/kube" --volume="~.kube/:/root/.kube" test ./test.kube.sh

run: build
	docker build --tag=test . && docker run --rm test /bin/bash
