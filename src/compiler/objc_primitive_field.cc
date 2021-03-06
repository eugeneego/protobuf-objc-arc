// Protocol Buffers for Objective C
//
// Copyright 2010 Booyah Inc.
// Copyright 2008 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "objc_primitive_field.h"

#include <map>
#include <string>
#include <inttypes.h>

#include <google/protobuf/stubs/common.h>
#include <google/protobuf/io/printer.h>
#include <google/protobuf/wire_format.h>
#include <google/protobuf/wire_format_lite_inl.h>
#include <google/protobuf/stubs/strutil.h>
#include <google/protobuf/stubs/substitute.h>

#include "objc_helpers.h"

namespace google {
namespace protobuf {
namespace compiler {
namespace objectivec {

using internal::WireFormat;
using internal::WireFormatLite;

namespace {

const char *PrimitiveTypeName(const FieldDescriptor *field)
{
  switch(field->type()) {
    case FieldDescriptor::TYPE_INT32:
      return "int32_t";
    case FieldDescriptor::TYPE_UINT32:
      return "uint32_t";
    case FieldDescriptor::TYPE_SINT32:
      return "int32_t";
    case FieldDescriptor::TYPE_FIXED32:
      return "uint32_t";
    case FieldDescriptor::TYPE_SFIXED32:
      return "int32_t";
    case FieldDescriptor::TYPE_INT64:
      return "int64_t";
    case FieldDescriptor::TYPE_UINT64:
      return "uint64_t";
    case FieldDescriptor::TYPE_SINT64:
      return "int64_t";
    case FieldDescriptor::TYPE_FIXED64:
      return "uint64_t";
    case FieldDescriptor::TYPE_SFIXED64:
      return "int64_t";
    case FieldDescriptor::TYPE_FLOAT:
      return "Float32";
    case FieldDescriptor::TYPE_DOUBLE:
      return "Float64";
    case FieldDescriptor::TYPE_BOOL:
      return "BOOL";
    case FieldDescriptor::TYPE_STRING:
      return "NSString";
    case FieldDescriptor::TYPE_BYTES:
      return "NSData";
    default:
      return NULL;
  }
  GOOGLE_LOG(FATAL) << "Can't get here.";
  return NULL;
}

const char *PrimitiveTypeStringFormat(const FieldDescriptor *field)
{
  switch(field->type()) {
    case FieldDescriptor::TYPE_INT32:
      return "%"PRId32;
    case FieldDescriptor::TYPE_UINT32:
      return "%"PRIu32;
    case FieldDescriptor::TYPE_SINT32:
      return "%"PRId32;
    case FieldDescriptor::TYPE_FIXED32:
      return "%"PRIu32;
    case FieldDescriptor::TYPE_SFIXED32:
      return "%"PRId32;
    case FieldDescriptor::TYPE_INT64:
      return "%"PRId64;
    case FieldDescriptor::TYPE_UINT64:
      return "%"PRIu64;
    case FieldDescriptor::TYPE_SINT64:
      return "%"PRId64;
    case FieldDescriptor::TYPE_FIXED64:
      return "%"PRIu64;
    case FieldDescriptor::TYPE_SFIXED64:
      return "%"PRId64;
    case FieldDescriptor::TYPE_FLOAT:
      return "%f";
    case FieldDescriptor::TYPE_DOUBLE:
      return "%f";
    case FieldDescriptor::TYPE_BOOL:
      return "%d";
    default:
      return "%@";
  }
  GOOGLE_LOG(FATAL) << "Can't get here.";
  return NULL;
}

const char *GetArrayValueTypeName(const FieldDescriptor *field)
{
  switch(field->type()) {
    case FieldDescriptor::TYPE_INT32:
      return "int32";
    case FieldDescriptor::TYPE_UINT32:
      return "uint32";
    case FieldDescriptor::TYPE_SINT32:
      return "int32";
    case FieldDescriptor::TYPE_FIXED32:
      return "uint32";
    case FieldDescriptor::TYPE_SFIXED32:
      return "int32";
    case FieldDescriptor::TYPE_INT64:
      return "int64";
    case FieldDescriptor::TYPE_UINT64:
      return "uint64";
    case FieldDescriptor::TYPE_SINT64:
      return "int64";
    case FieldDescriptor::TYPE_FIXED64:
      return "uint64";
    case FieldDescriptor::TYPE_SFIXED64:
      return "int64";
    case FieldDescriptor::TYPE_FLOAT:
      return "float";
    case FieldDescriptor::TYPE_DOUBLE:
      return "double";
    case FieldDescriptor::TYPE_BOOL:
      return "bool";
    /*
    case FieldDescriptor::TYPE_STRING:
    case FieldDescriptor::TYPE_BYTES:
    case FieldDescriptor::TYPE_ENUM:
    case FieldDescriptor::TYPE_GROUP:
    case FieldDescriptor::TYPE_MESSAGE:
      return "object";
    */
  }
  GOOGLE_LOG(FATAL) << "Can't get here.";
  return NULL;
}

const char *GetCapitalizedArrayValueTypeName(const FieldDescriptor *field)
{
  switch(field->type()) {
    case FieldDescriptor::TYPE_INT32:
      return "Int32";
    case FieldDescriptor::TYPE_UINT32:
      return "Uint32";
    case FieldDescriptor::TYPE_SINT32:
      return "Int32";
    case FieldDescriptor::TYPE_FIXED32:
      return "Uint32";
    case FieldDescriptor::TYPE_SFIXED32:
      return "Int32";
    case FieldDescriptor::TYPE_INT64:
      return "Int64";
    case FieldDescriptor::TYPE_UINT64:
      return "Uint64";
    case FieldDescriptor::TYPE_SINT64:
      return "Int64";
    case FieldDescriptor::TYPE_FIXED64:
      return "Uint64";
    case FieldDescriptor::TYPE_SFIXED64:
      return "Int64";
    case FieldDescriptor::TYPE_FLOAT:
      return "Float";
    case FieldDescriptor::TYPE_DOUBLE:
      return "Double";
    case FieldDescriptor::TYPE_BOOL:
      return "Bool";
    /*
    case FieldDescriptor::TYPE_STRING:
    case FieldDescriptor::TYPE_BYTES:
    case FieldDescriptor::TYPE_ENUM:
    case FieldDescriptor::TYPE_GROUP:
    case FieldDescriptor::TYPE_MESSAGE:
      return "Object";
    */
  }
  GOOGLE_LOG(FATAL) << "Can't get here.";
  return NULL;
}

const char *GetCapitalizedType(const FieldDescriptor *field)
{
  switch(field->type()) {
    case FieldDescriptor::TYPE_INT32:
      return "Int32";
    case FieldDescriptor::TYPE_UINT32:
      return "UInt32";
    case FieldDescriptor::TYPE_SINT32:
      return "SInt32";
    case FieldDescriptor::TYPE_FIXED32:
      return "Fixed32";
    case FieldDescriptor::TYPE_SFIXED32:
      return "SFixed32";
    case FieldDescriptor::TYPE_INT64:
      return "Int64";
    case FieldDescriptor::TYPE_UINT64:
      return "UInt64";
    case FieldDescriptor::TYPE_SINT64:
      return "SInt64";
    case FieldDescriptor::TYPE_FIXED64:
      return "Fixed64";
    case FieldDescriptor::TYPE_SFIXED64:
      return "SFixed64";
    case FieldDescriptor::TYPE_FLOAT:
      return "Float";
    case FieldDescriptor::TYPE_DOUBLE:
      return "Double";
    case FieldDescriptor::TYPE_BOOL:
      return "Bool";
    case FieldDescriptor::TYPE_STRING:
      return "String";
    case FieldDescriptor::TYPE_BYTES:
      return "Data";
    case FieldDescriptor::TYPE_ENUM:
      return "Enum";
    case FieldDescriptor::TYPE_GROUP:
      return "Group";
    case FieldDescriptor::TYPE_MESSAGE:
      return "Message";
  }
  GOOGLE_LOG(FATAL) << "Can't get here.";
  return NULL;
}

// For encodings with fixed sizes, returns that size in bytes.  Otherwise
// returns -1.
int FixedSize(FieldDescriptor::Type type)
{
  switch(type) {
    case FieldDescriptor::TYPE_INT32:
      return -1;
    case FieldDescriptor::TYPE_INT64:
      return -1;
    case FieldDescriptor::TYPE_UINT32:
      return -1;
    case FieldDescriptor::TYPE_UINT64:
      return -1;
    case FieldDescriptor::TYPE_SINT32:
      return -1;
    case FieldDescriptor::TYPE_SINT64:
      return -1;
    case FieldDescriptor::TYPE_FIXED32:
      return WireFormatLite::kFixed32Size;
    case FieldDescriptor::TYPE_FIXED64:
      return WireFormatLite::kFixed64Size;
    case FieldDescriptor::TYPE_SFIXED32:
      return WireFormatLite::kSFixed32Size;
    case FieldDescriptor::TYPE_SFIXED64:
      return WireFormatLite::kSFixed64Size;
    case FieldDescriptor::TYPE_FLOAT:
      return WireFormatLite::kFloatSize;
    case FieldDescriptor::TYPE_DOUBLE:
      return WireFormatLite::kDoubleSize;
    case FieldDescriptor::TYPE_BOOL:
      return WireFormatLite::kBoolSize;
    case FieldDescriptor::TYPE_ENUM:
      return -1;
    case FieldDescriptor::TYPE_STRING:
      return -1;
    case FieldDescriptor::TYPE_BYTES:
      return -1;
    case FieldDescriptor::TYPE_GROUP:
      return -1;
    case FieldDescriptor::TYPE_MESSAGE:
      return -1;
    // No default because we want the compiler to complain if any new
    // types are added.
  }
  GOOGLE_LOG(FATAL) << "Can't get here.";
  return -1;
}

void SetPrimitiveVariables(const FieldDescriptor *descriptor, map<string, string> *variables)
{
  std::string name = UnderscoresToCamelCase(descriptor);
  (*variables)["classname"] = ClassName(descriptor->containing_type());
  (*variables)["name"] = name;
  (*variables)["capitalized_name"] = UnderscoresToCapitalizedCamelCase(descriptor);
  (*variables)["number"] = SimpleItoa(descriptor->number());
  (*variables)["type"] = PrimitiveTypeName(descriptor);
  (*variables)["type_format"] = PrimitiveTypeStringFormat(descriptor);

  if(IsPrimitiveType(GetObjectiveCType(descriptor))) {
    (*variables)["storage_type"] = PrimitiveTypeName(descriptor);
    (*variables)["storage_attribute"] = "";
  } else {
    (*variables)["storage_type"] = string(PrimitiveTypeName(descriptor)) + " *";
    if(IsRetainedName(name)) {
      (*variables)["storage_attribute"] = " NS_RETURNS_NOT_RETAINED";
    } else {
      (*variables)["storage_attribute"] = "";
    }
  }

  if(!IsObjectArray(descriptor)) {
    (*variables)["array_value_type"] = GetArrayValueType(descriptor);
    (*variables)["array_value_type_name"] = GetArrayValueTypeName(descriptor);
    (*variables)["array_value_type_name_cap"] = GetCapitalizedArrayValueTypeName(descriptor);
  }

  (*variables)["default"] = DefaultValue(descriptor);
  (*variables)["capitalized_type"] = GetCapitalizedType(descriptor);

  (*variables)["tag"] = SimpleItoa(WireFormat::MakeTag(descriptor));
  (*variables)["tag_size"] = SimpleItoa(WireFormat::TagSize(descriptor->number(), descriptor->type()));

  int fixed_size = FixedSize(descriptor->type());
  if(fixed_size != -1) {
    (*variables)["fixed_size"] = SimpleItoa(fixed_size);
  }
}

}  // namespace


PrimitiveFieldGenerator::PrimitiveFieldGenerator(const FieldDescriptor *descriptor)
  : descriptor_(descriptor)
{
  SetPrimitiveVariables(descriptor, &variables_);
}


PrimitiveFieldGenerator::~PrimitiveFieldGenerator()
{
}


void PrimitiveFieldGenerator::GenerateHasFieldHeader(io::Printer *printer) const
{
  printer->Print(variables_,
    "BOOL _has$capitalized_name$:1;\n");
}


void PrimitiveFieldGenerator::GenerateFieldHeader(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateHasPropertyHeader(io::Printer *printer) const
{
}

void PrimitiveFieldGenerator::GeneratePropertyHeader(io::Printer *printer) const
{
  if(IsReferenceType(GetObjectiveCType(descriptor_))) {
    printer->Print(variables_,
      "@property (nonatomic, strong)$storage_attribute$ $storage_type$$name$;\n");
  } else {
    printer->Print(variables_,
      "@property (nonatomic) $storage_type$ $name$;\n");
  }

  printer->Print(variables_,
    "- (void)clear$capitalized_name$;\n"
    "- (BOOL)has$capitalized_name$;\n\n");
}


void PrimitiveFieldGenerator::GenerateExtensionSource(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateSynthesizeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "- (BOOL)has$capitalized_name$\n"
    "{\n"
    "  return _has$capitalized_name$;\n"
    "}\n\n");

  if(IsReferenceType(GetObjectiveCType(descriptor_))) {
    printer->Print(variables_,
      "- (void)set$capitalized_name$:($storage_type$)value\n"
      "{\n"
      "  _has$capitalized_name$ = value != nil;\n"
      "  _$name$ = value;\n"
      "}\n\n");
  } else {
    printer->Print(variables_,
      "- (void)set$capitalized_name$:($storage_type$)value\n"
      "{\n"
      "  _has$capitalized_name$ = YES;\n"
      "  _$name$ = value;\n"
      "}\n\n");
  }

  printer->Print(variables_,
    "- (void)clear$capitalized_name$\n"
    "{\n"
    "  _has$capitalized_name$ = NO;\n"
    "  _$name$ = $default$;\n"
    "}\n\n");
}

void PrimitiveFieldGenerator::GenerateInitializationSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "_$name$ = $default$;\n");
}


void PrimitiveFieldGenerator::GenerateMembersHeader(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateMembersSource(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateBuilderMembersHeader(io::Printer *printer) const
{
  printer->Print(variables_,
    "- (BOOL)has$capitalized_name$;\n"
    "- ($storage_type$)$name$$storage_attribute$;\n"
    "- ($classname$_Builder *)set$capitalized_name$:($storage_type$)value;\n"
    "- ($classname$_Builder *)clear$capitalized_name$;\n");
}


void PrimitiveFieldGenerator::GenerateMergingCodeHeader(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateBuildingCodeHeader(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateParsingCodeHeader(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateSerializationCodeHeader(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateSerializedSizeCodeHeader(io::Printer *printer) const
{
}


void PrimitiveFieldGenerator::GenerateBuilderMembersSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "- (BOOL)has$capitalized_name$\n"
    "{\n"
    "  return _result.has$capitalized_name$;\n"
    "}\n\n"
    "- ($storage_type$)$name$\n"
    "{\n"
    "  return _result.$name$;\n"
    "}\n\n"
    "- ($classname$_Builder*)set$capitalized_name$:($storage_type$)value\n"
    "{\n"
    "  _result.$name$ = value;\n"
    "  return self;\n"
    "}\n\n"
    "- ($classname$_Builder*)clear$capitalized_name$\n"
    "{\n"
    "  [_result clear$capitalized_name$];\n"
    "  return self;\n"
    "}\n\n");
}


void PrimitiveFieldGenerator::GenerateMergingCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "if (other.has$capitalized_name$) {\n"
    "  [self set$capitalized_name$:other.$name$];\n"
    "}\n");
}

void PrimitiveFieldGenerator::GenerateBuildingCodeSource(io::Printer *printer) const
{
}

void PrimitiveFieldGenerator::GenerateParsingCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "[self set$capitalized_name$:[input read$capitalized_type$]];\n");
}

void PrimitiveFieldGenerator::GenerateSerializationCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "if (self.has$capitalized_name$) {\n"
    "  [output write$capitalized_type$:$number$ value:self.$name$];\n"
    "}\n");
}

