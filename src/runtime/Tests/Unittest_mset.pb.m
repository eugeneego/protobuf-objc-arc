// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Unittest_mset.pb.h"


@implementation UnittestMsetRoot

static id<PBExtensionField> TestMessageSetExtension1_messageSetExtension = nil;
static id<PBExtensionField> TestMessageSetExtension2_messageSetExtension = nil;
static PBExtensionRegistry *extensionRegistry = nil;

+ (PBExtensionRegistry *)extensionRegistry
{
  return extensionRegistry;
}

+ (void)initialize {
  if (self == [UnittestMsetRoot class]) {
    TestMessageSetExtension1_messageSetExtension = [PBConcreteExtensionField
      extensionWithType:PBExtensionTypeMessage
      extendedClass:[TestMessageSet class]
      fieldNumber:1545008
      defaultValue:nil
      messageOrGroupClass:[TestMessageSetExtension1 class]
      isRepeated:NO
      isPacked:NO
      isMessageSetWireFormat:YES];
    TestMessageSetExtension2_messageSetExtension = [PBConcreteExtensionField
      extensionWithType:PBExtensionTypeMessage
      extendedClass:[TestMessageSet class]
      fieldNumber:1547769
      defaultValue:nil
      messageOrGroupClass:[TestMessageSetExtension2 class]
      isRepeated:NO
      isPacked:NO
      isMessageSetWireFormat:YES];
    PBMutableExtensionRegistry *registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = registry;
  }
}

+ (void)registerAllExtensions:(PBMutableExtensionRegistry *)registry
{
  [registry addExtension:TestMessageSetExtension1_messageSetExtension];
  [registry addExtension:TestMessageSetExtension2_messageSetExtension];
}

@end


@interface TestMessageSet ()


@end


@implementation TestMessageSet

- (instancetype)init
{
  if ((self = [super init])) {
  }
  return self;
}

