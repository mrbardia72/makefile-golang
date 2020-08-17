LOGFILE=$(LOGPATH) `date +'%A-%b-%d-%Y-%H-%M-%S'`

.PHONY: help
help: ## This help for cmd.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help

.PHONY: commit
commit: ## commit to github exp. run--- make commit m="your-message"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	git add .
	git commit -m "$m-${LOGFILE}"
	git push -u origin master 


.PHONY: push
git-push: ## push to github exp. run--- make push m="your-message" $u="https://github.com/your-username/your-repository.git"
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
lara: ## create project laravel... make lara n="your-name-app"
	toilet -F border -F gay "LARAVEL"
	composer create-project --prefer-dist laravel/laravel $n

.PHONY: php
php: ## run laravel
	toilet -F border -F gay "LARAVEL"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	php artisan serve

.PHONY: js
js: ## run npm 
	toilet -F border -F gay "VUEJS"
	npm run watch

.PHONY: clear-cache
clear-cache: ## clear cache and har reload
	toilet -F border -F gay "CHACHE"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	xdotool search --onlyvisible --class Chrome windowfocus key F5

.PHONY: install
install: ## install package.js and composer.json
	composer install
	sudo npm install

.PHONY: dumpautoload
dumpautoload: ## dumpautoload

	toilet -F border -F gay "dumpautoload"
	php artisan optimize:clear
	php artisan config:clear
	php artisan cache:clear
	php artisan config:cache
	xdotool search --onlyvisible --class Chrome windowfocus key F5
	composer dumpautoload

.PHONY: vue
vue: ## generate ui vue
	toilet -F border -F gay "VUE"
	php artisan ui vue --auth
	npm i
	npm run dev
	php artisan key:generate
	php artisan serve

.PHONY: react
react: ## generate ui react
	toilet -F border -F gay "REACT"
	php artisan ui react --auth
	npm i
	npm run dev
	php artisan key:generate
	php artisan serve

.PHONY: bts
bts: ## generate ui bootstrap
	toilet -F border -F gay "bootstrap"
	php artisan ui bootstrap --auth
	npm i
	npm run dev
	php artisan key:generate
	php artisan serve