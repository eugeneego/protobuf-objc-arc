// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Unittest_embed_optimize_for.pb.h"


@implementation UnittestEmbedOptimizeForRoot

static PBExtensionRegistry *extensionRegistry = nil;

+ (PBExtensionRegistry *)extensionRegistry
{
  return extensionRegistry;
}

+ (void)initialize {
  if (self == [UnittestEmbedOptimizeForRoot class]) {
    PBMutableExtensionRegistry *registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [UnittestOptimizeForRoot registerAllExtensions:registry];
    extensionRegistry = registry;
  }
}

+ (void)registerAllExtensions:(PBMutableExtensionRegistry *)registry
{
}

@end


@interface TestEmbedOptimizedForSize ()


@end


@implementation TestEmbedOptimizedForSize

- (BOOL)hasOptionalMessage
{
  return _hasOptionalMessage;
}

- (void)setOptionalMessage:(TestOptimizedForSize *)value
{
  _hasOptionalMessage = value != nil;
  _optionalMessage = value;
}

- (void)clearOptionalMessage
{
  _hasOptionalMessage = NO;
  _optionalMessage = nil;
}

- (instancetype)init
{
  if ((self = [super init])) {
    _optionalMessage = nil;
  }
  return self;
}

- (TestOptimizedForSize *)repeatedMessageAtIndex:(NSUInteger)index
{
  return _repeatedMessage[index];
}
- (void)addRepeatedMessage:(TestOptimizedForSize *)value
{
  if (value == nil) {
    return;
  }
  if (_repeatedMessage == nil) {
    _repeatedMessage = [[NSMutableArray alloc] init];
  }
  [_repeatedMessage addObject:value];
}

- (void)addRepeatedMessageArray:(NSArray *)array
{
  if (_repeatedMessage == nil) {
    _repeatedMessage = [[NSMutableArray alloc] init];
  }
  [_repeatedMessage addObjectsFromArray:array];
}

- (void)setRepeatedMessageArray:(NSArray *)array
{
  _repeatedMessage = [[NSMutableArray alloc] initWithArray:array];
}

- (void)clearRepeatedMessage
{
  _repeatedMessage = nil;
}

