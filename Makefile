build:
	docker build --tag=test .

test-alias: build
	docker run --rm --volume="/$${PWD}/tests:/kube" test ./test.sh

test-kube: build
	docker run --rm --volume="/$${PWD}/tests:/kube" --volume="~.kube/:/root/.kube" test ./test.kube.sh

run-ls: build
	docker run --rm test ls -al /
