
echo
echo "clearing path environments"
echo
unset PICO_SDK_PATH
unset PICO_EXTRAS_PATH
unset PIDO_EXAMPLES_PATH

echo
echo "installing dependencies"
echo
sudo apt install -y build-essential cmake gcc-arm-none-eabi git libnewlib-arm-none-eabi

echo
echo "creating the code folder"
echo
cd
mkdir -p code
cd code

echo
echo "cloning the sdk repo"
echo
git clone https://github.com/raspberrypi/pico-sdk.git
export PICO_SDK_PATH=~/code/pico-sdk

echo
echo "installing the sdk submodules"
echo
cd pico-sdk
git submodule update --init

echo
echo "cloning the examples repo"
echo
cd ..
git clone https://github.com/raspberrypi/pico-examples.git
export PICO_EXTRAS_PATH=~/code/pico-sdk

echo
echo "creating the build folder"
echo
cd pico-examples
mkdir build
cd build
export PICO_SDK_PATH=../../pico-sdk/
cmake -DPICO_BOARD=pico_w ..

echo
echo "building the basic blink program"
echo
cd pico_w/wifi/blink
make

echo
echo "copying the blink code to home directory"
echo
cp picow_blink.uf2 ~
ls -l ~
echo
