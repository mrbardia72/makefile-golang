LOGFILE=$(LOGPATH) `date +'%A-%b-%d-%Y-%H-%M-%S'`

.PHONY: help
help: ## This help for cmd.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help

.PHONY: commit
commit: ## commit to github exp. run--- make commit m="your-message"
	git add .
	git commit -m "$m-${LOGFILE}"
	git push -u origin master 

.PHONY: git-push
git-push: ## push to github exp. run--- make git-push m="your-message" $u="https://github.com/your-user-name/your-repository.git"
	git init
	git add .
	git commit -m "$m-${LOGFILE}"
	git remote add origin $u
	git pull --rebase origin master
	git push origin master

.PHONY: run
run: ## run application django
	find -name "__pycache__" -type d -exec rm -rf {} \;
	python3 manage.py runserver

.PHONY: pjt
pjt: ## create django project ... make pjt n="my-name-project" m="my-name-app"
	django-admin startproject $n
	cd $n
	python3 manage.py startapp $m