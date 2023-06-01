# install dependencies
sudo apt install -y build-essential cmake gcc-arm-none-eabi git libnewlib-arm-none-eabi

# create the code folder
cd
mkdir -p code
cd code

# clone the sdk
git clone https://github.com/raspberrypi/pico-sdk.git

# install the sdk submodules
cd pico-sdk
git submodule update --init

# clone the examples
cd ..
git clone https://github.com/raspberrypi/pico-examples.git

# create the build
cd pico-examples
mkdir build
cd build
export PICO_SDK_PATH=../../pico-sdk/
cmake -DPICO_BOARD=pico_w ..

# build the basic blink program
cd pico_w/wifi/blink
make

# copy to home directory and display
cp picow_blink.uf2 ~
echo
ls -1
echo
