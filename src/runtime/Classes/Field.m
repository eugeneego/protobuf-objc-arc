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

#import "Field.h"

#import "CodedOutputStream.h"
#import "PBArray.h"
#import "UnknownFieldSet.h"
#import "Utilities.h"

@implementation PBField

- (int32_t)getSerializedSize:(int32_t)fieldNumber
{
  int32_t result = 0;

  const int64_t *varintValues = (const int64_t *)_varintArray.data;
  if(varintValues) {
    const NSUInteger count = _varintArray.count;
    for(NSUInteger i = 0; i < count; ++i) {
      result += computeInt64Size(fieldNumber, varintValues[i]);
    }
  }

  const int32_t *fixed32Values = (const int32_t *)_fixed32Array.data;
  if(fixed32Values) {
    const NSUInteger count = _fixed32Array.count;
    for(NSUInteger i = 0; i < count; ++i) {
      result += computeFixed32Size(fieldNumber, fixed32Values[i]);
    }
  }

  const int64_t *fixed64Values = (const int64_t *)_fixed64Array.data;
  if(fixed64Values) {
    const NSUInteger count = _fixed64Array.count;
    for(NSUInteger i = 0; i < count; ++i) {
      result += computeFixed64Size(fieldNumber, fixed64Values[i]);
    }
  }

  for(NSData *value in _lengthDelimitedArray) {
    result += computeDataSize(fieldNumber, value);
  }

  for(PBUnknownFieldSet *value in _groupArray) {
    result += computeUnknownGroupSize(fieldNumber, value);
  }

  return result;
}

- (int32_t)getSerializedSizeAsMessageSetExtension:(int32_t)fieldNumber
{
  int32_t result = 0;

  for(NSData *value in _lengthDelimitedArray) {
    result += computeRawMessageSetExtensionSize(fieldNumber, value);
  }

  return result;
}

- (void)writeTo:(int32_t)fieldNumber output:(PBCodedOutputStream *)output
{
  const int64_t *varintValues = (const int64_t *)_varintArray.data;
  if(varintValues) {
    const NSUInteger count = _varintArray.count;
    for(NSUInteger i = 0; i < count; ++i) {
      [output writeInt64:fieldNumber value:varintValues[i]];
    }
  }

  const int32_t *fixed32Values = (const int32_t *)_fixed32Array.data;
  if(fixed32Values) {
    const NSUInteger count = _fixed32Array.count;
    for(NSUInteger i = 0; i < count; ++i) {
      [output writeFixed32:fieldNumber value:fixed32Values[i]];
    }
  }

  const int64_t *fixed64Values = (const int64_t *)_fixed64Array.data;
  if(fixed64Values) {
    const NSUInteger count = _fixed64Array.count;
    for(NSUInteger i = 0; i < count; ++i) {
      [output writeFixed64:fieldNumber value:fixed64Values[i]];
    }
  }

  for(NSData *value in _lengthDelimitedArray) {
    [output writeData:fieldNumber value:value];
  }

  for(PBUnknownFieldSet *value in _groupArray) {
    [output writeUnknownGroup:fieldNumber value:value];
  }
}

- (void)writeDescriptionFor:(int32_t)fieldNumber to:(NSMutableString *)output withIndent:(NSString *)indent
{
  NSInteger arraySize;

  arraySize = _varintArray.count;
  for(int i = 0; i < arraySize; i++) {
    [output appendFormat:@"%@%d: %qi\n", indent, fieldNumber, [_varintArray int64AtIndex:i]];
  }

  arraySize = _fixed32Array.count;
  for(int i = 0; i < arraySize; i++) {
    [output appendFormat:@"%@%d: %d\n", indent, fieldNumber, [_fixed32Array int32AtIndex:i]];
  }

  arraySize = _fixed64Array.count;
  for(int i = 0; i < arraySize; i++) {
    [output appendFormat:@"%@%d: %qi\n", indent, fieldNumber, [_fixed64Array int64AtIndex:i]];
  }

  for(NSData *value in self.lengthDelimitedArray) {
    [output appendFormat:@"%@%d: %@\n", indent, fieldNumber, value];
  }
  for(PBUnknownFieldSet *value in self.groupArray) {
    [output appendFormat:@"%@%d: [\n", indent, fieldNumber];
    [value writeDescriptionTo:output withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@]", indent];
  }
}

- (void)writeAsMessageSetExtensionTo:(int32_t)fieldNumber output:(PBCodedOutputStream *)output
{
  for(NSData *value in _lengthDelimitedArray) {
    [output writeRawMessageSetExtension:fieldNumber value:value];
  }
}

@end