- (BOOL)isInitialized
{
  if (self.hasOptionalMessage && !self.optionalMessage.isInitialized) {
    return NO;
  }
  for (TestOptimizedForSize *element in self.repeatedMessage) {
    if (!element.isInitialized) {
      return NO;
    }
  }
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  if (self.hasOptionalMessage) {
    [output writeMessage:1 value:self.optionalMessage];
  }
  for (TestOptimizedForSize *element in self.repeatedMessage) {
    [output writeMessage:2 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  if (self.hasOptionalMessage) {
    size_ += computeMessageSize(1, self.optionalMessage);
  }
  for (TestOptimizedForSize *element in self.repeatedMessage) {
    size_ += computeMessageSize(2, element);
  }
  size_ += self.unknownFields.serializedSize;
  return size_;
}

+ (TestEmbedOptimizedForSize *)parseFromData:(NSData *)data
{
  return (TestEmbedOptimizedForSize *)[[[TestEmbedOptimizedForSize builder] mergeFromData:data] build];
}

+ (TestEmbedOptimizedForSize *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestEmbedOptimizedForSize*)[[[TestEmbedOptimizedForSize builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (TestEmbedOptimizedForSize *)parseFromInputStream:(NSInputStream *)input
{
  return (TestEmbedOptimizedForSize*)[[[TestEmbedOptimizedForSize builder] mergeFromInputStream:input] build];
}

+ (TestEmbedOptimizedForSize *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestEmbedOptimizedForSize*)[[[TestEmbedOptimizedForSize builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestEmbedOptimizedForSize *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[TestEmbedOptimizedForSize builder] mergeFromCodedInputStream:input] build];
}

+ (TestEmbedOptimizedForSize *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[TestEmbedOptimizedForSize builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestEmbedOptimizedForSize_Builder *)builder
{
  return [[TestEmbedOptimizedForSize_Builder alloc] init];
}

+ (TestEmbedOptimizedForSize_Builder *)builderWithPrototype:(TestEmbedOptimizedForSize *)prototype
{
  return [[TestEmbedOptimizedForSize builder] mergeFrom:prototype];
}

- (TestEmbedOptimizedForSize_Builder *)builder
{
  return [TestEmbedOptimizedForSize builder];
}

- (TestEmbedOptimizedForSize_Builder *)toBuilder
{
  return [TestEmbedOptimizedForSize builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  if (self.hasOptionalMessage) {
    [output appendFormat:@"%@%@ {\n", indent, @"optionalMessage"];
    [self.optionalMessage writeDescriptionTo:output withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  for (TestOptimizedForSize *element in self.repeatedMessage) {
    [output appendFormat:@"%@%@ {\n", indent, @"repeatedMessage"];
    [element writeDescriptionTo:output withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}

- (BOOL)isEqual:(id)other
{
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[TestEmbedOptimizedForSize class]]) {
    return NO;
  }
  TestEmbedOptimizedForSize *otherMessage = other;
  return
    (self.hasOptionalMessage == otherMessage.hasOptionalMessage && (!self.hasOptionalMessage || [self.optionalMessage isEqual:otherMessage.optionalMessage])) &&
    [self.repeatedMessage isEqualToArray:otherMessage.repeatedMessage] &&
    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  if (self.hasOptionalMessage) {
    hashCode = hashCode * 31 + [self.optionalMessage hash];
  }
  for (TestOptimizedForSize *element in self.repeatedMessage) {
    hashCode = hashCode * 31 + [element hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface TestEmbedOptimizedForSize_Builder()

@property (strong) TestEmbedOptimizedForSize *result;

@end


@implementation TestEmbedOptimizedForSize_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[TestEmbedOptimizedForSize alloc] init];
  }
  return self;
}

- (PBGeneratedMessage *)internalGetResult
{
  return _result;
}

- (TestEmbedOptimizedForSize_Builder *)clear
{
  self.result = [[TestEmbedOptimizedForSize alloc] init];
  return self;
}

- (TestEmbedOptimizedForSize_Builder *)clone
{
  return [TestEmbedOptimizedForSize builderWithPrototype:_result];
}

- (TestEmbedOptimizedForSize *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (TestEmbedOptimizedForSize *)buildPartial
{
  TestEmbedOptimizedForSize *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (TestEmbedOptimizedForSize_Builder *)mergeFrom:(TestEmbedOptimizedForSize *)other
{
  if (other == nil) {
    return self;
  }
  if (other.hasOptionalMessage) {
    [self mergeOptionalMessage:other.optionalMessage];
  }
  if (other.repeatedMessage.count > 0) {
    if (_result.repeatedMessage == nil) {
      _result.repeatedMessage = [[NSMutableArray alloc] initWithArray:other.repeatedMessage];
    } else {
      [_result.repeatedMessage addObjectsFromArray:other.repeatedMessage];
    }
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (TestEmbedOptimizedForSize_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (TestEmbedOptimizedForSize_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
{
  PBUnknownFieldSet_Builder *unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        TestOptimizedForSize_Builder *subBuilder = [TestOptimizedForSize builder];
        if (self.hasOptionalMessage) {
          [subBuilder mergeFrom:self.optionalMessage];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setOptionalMessage:[subBuilder buildPartial]];
        break;
      }
      case 18: {
        TestOptimizedForSize_Builder *subBuilder = [TestOptimizedForSize builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addRepeatedMessage:[subBuilder buildPartial]];
        break;
      }
    }
  }
}

- (BOOL)hasOptionalMessage
{
  return _result.hasOptionalMessage;
}

- (TestOptimizedForSize *)optionalMessage
{
  return _result.optionalMessage;
}

- (TestEmbedOptimizedForSize_Builder *)setOptionalMessage:(TestOptimizedForSize *)value
{
  _result.optionalMessage = value;
  return self;
}

- (TestEmbedOptimizedForSize_Builder *)setOptionalMessageBuilder:(TestOptimizedForSize_Builder *)builderForValue
{
  return [self setOptionalMessage:[builderForValue build]];
}

- (TestEmbedOptimizedForSize_Builder *)mergeOptionalMessage:(TestOptimizedForSize *)value
{
  if (_result.hasOptionalMessage && _result.optionalMessage != nil) {
    _result.optionalMessage = [[[TestOptimizedForSize builderWithPrototype:_result.optionalMessage] mergeFrom:value] buildPartial];
  } else {
    _result.optionalMessage = value;
  }
  return self;
}

- (TestEmbedOptimizedForSize_Builder *)clearOptionalMessage
{
  [_result clearOptionalMessage];
  return self;
}

- (NSMutableArray *)repeatedMessage
{
  return _result.repeatedMessage;
}

- (TestOptimizedForSize *)repeatedMessageAtIndex:(NSUInteger)index
{
  return [_result repeatedMessageAtIndex:index];
}

- (TestEmbedOptimizedForSize_Builder *)addRepeatedMessage:(TestOptimizedForSize *)value
{
  [_result addRepeatedMessage:value];
  return self;
}

- (TestEmbedOptimizedForSize_Builder *)setRepeatedMessageArray:(NSArray *)array
{
  [_result setRepeatedMessageArray:array];
  return self;
}

- (TestEmbedOptimizedForSize_Builder *)clearRepeatedMessage
{
  [_result clearRepeatedMessage];
  return self;
}

@end


