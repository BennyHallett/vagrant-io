echo "Beginning provision"

echo "  Updating package information"
apt-get -y update #>/dev/null 2>&1

echo "  Installing build tools"
apt-get -y install build-essential #>/dev/null 2>&1

echo "  Installing git"
apt-get -y install git #>/dev/null 2>&1

echo "  Installing cmake"
apt-get -y install cmake #>/dev/null 2>&1

echo "  Cloning yajl"
mkdir -p /opt/yajl
cd /opt/yajl
git clone https://github.com/lloyd/yajl.git

echo "  Building yajl"
cd /opt/yajl/yajl
./configure && make install

echo "  Installing libevent"
apt-get -y install libevent-2.0-5 #>/dev/null 2>&1
apt-get -y install libevent-dev #>/dev/null 2>&1

echo "  Installing pcre"
apt-get -y install libpcre3 #>/dev/null 2>&1
apt-get -y install libpcre3-dev #>/dev/null 2>&1

echo "  Running ldconfig"
ldconfig

echo "  Cloning Io"
mkdir -p /opt/io_lang
cd /opt/io_lang
git clone https://github.com/stevedekorte/io.git

echo "  Building io"
mkdir -p /opt/io_lang/io/build
cd /opt/io_lang/build
cmake ..
make install

echo "  Running vm tests"
cd /opt/io_lang/build
io ../libs/iovm/tests/correctness/run.io
