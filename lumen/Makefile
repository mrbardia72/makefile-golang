LOGFILE=$(LOGPATH) `date +'%A-%b-%d-%Y-%H-%M-%S'`

.PHONY: help
help: ## This help for cmd.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help

.PHONY: commit
commit: ## commit to gitlab exp. run--- make commit m="your-msg"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	git add .
	git commit -m "$m-${LOGFILE}"
	git push 

.PHONY: push
git-push: ## push to gitlab exp. run--- make push m="your-message" $u="https://gitlab.com/your-username/your-repository.git"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	git init
	git add .
	git commit -m "$m-${LOGFILE}"
	git remote add origin $u
	git pull --rebase origin master
	git push origin master

.PHONY: lara
lara: ## create project lumen...> make lara n="your-name-app"
	composer create-project --prefer-dist laravel/lumen $n

.PHONY: php
php: ## run lumen
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	php -S localhost:8000 -t public

.PHONY: cache
cache: ## clear cache and har reload
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	
.PHONY: install
install: ## install composer.json
	composer install

.PHONY: dumpautoload
dumpautoload: ## dumpautoload
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	composer dumpautoload

.PHONY: remote
remote: ## run ... >  make remote n="https://gitlab.com/author-username/author-repository.git" m="your-name-branche"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	git remote add upstream $n
	git checkout -b $m
	git push origin $m
	git add .
	git commit -m "your-msg"
	git push --set-upstream origin $m

.PHONY: push-remote
push-remote: ## run ...> make push-remote m="your-name-branche"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	git add .
	git commit -m "bardia-${LOGFILE}"
	git push --set-upstream origin $m
	