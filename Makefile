.PHONY: help setup serve deploy
POETRY := $(shell command -v poetry 2> /dev/null)

help: ## Get a list of all the targets, from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'

setup:  ## Install latest version of dependencies
ifndef POETRY
	pip3 install --upgrade mkdocs-material
else
	poetry install
 endif

serve:  ## Serve the site locally
ifndef POETRY
	mkdocs serve
else
	poetry run mkdocs serve
endif

deploy:  ## Deploy the website (no need to run -- can just git push)
ifndef POETRY
	mkdocs gh-deploy --force
else
	poetry run mkdocs gh-deploy --force
endif
