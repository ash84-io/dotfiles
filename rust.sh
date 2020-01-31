#!/bin/bash
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# todo: add path to .zshrc 


# install system packages 
cargo install exa
cargo install fd
cargo install du-dust
