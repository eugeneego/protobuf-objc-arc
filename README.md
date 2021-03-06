# Protocol Buffers 2.5, Objective-C with ARC

This is an ARC enabled version of the [Protocol Buffers in Objective C][protobuf-objc] project. It supports Protobuf 2.5.

Protocol Buffers are a way of encoding structured data in an efficient yet extensible format.
This project is based on an implementation of Protocol Buffers from Google.  See the
[Google protobuf project][g-protobuf] for more information.

[g-protobuf]: http://code.google.com/p/protobuf/
[protobuf-objc]: https://github.com/booyah/protobuf-objc

##Build

### Install dependencies

    brew install autoconf
    brew install automake
    brew install libtool
    brew install protobuf

### Make

    make clean
    ./autogen.sh
    ./configure
    make
    make install

## Use

### Compile proto files

    protoc --plugin=/usr/local/bin/protoc-gen-objc ./person.proto --objc_out=./

### Integrate runtime files into project
    
    pod "Protobuf-objc-arc", :git => "https://github.com/eugeneego/protobuf-objc-arc.git"

## Credits

InSports, Inc.
-------------------------------------------------------------------------------
- Greg Arakelian <greg@arakelian.com>

Regwez Inc.
-------------------------------------------------------------------------------
- Ragy Eleish <ragy@regwez.com>

Booyah Inc.
-------------------------------------------------------------------------------
- Jon Parise <jon@booyah.com>


Google Protocol Buffers, Objective C
-------------------------------------------------------------------------------
- Cyrus Najmabadi  (http://code.google.com/p/metasyntactic/wiki/ProtocolBuffers)
- Sergey Martynov  (http://github.com/martynovs/protobuf-objc)


Google Protocol Buffers
-------------------------------------------------------------------------------
- Kenton Varda, Sanjay Ghemawat, Jeff Dean, and others