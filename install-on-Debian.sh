
if ! sudo true
then
  echo 'Unable to obtain superuser privilege'
  exit 2
fi

sudo apt-get install -y build-essential libcrypto++-dev libsqlite3-dev libboost-all-dev libssl-dev pkg-config

git clone https://github.com/named-data/ndn-cxx
cd ndn-cxx
./waf configure --with-examples
./waf

sudo ./waf install
sudo ldconfig

cd ..

git clone --recursive https://github.com/named-data/NFD
cd NFD
./waf configure --without-websocket --without-libpcap
./waf
sudo ./waf install
sudo ldconfig

sudo cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf
