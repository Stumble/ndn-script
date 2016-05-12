sudo apt-get install -y build-essential libcrypto++-dev libsqlite3-dev libboost-all-dev
git clone https://github.com/named-data/ndn-cxx
cd ndn-cxx
./waf configure --with-examples --boost-lib /usr/lib/arm-linux-gnueabihf/
./waf
sudo ./waf install
sudo ldconfig

cd ..

git clone --recursive https://github.com/named-data/NFD
cd NFD
./waf configure --without-websocket --without-libpcap --boost-lib /usr/lib/arm-linux-gnueabihf/
./waf
sudo ./waf install
sudo ldconfig

sudo cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf
