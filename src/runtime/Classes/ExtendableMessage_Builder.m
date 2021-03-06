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

#import "ExtendableMessage_Builder.h"

#import "ExtendableMessage.h"
#import "ExtensionRegistry.h"
#import "WireFormat.h"

@implementation PBExtendableMessage_Builder

- (PBExtendableMessage *)internalGetResult
{
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}

/**
* Called by subclasses to parse an unknown field or an extension.
* @return {@code YES} unless the tag is an end-group tag.
*/
- (BOOL)parseUnknownField:(PBCodedInputStream *)input unknownFields:(PBUnknownFieldSet_Builder *)unknownFields
  extensionRegistry:(PBExtensionRegistry *)extensionRegistry tag:(int32_t)tag
{
  PBExtendableMessage *message = [self internalGetResult];
  int32_t wireType = PBWireFormatGetTagWireType(tag);
  int32_t fieldNumber = PBWireFormatGetTagFieldNumber(tag);

  id<PBExtensionField> extension = [extensionRegistry getExtension:[message class] fieldNumber:fieldNumber];

  if(extension != nil) {
    if([extension wireType] == wireType) {
      [extension mergeFromCodedInputStream:input unknownFields:unknownFields extensionRegistry:extensionRegistry builder:self tag:tag];
      return YES;
    }
  }

  return [super parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag];
}

- (id)getExtension:(id<PBExtensionField>)extension
{
  return [[self internalGetResult] getExtension:extension];
}

- (BOOL)hasExtension:(id<PBExtensionField>)extension
{
  return [[self internalGetResult] hasExtension:extension];
}

- (PBExtendableMessage_Builder *)setExtension:(id<PBExtensionField>)extension value:(id)value
{
  [[self internalGetResult] setExtension:extension value:value];
  return self;
}

- (PBExtendableMessage_Builder *)addExtension:(id<PBExtensionField>)extension value:(id)value
{
  [[self internalGetResult] addExtension:extension value:value];
  return self;
}

- (PBExtendableMessage_Builder *)setExtension:(id<PBExtensionField>)extension index:(int32_t)index value:(id)value
{
  [[self internalGetResult] setExtension:extension index:index value:value];
  return self;
}

- (PBExtendableMessage_Builder *)clearExtension:(id<PBExtensionField>)extension
{
  [[self internalGetResult] clearExtension:extension];
  return self;
}

- (void)mergeExtensionFields:(PBExtendableMessage *)other
{
  [[self internalGetResult] mergeExtensionFields:other];
}

@end
