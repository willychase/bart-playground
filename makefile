TEST_PATH=./tests
MODULE_NAME="bart_playground"
CONTAINER_NAME="bart-playground"

init:
	python3 -m venv .pyenv

pyenv:
	source .pyenv/bin/activate

pipreq:
	pip install -r requirements.txt

test:
	pytest --verbose --color=yes ${TEST_PATH}

build:
	docker build . -t ${CONTAINER_NAME}

run:
	docker run -it ${CONTAINER_NAME}