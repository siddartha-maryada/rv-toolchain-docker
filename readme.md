# rv-toolchain-docker

A straightforward dockerfile to get the risc-v toolchain built for all possible abi/arch configurations. Includes a script to generate a `bin` directory that can be added to your path, with a wrapper script for each of the gcc commands that calls into docker with the current working directory mapped.

RISCV toolchain setup is not always trivial.  Thus packaged the RISCV toolchain into a docker image. Running make inside docker, opens this project up inside docker container, which has RISCV toolchain, and build the project. A good way to make sure, its reproducible.

## How To Use

### 1. Build docker image locally.
Clone the riscv-gnu-toolchain repo, locally and run the following command from the root of the repo.
```shell script
git clone https://github.com/riscv/riscv-gnu-toolchain --recursive --depth 1 /riscv/
```

Once the git repo is cloned, run the following command from the root of the repo.
```shell script
docker build -t rv-toolchain-docker .
```

### 2. Build the xv6-riscv project inside the docker image

Once the docker image is built locally, ready to be used. Go to the root of the `xv6-riscv` project and run the following command. Takes around 25 minutes to build.


  ```shell script
  docker run --rm -v $(pwd):/project -w /project -it rv-toolchain-docker:latest make
  ```
