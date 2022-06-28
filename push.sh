#!/bin/bash

docker login -u peco602
docker tag rust-universal-compiler:latest peco602/rust-universal-compiler:latest
docker push peco602/rust-universal-compiler:latest