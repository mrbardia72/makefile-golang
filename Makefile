# import config.
# You can change the default config with `make cnf="config_special.env" build`
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

version_golang=$(shell ./version.sh)
msg_commit=$(shell ./date.sh)

.PHONY: proto
proto: ## proto the proto file.
	protoc --proto_path=proto proto/basketball.proto --go_out=plugins=grpc:pb
 
.PHONY: server
server: ## Build and run server.
	go build -o bin/server server/main.go
	bin/server
 
.PHONY: client
client: ## Build and run client.
	go build -o bin/client client/main.go
	bin/client

.PHONY: dep
dep: ## Get the dependencies
	go get -v -d ./...

.PHONY: pkg 
pkg: ## list all pkg golang
	go list ./...

.PHONY: api
api: ## api structur

	@mkdir -vp '$(cmd_s)' '$(cmd_c)' '$(service_s)' '$(service_c)' 'pb' 'config' 'models' '$(repo_user)'

	echo "$(main_pkg)" >> $(cmd_c)/main.go
	echo "$(main_pkg)" >> $(cmd_s)/main.go

	echo "$(main_pkg)" >> $(service_c)/main.go
	echo "$(main_pkg)" >> $(service_s)/main.go

	echo "$(REPO_PKG)" >> $(repo_user)/create.go
	echo "$(REPO_PKG)" >> $(repo_user)/update.go
	echo "$(REPO_PKG)" >> $(repo_user)/find.go
	echo "$(REPO_PKG)" >> $(repo_user)/delete.go
	echo "$(REPO_PKG)" >> $(repo_user)/getall.go
	echo "$(REPO_PKG)" >> $(repo_user)/search.go

.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help
$(info $v your version golang is [${version_golang}])

.PHONY: docker-build
docker-build: ## docker build
	CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o your-name-app
	docker build -t $(TAG) -t $(TAG):$(VER) .

.PHONY: docker-run
docker-run: ## docker run
	docker run -d -p 80:80 -e PORT=80 --name=$(NAME) $(TAG)
	docker run -ti --rm --link $(NAME):$(NAME)

.PHONY: docker-clean
clean: ## docker clean
	-docker stop $(NAME)
	-docker rm $(NAME)

.PHONY: docker-push
docker-push: ## docker push
	docker push $(TAG)
	docker push $(TAG):$(VER)

.PHONY: commit
commit: ## commit to github exp. run--- make commit m="your message"
	git add .
	git commit -m "$m-${msg_commit}"
	git push -u origin master 


.PHONY: git-push
git-push: ## push to github exp. run--- make git-push m="your message" $u="https://github.com/mrbardia72/makefile-golang.git"
	git init
	git add .
	git commit -m "$m"
	git remote add origin $u
	git pull --rebase origin master
	git push origin master 