void PrimitiveFieldGenerator::GenerateSerializedSizeCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "if (self.has$capitalized_name$) {\n"
    "  size_ += compute$capitalized_type$Size($number$, self.$name$);\n"
    "}\n");
}

void PrimitiveFieldGenerator::GenerateDescriptionCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "if (self.has$capitalized_name$) {\n"
    "  [output appendFormat:@\"%@%@: %@\\n\", indent, @\"$name$\", ");
  printer->Print(variables_,
    BoxValue(descriptor_, "self.$name$").c_str());//RAGY
  printer->Print(variables_,
    "];\n"
    "}\n");
}

void PrimitiveFieldGenerator::GenerateIsEqualCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "(self.has$capitalized_name$ == otherMessage.has$capitalized_name$ &&"
    " (!self.has$capitalized_name$ || ");
  if(ReturnsPrimitiveType(descriptor_)) {
    printer->Print(variables_, "self.$name$ == otherMessage.$name$)) &&");
  } else {
    printer->Print(variables_, "[self.$name$ isEqual:otherMessage.$name$])) &&");
  }
}

void PrimitiveFieldGenerator::GenerateHashCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "if (self.has$capitalized_name$) {\n");
  printer->Print("  hashCode = hashCode * 31 + [");
  printer->Print(variables_, BoxValue(descriptor_, "self.$name$").c_str());
  printer->Print(
    " hash];\n"
    "}\n");
}

