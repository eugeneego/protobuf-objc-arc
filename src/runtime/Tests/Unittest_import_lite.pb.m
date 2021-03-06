// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Unittest_import_lite.pb.h"


@implementation UnittestImportLiteRoot

static PBExtensionRegistry *extensionRegistry = nil;

+ (PBExtensionRegistry *)extensionRegistry
{
  return extensionRegistry;
}

+ (void)initialize {
  if (self == [UnittestImportLiteRoot class]) {
    PBMutableExtensionRegistry *registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = registry;
  }
}

+ (void)registerAllExtensions:(PBMutableExtensionRegistry *)registry
{
}

@end


BOOL ImportEnumLiteIsValidValue(ImportEnumLite value)
{
  return YES;
}

NSString *ImportEnumLiteToString(ImportEnumLite value)
{
  switch (value) {
    case ImportEnumLiteImportLiteFoo:
      return @"IMPORT_LITE_FOO";
    case ImportEnumLiteImportLiteBar:
      return @"IMPORT_LITE_BAR";
    case ImportEnumLiteImportLiteBaz:
      return @"IMPORT_LITE_BAZ";
    default:
      return [NSString stringWithFormat:@"%d", (int)value];
  }
}


@interface ImportMessageLite ()


@end


@implementation ImportMessageLite

- (BOOL)hasD
{
  return _hasD;
}

- (void)setD:(int32_t)value
{
  _hasD = YES;
  _d = value;
}

- (void)clearD
{
  _hasD = NO;
  _d = 0;
}

- (instancetype)init
{
  if ((self = [super init])) {
    _d = 0;
  }
  return self;
}

- (BOOL)isInitialized
{
  return YES;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)output
{
  if (self.hasD) {
    [output writeInt32:1 value:self.d];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}

- (int32_t)serializedSize
{
  int32_t size_ = 0;
  if (self.hasD) {
    size_ += computeInt32Size(1, self.d);
  }
  size_ += self.unknownFields.serializedSize;
  return size_;
}

+ (ImportMessageLite *)parseFromData:(NSData *)data
{
  return (ImportMessageLite *)[[[ImportMessageLite builder] mergeFromData:data] build];
}

+ (ImportMessageLite *)parseFromData:(NSData *)data extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (ImportMessageLite*)[[[ImportMessageLite builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}

+ (ImportMessageLite *)parseFromInputStream:(NSInputStream *)input
{
  return (ImportMessageLite*)[[[ImportMessageLite builder] mergeFromInputStream:input] build];
}

+ (ImportMessageLite *)parseFromInputStream:(NSInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return (ImportMessageLite*)[[[ImportMessageLite builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (ImportMessageLite *)parseFromCodedInputStream:(PBCodedInputStream *)input
{
  return [[[ImportMessageLite builder] mergeFromCodedInputStream:input] build];
}

+ (ImportMessageLite *)parseFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry *)extensionRegistry
{
  return [[[ImportMessageLite builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}

+ (ImportMessageLite_Builder *)builder
{
  return [[ImportMessageLite_Builder alloc] init];
}

+ (ImportMessageLite_Builder *)builderWithPrototype:(ImportMessageLite *)prototype
{
  return [[ImportMessageLite builder] mergeFrom:prototype];
}

- (ImportMessageLite_Builder *)builder
{
  return [ImportMessageLite builder];
}

- (ImportMessageLite_Builder *)toBuilder
{
  return [ImportMessageLite builderWithPrototype:self];
}

- (void)writeDescriptionTo:(NSMutableString *)output withIndent:(NSString *)indent
{
  if (self.hasD) {
    [output appendFormat:@"%@%@: %@\n", indent, @"d", @(self.d)];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}

- (BOOL)isEqual:(id)other
{
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[ImportMessageLite class]]) {
    return NO;
  }
  ImportMessageLite *otherMessage = other;
  return
    (self.hasD == otherMessage.hasD && (!self.hasD || self.d == otherMessage.d)) &&
    (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}

- (NSUInteger)hash
{
  NSUInteger hashCode = 7;
  if (self.hasD) {
    hashCode = hashCode * 31 + [@(self.d) hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}

@end


@interface ImportMessageLite_Builder()

@property (strong) ImportMessageLite *result;

@end


@implementation ImportMessageLite_Builder

- (instancetype)init
{
  if ((self = [super init])) {
    self.result = [[ImportMessageLite alloc] init];
  }
  return self;
}

- (PBGeneratedMessage *)internalGetResult
{
  return _result;
}

- (ImportMessageLite_Builder *)clear
{
  self.result = [[ImportMessageLite alloc] init];
  return self;
}

- (ImportMessageLite_Builder *)clone
{
  return [ImportMessageLite builderWithPrototype:_result];
}

- (ImportMessageLite *)build
{
  [self checkInitialized];
  return [self buildPartial];
}

- (ImportMessageLite *)buildPartial
{
  ImportMessageLite *returnMe = _result;
  self.result = nil;
  return returnMe;
}

- (ImportMessageLite_Builder *)mergeFrom:(ImportMessageLite *)other
{
  if (other == nil) {
    return self;
  }
  if (other.hasD) {
    [self setD:other.d];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}

- (ImportMessageLite_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input
{
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}

- (ImportMessageLite_Builder *)mergeFromCodedInputStream:(PBCodedInputStream *)input extensionRegistry:(PBExtensionRegistry*)extensionRegistry
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
      case 8: {
        [self setD:[input readInt32]];
        break;
      }
    }
  }
}

- (BOOL)hasD
{
  return _result.hasD;
}

- (int32_t)d
{
  return _result.d;
}

- (ImportMessageLite_Builder*)setD:(int32_t)value
{
  _result.d = value;
  return self;
}

- (ImportMessageLite_Builder*)clearD
{
  [_result clearD];
  return self;
}

@end


