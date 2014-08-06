#!/bin/sh
protoc --plugin=./src/compiler/protoc-gen-objc --objc_out=./src/runtime/Classes --proto_path=./src/compiler ./src/compiler/google/protobuf/descriptor.proto
protoc --plugin=./src/compiler/protoc-gen-objc --objc_out=./src/compiler --proto_path=./src/compiler ./src/compiler/google/protobuf/objectivec-descriptor.proto
protoc --plugin=./src/compiler/protoc-gen-objc --objc_out=./src/runtime/Tests --proto_path=./src/compiler ./src/compiler/google/protobuf/unittest*.proto