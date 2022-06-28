![Test](https://github.com/Peco602/rust-universal-compiler/actions/workflows/test.yml/badge.svg)

# Rust Universal Compiler Docker image

Container solution to compile Rust projects for Linux, macOS and Windows.


## Build the image

```ps1
docker build -t rust-universal-compiler:latest .
```

## Configure the project

To allow cross-compilation from Linux to Windows and MacOS it is necessary to create in the project folder the `.cargo/config` file with the following lines:

```ini
[target.x86_64-pc-windows-msvc]
rustflags = ["-C", "target-feature=+crt-static"]

[target.x86_64-apple-darwin]
linker = "x86_64-apple-darwin14-clang"
ar = "x86_64-apple-darwin14-ar"
```

## Build the project

Compile for Linux (`x86_64-unknown-linux-gnu`):

```bash
docker run --rm -v $PWD/test-project:/app -w /app rust-universal-compiler:latest cargo build --target x86_64-unknown-linux-gnu --release
```

Compile for MacOS (`x86_64-apple-darwin`):

```bash
docker run --rm -v $PWD/test-project:/app -w /app rust-universal-compiler:latest cargo build --target x86_64-apple-darwin --release
```

Compile for Windows (`x86_64-pc-windows-msvc`):

```bash
docker run --rm -v $PWD/test-project:/app -w /app rust-universal-compiler:latest cargo build --target x86_64-pc-windows-msvc --release
```

## DockerHub

- [peco602/rust-universal-compiler](https://hub.docker.com/repository/docker/peco602/rust-universal-compiler)


## Bibliography

- https://github.com/Jake-Shadle/xwin
- https://wapl.es/rust/2019/02/17/rust-cross-compile-linux-to-macos.html