build:
	docker build -t sheepdoge/pup-conda .

test: build
	docker run sheepdoge/pup-conda

interactive: build
	docker run -it sheepdoge/pup-conda /bin/bash
