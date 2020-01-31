#!/bin/bash
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add path to .profile
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.profile

# install system packages 
cargo install exa
cargo install fd
cargo install du-dust
