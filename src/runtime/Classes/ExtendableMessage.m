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

#import "ExtendableMessage.h"

#import "ExtensionField.h"

@implementation PBExtendableMessage

- (BOOL)isInitialized:(id)object
{
  if([object isKindOfClass:[NSArray class]]) {
    for(id child in object) {
      if(![self isInitialized:child]) {
        return NO;
      }
    }
  } else if([object conformsToProtocol:@protocol(PBMessage)]) {
    return [object isInitialized];
  }

  return YES;
}

- (BOOL)extensionsAreInitialized
{
  return [self isInitialized:_extensionMap.allValues];
}

- (id)getExtension:(id<PBExtensionField>)extension
{
  [self ensureExtensionIsRegistered:extension];
  id value = _extensionMap[@([extension fieldNumber])];
  if(value != nil) {
    return value;
  }

  return [extension defaultValue];
}

- (void)ensureExtensionIsRegistered:(id<PBExtensionField>)extension
{
  if([extension extendedClass] != [self class]) {
    @throw [NSException exceptionWithName:@"IllegalArgument" reason:@"Trying to use an extension for another type" userInfo:nil];
  }

  if(_extensionRegistry == nil) {
    self.extensionRegistry = [NSMutableDictionary dictionary];
  }
  _extensionRegistry[@([extension fieldNumber])] = extension;
}

- (BOOL)hasExtension:(id<PBExtensionField>)extension
{
  return nil != _extensionMap[@([extension fieldNumber])];
}

- (void)writeExtensionsToCodedOutputStream:(PBCodedOutputStream *)output from:(int32_t)startInclusive to:(int32_t)endExclusive
{
  // man, i really wish Cocoa had a Sorted/TreeMap
  NSArray *sortedKeys = [_extensionMap.allKeys sortedArrayUsingSelector:@selector(compare:)];
  for(NSNumber *number in sortedKeys) {
    int32_t fieldNumber = [number intValue];
    if(fieldNumber >= startInclusive && fieldNumber < endExclusive) {
      id<PBExtensionField> extension = _extensionRegistry[number];
      id value = _extensionMap[number];
      [extension writeValue:value includingTagToCodedOutputStream:output];
    }
  }
}

- (void)writeExtensionDescriptionToMutableString:(NSMutableString *)output from:(int32_t)startInclusive to:(int32_t)endExclusive withIndent:(NSString *)indent
{
  NSArray *sortedKeys = [_extensionMap.allKeys sortedArrayUsingSelector:@selector(compare:)];
  for(NSNumber *number in sortedKeys) {
    int32_t fieldNumber = [number intValue];
    if(fieldNumber >= startInclusive && fieldNumber < endExclusive) {
      id<PBExtensionField> extension = _extensionRegistry[number];
      id value = _extensionMap[number];
      [extension writeDescriptionOf:value to:output withIndent:indent];
    }
  }
}

- (BOOL)isEqualExtensionsInOther:(PBExtendableMessage *)otherMessage from:(int32_t)startInclusive to:(int32_t)endExclusive
{
  NSArray *sortedKeys = [_extensionMap.allKeys sortedArrayUsingSelector:@selector(compare:)];
  for(NSNumber *number in sortedKeys) {
    int32_t fieldNumber = [number intValue];
    if(fieldNumber >= startInclusive && fieldNumber < endExclusive) {
      id value = _extensionMap[number];
      id otherValue = (otherMessage.extensionMap)[number];
      if(![value isEqual:otherValue]) {
        return NO;
      }
    }
  }
  return YES;
}

- (NSUInteger)hashExtensionsFrom:(int32_t)startInclusive to:(int32_t)endExclusive
{
  NSUInteger hashCode = 0;
  NSArray *sortedKeys = [_extensionMap.allKeys sortedArrayUsingSelector:@selector(compare:)];
  for(NSNumber *number in sortedKeys) {
    int32_t fieldNumber = [number intValue];
    if(fieldNumber >= startInclusive && fieldNumber < endExclusive) {
      id value = _extensionMap[number];
      hashCode = hashCode * 31 + [value hash];
    }
  }
  return hashCode;
}

- (int32_t)extensionsSerializedSize
{
  int32_t size = 0;
  for(NSNumber *number in _extensionMap) {
    id<PBExtensionField> extension = _extensionRegistry[number];
    id value = _extensionMap[number];
    size += [extension computeSerializedSizeIncludingTag:value];
  }
  return size;
}

#pragma mark - Setters

- (void)setExtension:(id<PBExtensionField>)extension value:(id)value
{
  [self ensureExtensionIsRegistered:extension];

  if([extension isRepeated]) {
    @throw [NSException exceptionWithName:@"IllegalArgument" reason:@"Must call addExtension() for repeated types." userInfo:nil];
  }

  if(self.extensionMap == nil) {
    self.extensionMap = [NSMutableDictionary dictionary];
  }
  self.extensionMap[@([extension fieldNumber])] = value;
}

- (void)addExtension:(id<PBExtensionField>)extension value:(id)value
{
  [self ensureExtensionIsRegistered:extension];

  if(![extension isRepeated]) {
    @throw [NSException exceptionWithName:@"IllegalArgument" reason:@"Must call setExtension() for singular types." userInfo:nil];
  }

  if(self.extensionMap == nil) {
    self.extensionMap = [NSMutableDictionary dictionary];
  }
  NSNumber *fieldNumber = @([extension fieldNumber]);
  NSMutableArray *list = self.extensionMap[fieldNumber];
  if(list == nil) {
    list = [NSMutableArray array];
    self.extensionMap[fieldNumber] = list;
  }

  [list addObject:value];
}

- (void)setExtension:(id<PBExtensionField>)extension index:(int32_t)index value:(id)value
{
  [self ensureExtensionIsRegistered:extension];

  if(![extension isRepeated]) {
    @throw [NSException exceptionWithName:@"IllegalArgument" reason:@"Must call setExtension() for singular types." userInfo:nil];
  }

  if(self.extensionMap == nil) {
    self.extensionMap = [NSMutableDictionary dictionary];
  }

  NSNumber *fieldNumber = @([extension fieldNumber]);
  NSMutableArray *list = self.extensionMap[fieldNumber];

  list[(NSUInteger)index] = value;
}

- (void)clearExtension:(id<PBExtensionField>)extension
{
  [self ensureExtensionIsRegistered:extension];
  [self.extensionMap removeObjectForKey:@([extension fieldNumber])];
}

- (void)mergeExtensionFields:(PBExtendableMessage *)other
{
  if([self class] != [other class]) {
    @throw [NSException exceptionWithName:@"IllegalArgument" reason:@"Cannot merge extensions from a different type" userInfo:nil];
  }

  if(other.extensionMap.count > 0) {
    if(self.extensionMap == nil) {
      self.extensionMap = [NSMutableDictionary dictionary];
    }

    NSDictionary *registry = other.extensionRegistry;
    for(NSNumber *fieldNumber in other.extensionMap) {
      id<PBExtensionField> thisField = registry[fieldNumber];
      id value = other.extensionMap[fieldNumber];

      if([thisField isRepeated]) {
        NSMutableArray *list = self.extensionMap[fieldNumber];
        if(list == nil) {
          list = [NSMutableArray array];
          self.extensionMap[fieldNumber] = list;
        }

        [list addObjectsFromArray:value];
      } else {
        self.extensionMap[fieldNumber] = value;
      }
    }
  }
}

@end
