# get the kernal module here
sudo apt-get install -y linux-modules-extra-$(uname -r)

# create vcan0 device
sudo modprobe can
sudo modprobe vcan
sudo ip link add dev vcan0 type vcan
sudo ip link set up vcan0
