.PHONY: brew rust python docker jetbrains

home
	cp ./.* ~/

zsh:
	zsh.sh

brew:
	brew.sh 

rust:
	rush.sh

python:
	python.sh

docker:
	docker.sh

jetbrains:
	jetbrains.sh
