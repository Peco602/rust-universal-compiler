#!/bin/bash

IMAGE_NAME="rust-universal-compiler:latest"
PROJECT_FOLDER="test-project"

echo " [+] Building docker image"
docker build -t $IMAGE_NAME .

targets=( "x86_64-unknown-linux-gnu" "x86_64-apple-darwin" "x86_64-pc-windows-msvc" )
i=0
len=${#targets[@]}
while [ $i -lt $len ];
do
    echo " [+] Compiling for target: ${targets[$i]}"
    docker run --rm -v $PWD/$PROJECT_FOLDER:/app -w /app rust-universal-compiler:latest cargo build --target ${targets[$i]} --release
    let i++
done