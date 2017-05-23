default: help

help:
	@echo -e "Select a sub command \n"
	@echo -e "dep-init: \n\t Install govendor and init vendor (after you cloned this repo)"
	@echo -e "dep-update: \n\t Refresh packages under vendor (when you changed imports packages)"
	@echo -e "build: \n\t Build deployer Docker image"
	@echo -e "run: \n\t Run deployer Docker container"
	@echo -e "push: \n\t Push deployer Docker image to DockerHub"
	@echo -e "\n"
	@echo -e "See README.md for more."

dep-init:
	go get github.com/kardianos/govendor
	govendor init

dep-update:
	govendor remove +unused
	govendor add +external

build:
	docker build -t fanach/deployer .

run:
	docker run --rm -p 8080:8080 fanach/deployer

push:
	docker push fanach/deployer:latest
