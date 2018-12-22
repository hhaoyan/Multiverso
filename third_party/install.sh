# /bin/bash
# install third party library: 1. ZeroMQ

THIRD_PARTY_DIR=$PWD
echo $TARGET_DIR

ZMQ_DIR=zeromq-4.1.3
# 1. Get ZeroMQ
wget http://download.zeromq.org/zeromq-4.1.3.tar.gz
tar -zxf zeromq-4.1.3.tar.gz

# Build ZeroMQ
# Make sure that libtool, pkg-config, build-essential, autoconf and automake
# are installed.
cd $ZMQ_DIR
./configure --prefix=$THIRD_PARTY_DIR --enable-static --disable-shared --without-libsodium
make -j4
make install -j4
cd ..
rm -rf $ZMQ_DIR

# Get the C++ Wrapper zmq.hpp
wget https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq.hpp
mv zmq.hpp $THIRD_PARTY_DIR/include

rm *.tar.gz*
