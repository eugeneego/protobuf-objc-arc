// Protocol Buffers for Objective C
//
// Copyright 2010 Booyah Inc.
// Copyright 2008 Cyrus Najmabadi
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

#import "ExtensionField.h"

typedef enum
{
  PBExtensionTypeBool,
  PBExtensionTypeFixed32,
  PBExtensionTypeSFixed32,
  PBExtensionTypeFloat,
  PBExtensionTypeFixed64,
  PBExtensionTypeSFixed64,
  PBExtensionTypeDouble,
  PBExtensionTypeInt32,
  PBExtensionTypeInt64,
  PBExtensionTypeSInt32,
  PBExtensionTypeSInt64,
  PBExtensionTypeUInt32,
  PBExtensionTypeUInt64,
  PBExtensionTypeBytes,
  PBExtensionTypeString,
  PBExtensionTypeMessage,
  PBExtensionTypeGroup,
  PBExtensionTypeEnum
} PBExtensionType;

@interface PBConcreteExtensionField : NSObject<PBExtensionField>
{
@private
  PBExtensionType type;

  Class extendedClass;
  int32_t fieldNumber;
  id defaultValue;

  Class messageOrGroupClass;

  BOOL isRepeated;
  BOOL isPacked;
  BOOL isMessageSetWireFormat;
}

+ (PBConcreteExtensionField *)extensionWithType:(PBExtensionType)type
  extendedClass:(Class)extendedClass
  fieldNumber:(int32_t)fieldNumber
  defaultValue:(id)defaultValue
  messageOrGroupClass:(Class)messageOrGroupClass
  isRepeated:(BOOL)isRepeated
  isPacked:(BOOL)isPacked
  isMessageSetWireFormat:(BOOL)isMessageSetWireFormat;

@end
