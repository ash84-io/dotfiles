.PHONY: brew rust python docker jetbrains

home:
	cp ./.* ~/

zsh:
	./zsh.sh

brew:
	./brew.sh 

rust:
	./rust.sh

docker:
	./docker.sh

jetbrains:
	./jetbrains.sh
