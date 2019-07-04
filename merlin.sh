KERNEL_DIR=$PWD
#Anykernel_DIR=$KERNEL_DIR/Anykernel2/merlin
#TOOLCHAINDIR=$(pwd)/toolchain/linaro-7.2
TOOLCHAINDIR=/home/KERNEL/toolchain/linaro-7.3.1
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Life-Of"
DEVICE="-Merlin"
VER="-v0"
TYPE="-OREO"


export ARCH=arm
export KBUILD_BUILD_USER="archer"
export KBUILD_BUILD_HOST="LIFE_OF_MERLIN"
export CROSS_COMPILE=$TOOLCHAINDIR/bin/arm-eabi-
export USE_CCACHE=1

if [ -e  arch/arm/boot/zImage ];
then
rm arch/arm/boot/zImage #Just to make sure it doesn't make flashable zip with previous zImage
fi;

echo "Making kernel binary"
make merlin_defconfig
make menuconfig
make clean
make -j$( nproc --all ) zImage

if [ -e  arch/arm/boot/zImage ];
then
echo "Kernel compilation completed"

1
fi;
