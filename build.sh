#!/bin/sh

#clean
#rm -R -f ./gcc-cc/ ./sources/ ./build/



#sudo apt install -y git build-essential
#sudo apt install -y bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo libisl-dev 
#sudo apt install -y libcloog-isl-dev

mkdir -p ./sources ./build ./gcc-cc

#git clone git://sourceware.org/git/binutils-gdb.git ./sources/binutils-src 
#git clone https://github.com/gcc-mirror/gcc.git .sources/gcc-src

#git clone https://github.com/geenvenstersos/barebones_tutorial ./sources/binutils-src
#git clone https://github.com/geenvenstersos/barebones_tutorial ./sources/gcc-src

mkdir -p ./build/binutils-build ./build/gcc-build

export PREFIX="$PWD/gcc-cc/"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

echo "PREFIX: $PREFIX"
echo "TARGET: $TARGET"
echo "PATH: $PATH"


cd ./build/binutils-build
echo "PWD: $PWD"

echo '>>>>>>>>>>>> BINUTILS'
../../sources/binutils-src/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
#make
#make install


#GCC part
echo '>>>>>>>>>>>>> GCC'

which -- $TARGET-as || echo $TARGET-as is not in the PATH
 
cd ../gcc-build
echo "PWD: $PWD"
../../sources/gcc-src/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
#make all-gcc
#make all-target-libgcc
#make install-gcc
#make install-target-libgcc