RepeatedPrimitiveFieldGenerator::RepeatedPrimitiveFieldGenerator(const FieldDescriptor *descriptor)
  : descriptor_(descriptor)
{
  SetPrimitiveVariables(descriptor, &variables_);
}


RepeatedPrimitiveFieldGenerator::~RepeatedPrimitiveFieldGenerator()
{
}


void RepeatedPrimitiveFieldGenerator::GenerateHasFieldHeader(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateFieldHeader(io::Printer *printer) const
{
  if(descriptor_->options().packed()) {
    printer->Print(variables_,
      "int32_t _$name$MemoizedSerializedSize;\n");
  }
}


void RepeatedPrimitiveFieldGenerator::GenerateHasPropertyHeader(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GeneratePropertyHeader(io::Printer *printer) const
{
  if(IsObjectArray(descriptor_)) {
    printer->Print(variables_,
      "@property (nonatomic, strong) NSMutableArray *$name$;\n\n");
  } else {
    printer->Print(variables_,
      "@property (nonatomic, strong) PBAppendableArray *$name$;\n\n");
  }
}


void RepeatedPrimitiveFieldGenerator::GenerateExtensionSource(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateSynthesizeSource(io::Printer *printer) const
{
}

void RepeatedPrimitiveFieldGenerator::GenerateInitializationSource(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateMembersHeader(io::Printer *printer) const
{
  printer->Print(variables_,
    "- ($storage_type$)$name$AtIndex:(NSUInteger)index;\n"
    "- (void)add$capitalized_name$:($storage_type$)value;\n"
    "- (void)add$capitalized_name$Array:(NSArray *)array;\n"
    "- (void)set$capitalized_name$Array:(NSArray *)array;\n");

  if(!IsObjectArray(descriptor_)) {
    printer->Print(variables_,
      "- (void)set$capitalized_name$Values:(const $storage_type$ *)values count:(NSUInteger)count;\n");
  }

  printer->Print(variables_,
    "- (void)clear$capitalized_name$;\n");
}

void RepeatedPrimitiveFieldGenerator::GenerateBuilderMembersHeader(io::Printer *printer) const
{
  printer->Print(variables_,
    "- (NSMutableArray *)$name$;\n"
    "- ($storage_type$)$name$AtIndex:(NSUInteger)index;\n"
    "- ($classname$_Builder *)add$capitalized_name$:($storage_type$)value;\n"
    "- ($classname$_Builder *)set$capitalized_name$Array:(NSArray *)array;\n");

  if(!IsObjectArray(descriptor_)) {
    printer->Print(variables_,
      "- ($classname$_Builder *)set$capitalized_name$Values:(const $storage_type$ *)values count:(NSUInteger)count;\n");
  }

  printer->Print(variables_,
    "- ($classname$_Builder *)clear$capitalized_name$;\n");
}


void RepeatedPrimitiveFieldGenerator::GenerateMergingCodeHeader(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateBuildingCodeHeader(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateParsingCodeHeader(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateSerializationCodeHeader(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateSerializedSizeCodeHeader(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateMembersSource(io::Printer *printer) const
{
  if(IsObjectArray(descriptor_)) {
    printer->Print(variables_,
      "- ($storage_type$)$name$AtIndex:(NSUInteger)index\n"
      "{\n"
      "  return _$name$[index];\n"
      "}\n\n"
      "- (void)add$capitalized_name$:($storage_type$)value\n"
      "{\n"
      "  if (value == nil) {\n"
      "    return;\n"
      "  }\n"
      "  if (_$name$ == nil) {\n"
      "    _$name$ = [[NSMutableArray alloc] init];\n"
      "  }\n"
      "  [_$name$ addObject:value];\n"
      "}\n\n"
      "- (void)add$capitalized_name$Array:(NSArray *)array\n"
      "{\n"
      "  if (_$name$ == nil) {\n"
      "    _$name$ = [[NSMutableArray alloc] init];\n"
      "  }\n"
      "  [_$name$ addObjectsFromArray:array];\n"
      "}\n\n"
      "- (void)set$capitalized_name$Array:(NSArray *)array\n"
      "{\n"
      "  _$name$ = [[NSMutableArray alloc] initWithArray:array];\n"
      "}\n\n"
      "- (void)clear$capitalized_name$\n"
      "{\n"
      "  _$name$ = nil;\n"
      "}\n\n");
  } else {
    printer->Print(variables_,
      "- ($storage_type$)$name$AtIndex:(NSUInteger)index\n"
      "{\n"
      "  return [_$name$ $array_value_type_name$AtIndex:index];\n"
      "}\n"
      "- (void)add$capitalized_name$:($storage_type$)value\n"
      "{\n"
      "  if (_$name$ == nil) {\n"
      "    _$name$ = [PBAppendableArray arrayWithValueType:$array_value_type$];\n"
      "  }\n"
      "  [_$name$ add$array_value_type_name_cap$:value];\n"
      "}\n\n"
      "- (void)add$capitalized_name$Array:(NSArray *)array\n"
      "{\n"
      "  if (_$name$ == nil) {\n"
      "    _$name$ = [PBAppendableArray arrayWithValueType:$array_value_type$];\n"
      "  }\n"
      "  [_$name$ appendArray:[PBAppendableArray arrayWithArray:array valueType:$array_value_type$]];\n"
      "}\n\n"
      "- (void)set$capitalized_name$Array:(NSArray *)array\n"
      "{\n"
      "  _$name$ = [PBAppendableArray arrayWithArray:array valueType:$array_value_type$];\n"
      "}\n\n"
      "- (void)set$capitalized_name$Values:(const $storage_type$ *)values count:(NSUInteger)count\n"
      "{\n"
      "  _$name$ = [PBAppendableArray arrayWithValues:values count:count valueType:$array_value_type$];\n"
      "}\n\n"
      "- (void)clear$capitalized_name$\n"
      "{\n"
      "  _$name$ = nil;\n"
      "}\n\n");
  }
}

void RepeatedPrimitiveFieldGenerator::GenerateBuilderMembersSource(io::Printer *printer) const
{
  if(IsObjectArray(descriptor_)) {
    printer->Print(variables_,
      "- (NSMutableArray *)$name$\n"
      "{\n"
      "  return _result.$name$;\n"
      "}\n\n"
      "- ($storage_type$)$name$AtIndex:(NSUInteger)index\n"
      "{\n"
      "  return [_result $name$AtIndex:index];\n"
      "}\n\n"
      "- ($classname$_Builder *)add$capitalized_name$:($storage_type$)value\n"
      "{\n"
      "  [_result add$capitalized_name$:value];\n"
      "  return self;\n"
      "}\n\n"
      "- ($classname$_Builder *)set$capitalized_name$Array:(NSArray *)array\n"
      "{\n"
      "  [_result set$capitalized_name$Array:array];\n"
      "  return self;\n"
      "}\n\n"
      "- ($classname$_Builder *)clear$capitalized_name$\n"
      "{\n"
      "  [_result clear$capitalized_name$];\n"
      "  return self;\n"
      "}\n\n");
  } else {
    printer->Print(variables_,
      "- (PBAppendableArray *)$name$\n"
      "{\n"
      "  return _result.$name$;\n"
      "}\n\n"
      "- ($storage_type$)$name$AtIndex:(NSUInteger)index\n"
      "{\n"
      "  return [_result $name$AtIndex:index];\n"
      "}\n\n"
      "- ($classname$_Builder *)add$capitalized_name$:($storage_type$)value\n"
      "{\n"
      "  [_result add$capitalized_name$:value];\n"
      "  return self;\n"
      "}\n\n"
      "- ($classname$_Builder *)set$capitalized_name$Array:(NSArray *)array\n"
      "{\n"
      "  [_result set$capitalized_name$Array:array];\n"
      "  return self;\n"
      "}\n\n"
      "- ($classname$_Builder *)set$capitalized_name$Values:(const $storage_type$ *)values count:(NSUInteger)count\n"
      "{\n"
      "  [_result set$capitalized_name$Values:values count:count];\n"
      "  return self;\n"
      "}\n\n"
      "- ($classname$_Builder *)clear$capitalized_name$\n"
      "{\n"
      "  [_result clear$capitalized_name$];\n"
      "  return self;\n"
      "}\n\n");
  }
}

void RepeatedPrimitiveFieldGenerator::GenerateMergingCodeSource(io::Printer *printer) const
{
  if(IsObjectArray(descriptor_)) {
    printer->Print(variables_,
      "if (other.$name$.count > 0) {\n"
      "  if (_result.$name$ == nil) {\n"
      "    _result.$name$ = [[NSMutableArray alloc] initWithArray:other.$name$];\n"
      "  } else {\n"
      "    [_result.$name$ addObjectsFromArray:other.$name$];\n"
      "  }\n"
      "}\n");
  } else {
    printer->Print(variables_,
      "if (other.$name$.count > 0) {\n"
      "  if (_result.$name$ == nil) {\n"
      "    _result.$name$ = [other.$name$ copy];\n"
      "  } else {\n"
      "    [_result.$name$ appendArray:other.$name$];\n"
      "  }\n"
      "}\n");
  }
}


void RepeatedPrimitiveFieldGenerator::GenerateBuildingCodeSource(io::Printer *printer) const
{
}


void RepeatedPrimitiveFieldGenerator::GenerateParsingCodeSource(io::Printer *printer) const
{
  if(descriptor_->options().packed()) {
    if(IsObjectArray(descriptor_)) {
      printer->Print(variables_,
        "int32_t length = [input readRawVarint32];\n"
        "int32_t limit = [input pushLimit:length];\n"
        "if (_result.$name$ == nil) {\n"
        "  _result.$name$ = [[NSMutableArray alloc] init];\n"
        "}\n"
        "while (input.bytesUntilLimit > 0) {\n"
        "  [_result.$name$ addObject:[input read$capitalized_type$]];\n"
        "}\n"
        "[input popLimit:limit];\n");
    } else {
      printer->Print(variables_,
        "int32_t length = [input readRawVarint32];\n"
        "int32_t limit = [input pushLimit:length];\n"
        "if (_result.$name$ == nil) {\n"
        "  _result.$name$ = [PBAppendableArray arrayWithValueType:$array_value_type$];\n"
        "}\n"
        "while (input.bytesUntilLimit > 0) {\n"
        "  [_result.$name$ add$array_value_type_name_cap$:[input read$capitalized_type$]];\n"
        "}\n"
        "[input popLimit:limit];\n");
    }
  } else {
    printer->Print(variables_,
      "[self add$capitalized_name$:[input read$capitalized_type$]];\n");
  }
}


void RepeatedPrimitiveFieldGenerator::GenerateSerializationCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "const NSUInteger $name$Count = self.$name$.count;\n"
    "if ($name$Count > 0) {\n");

  if(IsObjectArray(descriptor_)) {
    printer->Print(variables_,
      "  NSMutableArray *values = self.$name$;\n");
  } else {
    printer->Print(variables_,
      "  const $storage_type$ *values = (const $storage_type$ *)self.$name$.data;\n");
  }

  printer->Indent();

  if(descriptor_->options().packed()) {
    printer->Print(variables_,
      "[output writeRawVarint32:$tag$];\n"
      "[output writeRawVarint32:_$name$MemoizedSerializedSize];\n"
      "for (NSUInteger i = 0; i < $name$Count; ++i) {\n"
      "  [output write$capitalized_type$NoTag:values[i]];\n"
      "}\n");
  } else {
    printer->Print(variables_,
      "for (NSUInteger i = 0; i < $name$Count; ++i) {\n"
      "  [output write$capitalized_type$:$number$ value:values[i]];\n"
      "}\n");
  }

  printer->Outdent();
  printer->Print("}\n");
}


void RepeatedPrimitiveFieldGenerator::GenerateSerializedSizeCodeSource(io::Printer *printer) const
{
  printer->Print("{\n");
  printer->Indent();

  printer->Print(variables_,
    "int32_t dataSize = 0;\n"
    "const NSUInteger count = self.$name$.count;\n");

  if(FixedSize(descriptor_->type()) == -1) {
    if(IsObjectArray(descriptor_)) {
      printer->Print(variables_,
        "NSMutableArray *values = self.$name$;\n");
    } else {
      printer->Print(variables_,
        "const $storage_type$ *values = (const $storage_type$ *)self.$name$.data;\n");
    }

    printer->Print(variables_,
      "for (NSUInteger i = 0; i < count; ++i) {\n"
      "  dataSize += compute$capitalized_type$SizeNoTag(values[i]);\n"
      "}\n");
  } else {
    printer->Print(variables_,
      "dataSize = $fixed_size$ * count;\n");
  }

  printer->Print("size_ += dataSize;\n");

  if(descriptor_->options().packed()) {
    printer->Print(variables_,
      "if (count > 0) {\n"
      "  size_ += $tag_size$;\n"
      "  size_ += computeInt32SizeNoTag(dataSize);\n"
      "}\n"
      "_$name$MemoizedSerializedSize = dataSize;\n");
  } else {
    printer->Print(variables_,
      "size_ += $tag_size$ * count;\n");
  }

  printer->Outdent();
  printer->Print("}\n");
}


void RepeatedPrimitiveFieldGenerator::GenerateDescriptionCodeSource(io::Printer *printer) const
{
  if(ReturnsPrimitiveType(descriptor_)) {
    printer->Print(variables_,
      "for (NSUInteger i = 0, listCount = self.$name$.count; i < listCount; i++) {\n"
      //"  [output appendFormat:@\"%@%@: $type_format$\\n\", indent, @\"$name$\", [self.$name$ $array_value_type_name$AtIndex:i]];\n"
      "  [output appendFormat:@\"%@%@: %@\\n\", indent, @\"$name$\", @([self.$name$ $array_value_type_name$AtIndex:i])];\n"
      "}\n");
  } else {
    printer->Print(variables_,
      "for ($storage_type$ element in self.$name$) {\n"
      "  [output appendFormat:@\"%@%@: %@\\n\", indent, @\"$name$\", element];\n"
      "}\n");
  }
}


void RepeatedPrimitiveFieldGenerator::GenerateIsEqualCodeSource(io::Printer *printer) const
{
  printer->Print(variables_,
    "[self.$name$ isEqualToArray:otherMessage.$name$] &&");
}


void RepeatedPrimitiveFieldGenerator::GenerateHashCodeSource(io::Printer *printer) const
{
  if(ReturnsPrimitiveType(descriptor_)) {
    printer->Print(variables_,
      "for (NSUInteger i = 0, listCount = self.$name$.count; i < listCount; i++) {\n"
      "  hashCode = hashCode * 31 + [@([self.$name$ $array_value_type_name$AtIndex:i]) hash];\n"
      "}\n");
  } else {
    printer->Print(variables_,
      "for ($storage_type$ element in self.$name$) {\n"
      "  hashCode = hashCode * 31 + [element hash];\n"
      "}\n");
  }
}

}  // namespace objectivec
}  // namespace compiler
}  // namespace protobuf
}  // namespace google