- (BOOL)isInitialized
{
  if (!self.extensionsAreInitialized) {
    return NO;
  }
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  [self writeExtensionsToCodedOutputStream:output from:4 to:2147483647];
  [self.unknownFields writeAsMessageSetTo:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  size_ += [self extensionsSerializedSize];
  size_ += self.unknownFields.serializedSizeAsMessageSet;
  return size_;
}

+ (TestMessageSet *)parseFromData:(NSData *)data
{
  return (TestMessageSet *)[[[TestMessageSet builder] mergeFromData:data] build];
}

+ (TestMessageSet *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSet*)[[[TestMessageSet builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSet *)parseFromInputStream:(NSInputStream *)input
{
  return (TestMessageSet*)[[[TestMessageSet builder] mergeFromInputStream:input] build];
}

+ (TestMessageSet *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSet*)[[[TestMessageSet builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSet *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[TestMessageSet builder] mergeFromCodedInputStream:input] build];
}

+ (TestMessageSet *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[TestMessageSet builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSet_Builder *)builder
{
  return [[TestMessageSet_Builder alloc] init];
}

+ (TestMessageSet_Builder *)builderWithPrototype:(TestMessageSet *)prototype
{
  return [[TestMessageSet builder] mergeFrom:prototype];
}

- (TestMessageSet_Builder *)builder
{
  return [TestMessageSet builder];
}

- (TestMessageSet_Builder *)toBuilder
{
  return [TestMessageSet builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  [self writeExtensionDescriptionToMutableString:(NSMutableString*)output from:4 to:2147483647 withIndent:indent];
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}

- (BOOL)isEqual:(id)other
{
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[TestMessageSet class]]) {
    return NO;
  }
  TestMessageSet *otherMessage = other;
  return
    [self isEqualExtensionsInOther:otherMessage from:4 to:2147483647] &&

    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  hashCode = hashCode * 31 + [self hashExtensionsFrom:4 to:2147483647];
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface TestMessageSet_Builder()

@property (strong) TestMessageSet *result;

@end


@implementation TestMessageSet_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[TestMessageSet alloc] init];
  }
  return self;
}

- (PBExtendableMessage *)internalGetResult
{
  return _result;
}

- (TestMessageSet_Builder *)clear
{
  self.result = [[TestMessageSet alloc] init];
  return self;
}

- (TestMessageSet_Builder *)clone
{
  return [TestMessageSet builderWithPrototype:_result];
}

- (TestMessageSet *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (TestMessageSet *)buildPartial
{
  TestMessageSet *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (TestMessageSet_Builder *)mergeFrom:(TestMessageSet *)other
{
  if (other == nil) {
    return self;
  }
  [self mergeExtensionFields:other];
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (TestMessageSet_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (TestMessageSet_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
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
    }
  }
}

@end


@interface TestMessageSetContainer ()


@end


@implementation TestMessageSetContainer

- (BOOL)hasMessageSet
{
  return _hasMessageSet;
}

- (void)setMessageSet:(TestMessageSet *)value
{
  _hasMessageSet = value != nil;
  _messageSet = value;
}

- (void)clearMessageSet
{
  _hasMessageSet = NO;
  _messageSet = nil;
}

- (instancetype)init
{
  if ((self = [super init])) {
    _messageSet = nil;
  }
  return self;
}

- (BOOL)isInitialized
{
  if (self.hasMessageSet && !self.messageSet.isInitialized) {
    return NO;
  }
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  if (self.hasMessageSet) {
    [output writeMessage:1 value:self.messageSet];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  if (self.hasMessageSet) {
    size_ += computeMessageSize(1, self.messageSet);
  }
  size_ += self.unknownFields.serializedSize;
  return size_;
}

+ (TestMessageSetContainer *)parseFromData:(NSData *)data
{
  return (TestMessageSetContainer *)[[[TestMessageSetContainer builder] mergeFromData:data] build];
}

+ (TestMessageSetContainer *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSetContainer*)[[[TestMessageSetContainer builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetContainer *)parseFromInputStream:(NSInputStream *)input
{
  return (TestMessageSetContainer*)[[[TestMessageSetContainer builder] mergeFromInputStream:input] build];
}

+ (TestMessageSetContainer *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSetContainer*)[[[TestMessageSetContainer builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetContainer *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[TestMessageSetContainer builder] mergeFromCodedInputStream:input] build];
}

+ (TestMessageSetContainer *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[TestMessageSetContainer builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetContainer_Builder *)builder
{
  return [[TestMessageSetContainer_Builder alloc] init];
}

+ (TestMessageSetContainer_Builder *)builderWithPrototype:(TestMessageSetContainer *)prototype
{
  return [[TestMessageSetContainer builder] mergeFrom:prototype];
}

- (TestMessageSetContainer_Builder *)builder
{
  return [TestMessageSetContainer builder];
}

- (TestMessageSetContainer_Builder *)toBuilder
{
  return [TestMessageSetContainer builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  if (self.hasMessageSet) {
    [output appendFormat:@"%@%@ {\n", indent, @"messageSet"];
    [self.messageSet writeDescriptionTo:output withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}

- (BOOL)isEqual:(id)other
{
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[TestMessageSetContainer class]]) {
    return NO;
  }
  TestMessageSetContainer *otherMessage = other;
  return
    (self.hasMessageSet == otherMessage.hasMessageSet && (!self.hasMessageSet || [self.messageSet isEqual:otherMessage.messageSet])) &&
    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  if (self.hasMessageSet) {
    hashCode = hashCode * 31 + [self.messageSet hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface TestMessageSetContainer_Builder()

@property (strong) TestMessageSetContainer *result;

@end


@implementation TestMessageSetContainer_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[TestMessageSetContainer alloc] init];
  }
  return self;
}

- (PBGeneratedMessage *)internalGetResult
{
  return _result;
}

- (TestMessageSetContainer_Builder *)clear
{
  self.result = [[TestMessageSetContainer alloc] init];
  return self;
}

- (TestMessageSetContainer_Builder *)clone
{
  return [TestMessageSetContainer builderWithPrototype:_result];
}

- (TestMessageSetContainer *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (TestMessageSetContainer *)buildPartial
{
  TestMessageSetContainer *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (TestMessageSetContainer_Builder *)mergeFrom:(TestMessageSetContainer *)other
{
  if (other == nil) {
    return self;
  }
  if (other.hasMessageSet) {
    [self mergeMessageSet:other.messageSet];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (TestMessageSetContainer_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (TestMessageSetContainer_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
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
        TestMessageSet_Builder *subBuilder = [TestMessageSet builder];
        if (self.hasMessageSet) {
          [subBuilder mergeFrom:self.messageSet];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setMessageSet:[subBuilder buildPartial]];
        break;
      }
    }
  }
}

- (BOOL)hasMessageSet
{
  return _result.hasMessageSet;
}

- (TestMessageSet *)messageSet
{
  return _result.messageSet;
}

- (TestMessageSetContainer_Builder *)setMessageSet:(TestMessageSet *)value
{
  _result.messageSet = value;
  return self;
}

- (TestMessageSetContainer_Builder *)setMessageSetBuilder:(TestMessageSet_Builder *)builderForValue
{
  return [self setMessageSet:[builderForValue build]];
}

- (TestMessageSetContainer_Builder *)mergeMessageSet:(TestMessageSet *)value
{
  if (_result.hasMessageSet && _result.messageSet != nil) {
    _result.messageSet = [[[TestMessageSet builderWithPrototype:_result.messageSet] mergeFrom:value] buildPartial];
  } else {
    _result.messageSet = value;
  }
  return self;
}

- (TestMessageSetContainer_Builder *)clearMessageSet
{
  [_result clearMessageSet];
  return self;
}

@end


@interface TestMessageSetExtension1 ()


@end


@implementation TestMessageSetExtension1

- (BOOL)hasI
{
  return _hasI;
}

- (void)setI:(int32_t)value
{
  _hasI = YES;
  _i = value;
}

- (void)clearI
{
  _hasI = NO;
  _i = 0;
}

- (instancetype)init
{
  if ((self = [super init])) {
    _i = 0;
  }
  return self;
}

+ (id<PBExtensionField>)messageSetExtension
{
  return TestMessageSetExtension1_messageSetExtension;
}
- (BOOL)isInitialized
{
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  if (self.hasI) {
    [output writeInt32:15 value:self.i];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  if (self.hasI) {
    size_ += computeInt32Size(15, self.i);
  }
  size_ += self.unknownFields.serializedSize;
  return size_;
}

+ (TestMessageSetExtension1 *)parseFromData:(NSData *)data
{
  return (TestMessageSetExtension1 *)[[[TestMessageSetExtension1 builder] mergeFromData:data] build];
}

+ (TestMessageSetExtension1 *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1 builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetExtension1 *)parseFromInputStream:(NSInputStream *)input
{
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1 builder] mergeFromInputStream:input] build];
}

+ (TestMessageSetExtension1 *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1 builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetExtension1 *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[TestMessageSetExtension1 builder] mergeFromCodedInputStream:input] build];
}

+ (TestMessageSetExtension1 *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[TestMessageSetExtension1 builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetExtension1_Builder *)builder
{
  return [[TestMessageSetExtension1_Builder alloc] init];
}

+ (TestMessageSetExtension1_Builder *)builderWithPrototype:(TestMessageSetExtension1 *)prototype
{
  return [[TestMessageSetExtension1 builder] mergeFrom:prototype];
}

- (TestMessageSetExtension1_Builder *)builder
{
  return [TestMessageSetExtension1 builder];
}

- (TestMessageSetExtension1_Builder *)toBuilder
{
  return [TestMessageSetExtension1 builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  if (self.hasI) {
    [output appendFormat:@"%@%@: %@\n", indent, @"i", @(self.i)];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}

- (BOOL)isEqual:(id)other
{
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[TestMessageSetExtension1 class]]) {
    return NO;
  }
  TestMessageSetExtension1 *otherMessage = other;
  return
    (self.hasI == otherMessage.hasI && (!self.hasI || self.i == otherMessage.i)) &&
    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  if (self.hasI) {
    hashCode = hashCode * 31 + [@(self.i) hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface TestMessageSetExtension1_Builder()

@property (strong) TestMessageSetExtension1 *result;

@end


@implementation TestMessageSetExtension1_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[TestMessageSetExtension1 alloc] init];
  }
  return self;
}

- (PBGeneratedMessage *)internalGetResult
{
  return _result;
}

- (TestMessageSetExtension1_Builder *)clear
{
  self.result = [[TestMessageSetExtension1 alloc] init];
  return self;
}

- (TestMessageSetExtension1_Builder *)clone
{
  return [TestMessageSetExtension1 builderWithPrototype:_result];
}

- (TestMessageSetExtension1 *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (TestMessageSetExtension1 *)buildPartial
{
  TestMessageSetExtension1 *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (TestMessageSetExtension1_Builder *)mergeFrom:(TestMessageSetExtension1 *)other
{
  if (other == nil) {
    return self;
  }
  if (other.hasI) {
    [self setI:other.i];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (TestMessageSetExtension1_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (TestMessageSetExtension1_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
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
      case 120: {
        [self setI:[input readInt32]];
        break;
      }
    }
  }
}

- (BOOL)hasI
{
  return _result.hasI;
}

- (int32_t)i
{
  return _result.i;
}

- (TestMessageSetExtension1_Builder*)setI:(int32_t)value
{
  _result.i = value;
  return self;
}

- (TestMessageSetExtension1_Builder*)clearI
{
  [_result clearI];
  return self;
}

@end


@interface TestMessageSetExtension2 ()


@end


@implementation TestMessageSetExtension2

- (BOOL)hasStr
{
  return _hasStr;
}

- (void)setStr:(NSString *)value
{
  _hasStr = value != nil;
  _str = value;
}

- (void)clearStr
{
  _hasStr = NO;
  _str = nil;
}

- (instancetype)init
{
  if ((self = [super init])) {
    _str = nil;
  }
  return self;
}

+ (id<PBExtensionField>)messageSetExtension
{
  return TestMessageSetExtension2_messageSetExtension;
}
- (BOOL)isInitialized
{
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  if (self.hasStr) {
    [output writeString:25 value:self.str];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  if (self.hasStr) {
    size_ += computeStringSize(25, self.str);
  }
  size_ += self.unknownFields.serializedSize;
  return size_;
}

+ (TestMessageSetExtension2 *)parseFromData:(NSData *)data
{
  return (TestMessageSetExtension2 *)[[[TestMessageSetExtension2 builder] mergeFromData:data] build];
}

+ (TestMessageSetExtension2 *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2 builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetExtension2 *)parseFromInputStream:(NSInputStream *)input
{
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2 builder] mergeFromInputStream:input] build];
}

+ (TestMessageSetExtension2 *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2 builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetExtension2 *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[TestMessageSetExtension2 builder] mergeFromCodedInputStream:input] build];
}

+ (TestMessageSetExtension2 *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[TestMessageSetExtension2 builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (TestMessageSetExtension2_Builder *)builder
{
  return [[TestMessageSetExtension2_Builder alloc] init];
}

+ (TestMessageSetExtension2_Builder *)builderWithPrototype:(TestMessageSetExtension2 *)prototype
{
  return [[TestMessageSetExtension2 builder] mergeFrom:prototype];
}

- (TestMessageSetExtension2_Builder *)builder
{
  return [TestMessageSetExtension2 builder];
}

- (TestMessageSetExtension2_Builder *)toBuilder
{
  return [TestMessageSetExtension2 builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  if (self.hasStr) {
    [output appendFormat:@"%@%@: %@\n", indent, @"str", self.str];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}

- (BOOL)isEqual:(id)other
{
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[TestMessageSetExtension2 class]]) {
    return NO;
  }
  TestMessageSetExtension2 *otherMessage = other;
  return
    (self.hasStr == otherMessage.hasStr && (!self.hasStr || [self.str isEqual:otherMessage.str])) &&
    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  if (self.hasStr) {
    hashCode = hashCode * 31 + [self.str hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface TestMessageSetExtension2_Builder()

@property (strong) TestMessageSetExtension2 *result;

@end


@implementation TestMessageSetExtension2_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[TestMessageSetExtension2 alloc] init];
  }
  return self;
}

- (PBGeneratedMessage *)internalGetResult
{
  return _result;
}

- (TestMessageSetExtension2_Builder *)clear
{
  self.result = [[TestMessageSetExtension2 alloc] init];
  return self;
}

- (TestMessageSetExtension2_Builder *)clone
{
  return [TestMessageSetExtension2 builderWithPrototype:_result];
}

- (TestMessageSetExtension2 *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (TestMessageSetExtension2 *)buildPartial
{
  TestMessageSetExtension2 *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (TestMessageSetExtension2_Builder *)mergeFrom:(TestMessageSetExtension2 *)other
{
  if (other == nil) {
    return self;
  }
  if (other.hasStr) {
    [self setStr:other.str];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (TestMessageSetExtension2_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (TestMessageSetExtension2_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
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
      case 202: {
        [self setStr:[input readString]];
        break;
      }
    }
  }
}

- (BOOL)hasStr
{
  return _result.hasStr;
}

- (NSString *)str
{
  return _result.str;
}

- (TestMessageSetExtension2_Builder*)setStr:(NSString *)value
{
  _result.str = value;
  return self;
}

- (TestMessageSetExtension2_Builder*)clearStr
{
  [_result clearStr];
  return self;
}

@end


@interface RawMessageSet ()


@end


@implementation RawMessageSet

- (instancetype)init
{
  if ((self = [super init])) {
  }
  return self;
}

- (RawMessageSet_Item *)itemAtIndex:(NSUInteger)index
{
  return _item[index];
}
- (void)addItem:(RawMessageSet_Item *)value
{
  if (value == nil) {
    return;
  }
  if (_item == nil) {
    _item = [[NSMutableArray alloc] init];
  }
  [_item addObject:value];
}

- (void)addItemArray:(NSArray *)array
{
  if (_item == nil) {
    _item = [[NSMutableArray alloc] init];
  }
  [_item addObjectsFromArray:array];
}

- (void)setItemArray:(NSArray *)array
{
  _item = [[NSMutableArray alloc] initWithArray:array];
}

- (void)clearItem
{
  _item = nil;
}

- (BOOL)isInitialized
{
  for (RawMessageSet_Item *element in self.item) {
    if (!element.isInitialized) {
      return NO;
    }
  }
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  for (RawMessageSet_Item *element in self.item) {
    [output writeGroup:1 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  for (RawMessageSet_Item *element in self.item) {
    size_ += computeGroupSize(1, element);
  }
  size_ += self.unknownFields.serializedSize;
  return size_;
}

+ (RawMessageSet *)parseFromData:(NSData *)data
{
  return (RawMessageSet *)[[[RawMessageSet builder] mergeFromData:data] build];
}

+ (RawMessageSet *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (RawMessageSet*)[[[RawMessageSet builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (RawMessageSet *)parseFromInputStream:(NSInputStream *)input
{
  return (RawMessageSet*)[[[RawMessageSet builder] mergeFromInputStream:input] build];
}

+ (RawMessageSet *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (RawMessageSet*)[[[RawMessageSet builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (RawMessageSet *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[RawMessageSet builder] mergeFromCodedInputStream:input] build];
}

+ (RawMessageSet *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[RawMessageSet builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (RawMessageSet_Builder *)builder
{
  return [[RawMessageSet_Builder alloc] init];
}

+ (RawMessageSet_Builder *)builderWithPrototype:(RawMessageSet *)prototype
{
  return [[RawMessageSet builder] mergeFrom:prototype];
}

- (RawMessageSet_Builder *)builder
{
  return [RawMessageSet builder];
}

- (RawMessageSet_Builder *)toBuilder
{
  return [RawMessageSet builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  for (RawMessageSet_Item *element in self.item) {
    [output appendFormat:@"%@%@ {\n", indent, @"item"];
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
  if (![other isKindOfClass:[RawMessageSet class]]) {
    return NO;
  }
  RawMessageSet *otherMessage = other;
  return
    [self.item isEqualToArray:otherMessage.item] &&
    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  for (RawMessageSet_Item *element in self.item) {
    hashCode = hashCode * 31 + [element hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface RawMessageSet_Item ()


@end


@implementation RawMessageSet_Item

- (BOOL)hasTypeId
{
  return _hasTypeId;
}

- (void)setTypeId:(int32_t)value
{
  _hasTypeId = YES;
  _typeId = value;
}

- (void)clearTypeId
{
  _hasTypeId = NO;
  _typeId = 0;
}

- (BOOL)hasMessage
{
  return _hasMessage;
}

- (void)setMessage:(NSData *)value
{
  _hasMessage = value != nil;
  _message = value;
}

- (void)clearMessage
{
  _hasMessage = NO;
  _message = nil;
}

- (instancetype)init
{
  if ((self = [super init])) {
    _typeId = 0;
    _message = nil;
  }
  return self;
}

- (BOOL)isInitialized
{
  if (!self.hasTypeId) {
    return NO;
  }
  if (!self.hasMessage) {
    return NO;
  }
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  if (self.hasTypeId) {
    [output writeInt32:2 value:self.typeId];
  }
  if (self.hasMessage) {
    [output writeData:3 value:self.message];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  if (self.hasTypeId) {
    size_ += computeInt32Size(2, self.typeId);
  }
  if (self.hasMessage) {
    size_ += computeDataSize(3, self.message);
  }
  size_ += self.unknownFields.serializedSize;
  return size_;
}

+ (RawMessageSet_Item *)parseFromData:(NSData *)data
{
  return (RawMessageSet_Item *)[[[RawMessageSet_Item builder] mergeFromData:data] build];
}

+ (RawMessageSet_Item *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (RawMessageSet_Item*)[[[RawMessageSet_Item builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (RawMessageSet_Item *)parseFromInputStream:(NSInputStream *)input
{
  return (RawMessageSet_Item*)[[[RawMessageSet_Item builder] mergeFromInputStream:input] build];
}

+ (RawMessageSet_Item *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (RawMessageSet_Item*)[[[RawMessageSet_Item builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (RawMessageSet_Item *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[RawMessageSet_Item builder] mergeFromCodedInputStream:input] build];
}

+ (RawMessageSet_Item *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[RawMessageSet_Item builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (RawMessageSet_Item_Builder *)builder
{
  return [[RawMessageSet_Item_Builder alloc] init];
}

+ (RawMessageSet_Item_Builder *)builderWithPrototype:(RawMessageSet_Item *)prototype
{
  return [[RawMessageSet_Item builder] mergeFrom:prototype];
}

- (RawMessageSet_Item_Builder *)builder
{
  return [RawMessageSet_Item builder];
}

- (RawMessageSet_Item_Builder *)toBuilder
{
  return [RawMessageSet_Item builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  if (self.hasTypeId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"typeId", @(self.typeId)];
  }
  if (self.hasMessage) {
    [output appendFormat:@"%@%@: %@\n", indent, @"message", self.message];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}

- (BOOL)isEqual:(id)other
{
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[RawMessageSet_Item class]]) {
    return NO;
  }
  RawMessageSet_Item *otherMessage = other;
  return
    (self.hasTypeId == otherMessage.hasTypeId && (!self.hasTypeId || self.typeId == otherMessage.typeId)) &&
    (self.hasMessage == otherMessage.hasMessage && (!self.hasMessage || [self.message isEqual:otherMessage.message])) &&
    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  if (self.hasTypeId) {
    hashCode = hashCode * 31 + [@(self.typeId) hash];
  }
  if (self.hasMessage) {
    hashCode = hashCode * 31 + [self.message hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface RawMessageSet_Item_Builder()

@property (strong) RawMessageSet_Item *result;

@end


@implementation RawMessageSet_Item_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[RawMessageSet_Item alloc] init];
  }
  return self;
}

- (PBGeneratedMessage *)internalGetResult
{
  return _result;
}

- (RawMessageSet_Item_Builder *)clear
{
  self.result = [[RawMessageSet_Item alloc] init];
  return self;
}

- (RawMessageSet_Item_Builder *)clone
{
  return [RawMessageSet_Item builderWithPrototype:_result];
}

- (RawMessageSet_Item *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (RawMessageSet_Item *)buildPartial
{
  RawMessageSet_Item *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (RawMessageSet_Item_Builder *)mergeFrom:(RawMessageSet_Item *)other
{
  if (other == nil) {
    return self;
  }
  if (other.hasTypeId) {
    [self setTypeId:other.typeId];
  }
  if (other.hasMessage) {
    [self setMessage:other.message];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (RawMessageSet_Item_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (RawMessageSet_Item_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
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
      case 16: {
        [self setTypeId:[input readInt32]];
        break;
      }
      case 26: {
        [self setMessage:[input readData]];
        break;
      }
    }
  }
}

- (BOOL)hasTypeId
{
  return _result.hasTypeId;
}

- (int32_t)typeId
{
  return _result.typeId;
}

- (RawMessageSet_Item_Builder*)setTypeId:(int32_t)value
{
  _result.typeId = value;
  return self;
}

- (RawMessageSet_Item_Builder*)clearTypeId
{
  [_result clearTypeId];
  return self;
}

- (BOOL)hasMessage
{
  return _result.hasMessage;
}

- (NSData *)message
{
  return _result.message;
}

- (RawMessageSet_Item_Builder*)setMessage:(NSData *)value
{
  _result.message = value;
  return self;
}

- (RawMessageSet_Item_Builder*)clearMessage
{
  [_result clearMessage];
  return self;
}

@end


@interface RawMessageSet_Builder()

@property (strong) RawMessageSet *result;

@end


@implementation RawMessageSet_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[RawMessageSet alloc] init];
  }
  return self;
}

- (PBGeneratedMessage *)internalGetResult
{
  return _result;
}

- (RawMessageSet_Builder *)clear
{
  self.result = [[RawMessageSet alloc] init];
  return self;
}

- (RawMessageSet_Builder *)clone
{
  return [RawMessageSet builderWithPrototype:_result];
}

- (RawMessageSet *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (RawMessageSet *)buildPartial
{
  RawMessageSet *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (RawMessageSet_Builder *)mergeFrom:(RawMessageSet *)other
{
  if (other == nil) {
    return self;
  }
  if (other.item.count > 0) {
    if (_result.item == nil) {
      _result.item = [[NSMutableArray alloc] initWithArray:other.item];
    } else {
      [_result.item addObjectsFromArray:other.item];
    }
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (RawMessageSet_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (RawMessageSet_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
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
      case 11: {
        RawMessageSet_Item_Builder *subBuilder = [RawMessageSet_Item builder];
        [input readGroup:1 builder:subBuilder extensionRegistry:extensionRegistry];
        [self addItem:[subBuilder buildPartial]];
        break;
      }
    }
  }
}

- (NSMutableArray *)item
{
  return _result.item;
}

- (RawMessageSet_Item *)itemAtIndex:(NSUInteger)index
{
  return [_result itemAtIndex:index];
}

- (RawMessageSet_Builder *)addItem:(RawMessageSet_Item *)value
{
  [_result addItem:value];
  return self;
}

- (RawMessageSet_Builder *)setItemArray:(NSArray *)array
{
  [_result setItemArray:array];
  return self;
}

- (RawMessageSet_Builder *)clearItem
{
  [_result clearItem];
  return self;
}

@end


