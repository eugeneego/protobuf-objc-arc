#!/bin/sh
protoc --plugin=./src/compiler/protoc-gen-objc --objc_out=./src/runtime/Tests --proto_path=./src/compiler ./src/compiler/google/protobuf/unittest*.proto