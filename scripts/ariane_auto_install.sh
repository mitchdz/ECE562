#!/bin/bash

#Install required libraries (requires sudo)

if [[ "$*" == *--sudo* ]]; then
	sudo apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk git build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev libusb-1.0-0-dev device-tree-compiler pkg-config libexpat-dev verilator
fi

mkdir ~/riscv

pushd ~/riscv

	#Start by installing riscv-gnu-toolchain
	git clone --recursive https://github.com/riscv/riscv-gnu-toolchain

	pushd ~/riscv/riscv-gnu-toolchain

		if [[ "$*" == *--sudo* ]]; then
			./configure --prefix=/opt/riscv
			sudo make

			sudo cp -r /opt/riscv/ ~/riscv/riscv_gnu_build
		else
			./configure --prefix=~/riscv/riscv_gnu_build
			make
		fi
	popd


	#Install riscv-tools
	git clone https://github.com/riscv/riscv-tools.git

	pushd ~/riscv/riscv-tools

		git submodule update --init --recursive
		export RISCV=~/riscv/riscv_gnu_build/bin/

		echo "export RISCV=~/riscv/riscv_gnu_build/bin/
		export PATH=~/riscv/riscv_gnu_build/bin/:$PATH" >> ~/.bashrc

		./build.sh
	popd

	
	#Install Ariane
	git clone https://github.com/pulp-platform/ariane.git

	pushd ~/riscv/ariane

		git submodule update --init --recursive
		make verilate
	popd


	#Install RISC-V pk
	git clone https://github.com/riscv/riscv-pk.git
	
	pushd ~/riscv/riscv-pk

		mkdir build

		pushd ~/riscv/riscv-pk/build

			../configure --prefix=$RISCV --host=riscv64-unknown-elf
			make
			make install
		popd
	popd

	#Run hello world test
	mkdir test_install
	
	pushd ~/riscv/test_install

		echo '
			#include <stdio.h>

			int main(int argc, char const *argv[]) {
			    printf("Hello Ariane!\\n");
			    return 0;
			}' > hello.c

		riscv64-unknown-elf-gcc hello.c -o hello.elf

		../ariane/work-ver/Variane_testharness $RISCV/riscv64-unknown-elf/bin/pk hello.elf
	popd
popd