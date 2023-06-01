cd
sudo apt install -y build-essential cmake gcc-arm-none-eabi git libnewlib-arm-none-eabi 
mkdir code
cd code
git clone https://github.com/raspberrypi/pico-sdk.git
git clone https://github.com/raspberrypi/pico-examples.git
cd pico-sdk
git submodule update --init
cd ../pico-examples
mkdir build
cd build
export PICO_SDK_PATH=../../pico-sdk/
cmake -DPICO_BOARD=pico_w ..
cd pico_w/wifi/blink
make
pwd
ls
