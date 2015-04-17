echo "Beginning provision"

echo "  Updating package information"
apt-get -y update >/dev/null 2>&1

echo "  Installing build tools"
apt-get -y install build-essential >/dev/null 2>&1

echo "  Installing yajl"
apt-get -y install yajl > /dev/null 2>&1

echo "  Installing libevent"
apt-get -y install libevent > /dev/null 2>&1

echo "  Installing pcre"
apt-get -y install pcre > /dev/null 2>&1

echo "  Running ldconfig"
ldconfig

echo "  Installing git"
apt-get -y install git > /dev/null 2>&1

echo "  Cloning Io"
mkdir -p /opt/io_lang
cd /opt/io_lang
git clone https://github.com/stevedekorte/io.git

echo "  Building io"
mkdir -p /opt/io_lang/build
cd /opt/io_lang/build
cmake ..
make install

echo "  Running vm tests"
cd /opt/io_lang/build
io ../libs/iovm/tests/correctness/run.io
