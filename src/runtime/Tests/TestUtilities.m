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

#import "TestUtilities.h"
#import "ProtocolBuffers.h"
#import "Unittest.pb.h"

@implementation TestUtilities

+ (NSData *)getData:(NSString *)str
{
  return [str dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSData *)goldenData
{
  // using this rather than -mainBundle to fix octest failure.
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *path = [bundle pathForResource:@"golden_message" ofType:nil];
  if(path == nil) {
    path = @"golden_message";
  }
  NSData *goldenData = [NSData dataWithContentsOfFile:path];
  return goldenData;
}

+ (NSData *)goldenPackedFieldsData
{
  // using this rather than -mainBundle to fix octest failure.
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *path = [bundle pathForResource:@"golden_packed_fields_message" ofType:nil];
  if(path == nil) {
    path = @"golden_packed_fields_message";
  }
  NSData *goldenData = [NSData dataWithContentsOfFile:path];
  return goldenData;
}

- (void)failWithException:(NSException *)anException
{
  @throw anException;
}

// -------------------------------------------------------------------

/**
* Modify the repeated extensions of {@code message} to contain the values
* expected by {@code assertRepeatedExtensionsModified()}.
*/
+ (void)modifyRepeatedExtensions:(TestAllExtensions *)message
{
  [message setExtension:[UnittestRoot repeatedInt32Extension] index:1 value:@501];
  [message setExtension:[UnittestRoot repeatedInt64Extension] index:1 value:@502];
  [message setExtension:[UnittestRoot repeatedUint32Extension] index:1 value:@503];
  [message setExtension:[UnittestRoot repeatedUint64Extension] index:1 value:@504];
  [message setExtension:[UnittestRoot repeatedSint32Extension] index:1 value:@505];
  [message setExtension:[UnittestRoot repeatedSint64Extension] index:1 value:@506];
  [message setExtension:[UnittestRoot repeatedFixed32Extension] index:1 value:@507];
  [message setExtension:[UnittestRoot repeatedFixed64Extension] index:1 value:@508];
  [message setExtension:[UnittestRoot repeatedSfixed32Extension] index:1 value:@509];
  [message setExtension:[UnittestRoot repeatedSfixed64Extension] index:1 value:@510];
  [message setExtension:[UnittestRoot repeatedFloatExtension] index:1 value:@511.0F];
  [message setExtension:[UnittestRoot repeatedDoubleExtension] index:1 value:@512.0];
  [message setExtension:[UnittestRoot repeatedBoolExtension] index:1 value:@YES];
  [message setExtension:[UnittestRoot repeatedStringExtension] index:1 value:@"515"];
  [message setExtension:[UnittestRoot repeatedBytesExtension] index:1 value:[TestUtilities getData:@"516"]];

  RepeatedGroup_extension *repeatedGroupExtension = [[RepeatedGroup_extension alloc] init];
  repeatedGroupExtension.a = 517;
  [message setExtension:[UnittestRoot repeatedGroupExtension] index:1 value:repeatedGroupExtension];

  TestAllTypes_NestedMessage *testAllTypesNestedMessage = [[TestAllTypes_NestedMessage alloc] init];
  testAllTypesNestedMessage.bb = 518;
  [message setExtension:[UnittestRoot repeatedNestedMessageExtension] index:1 value:testAllTypesNestedMessage];

  ForeignMessage *foreignMessage = [[ForeignMessage alloc] init];
  foreignMessage.c = 519;
  [message setExtension:[UnittestRoot repeatedForeignMessageExtension] index:1 value:foreignMessage];

  ImportMessage *importMessage = [[ImportMessage alloc] init];
  importMessage.d = 520;
  [message setExtension:[UnittestRoot repeatedImportMessageExtension] index:1 value:importMessage];

  [message setExtension:[UnittestRoot repeatedNestedEnumExtension] index:1 value:@(TestAllTypes_NestedEnumFoo)];
  [message setExtension:[UnittestRoot repeatedForeignEnumExtension] index:1 value:@(ForeignEnumForeignFoo)];
  [message setExtension:[UnittestRoot repeatedImportEnumExtension] index:1 value:@(ImportEnumImportFoo)];

  [message setExtension:[UnittestRoot repeatedStringPieceExtension] index:1 value:@"524"];
  [message setExtension:[UnittestRoot repeatedCordExtension] index:1 value:@"525"];
}

/**
* Assert (using {@code junit.framework.Assert}} that all extensions of
* {@code message} are set to the values assigned by {@code setAllExtensions}.
*/
- (void)assertAllExtensionsSet:(TestAllExtensions *)message
{
  STAssertTrue([message hasExtension:[UnittestRoot optionalInt32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalInt64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalUint32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalUint64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalSint32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalSint64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalFixed32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalFixed64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalSfixed32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalSfixed64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalFloatExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalDoubleExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalBoolExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalStringExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalBytesExtension]], @"");

  STAssertTrue([message hasExtension:[UnittestRoot optionalGroupExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalNestedMessageExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalForeignMessageExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalImportMessageExtension]], @"");

  STAssertTrue([[message getExtension:[UnittestRoot optionalGroupExtension]] hasA], @"");
  STAssertTrue([[message getExtension:[UnittestRoot optionalNestedMessageExtension]] hasBb], @"");
  STAssertTrue([[message getExtension:[UnittestRoot optionalForeignMessageExtension]] hasC], @"");
  STAssertTrue([[message getExtension:[UnittestRoot optionalImportMessageExtension]] hasD], @"");

  STAssertTrue([message hasExtension:[UnittestRoot optionalNestedEnumExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalForeignEnumExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalImportEnumExtension]], @"");

  STAssertTrue([message hasExtension:[UnittestRoot optionalStringPieceExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot optionalCordExtension]], @"");

  STAssertTrue(101 == [[message getExtension:[UnittestRoot optionalInt32Extension]] intValue], @"");
  STAssertTrue(102L == [[message getExtension:[UnittestRoot optionalInt64Extension]] intValue], @"");
  STAssertTrue(103 == [[message getExtension:[UnittestRoot optionalUint32Extension]] intValue], @"");
  STAssertTrue(104L == [[message getExtension:[UnittestRoot optionalUint64Extension]] intValue], @"");
  STAssertTrue(105 == [[message getExtension:[UnittestRoot optionalSint32Extension]] intValue], @"");
  STAssertTrue(106L == [[message getExtension:[UnittestRoot optionalSint64Extension]] intValue], @"");
  STAssertTrue(107 == [[message getExtension:[UnittestRoot optionalFixed32Extension]] intValue], @"");
  STAssertTrue(108L == [[message getExtension:[UnittestRoot optionalFixed64Extension]] intValue], @"");
  STAssertTrue(109 == [[message getExtension:[UnittestRoot optionalSfixed32Extension]] intValue], @"");
  STAssertTrue(110L == [[message getExtension:[UnittestRoot optionalSfixed64Extension]] intValue], @"");
  STAssertTrue(111.0 == [[message getExtension:[UnittestRoot optionalFloatExtension]] floatValue], @"");
  STAssertTrue(112.0 == [[message getExtension:[UnittestRoot optionalDoubleExtension]] doubleValue], @"");
  STAssertTrue(YES == [[message getExtension:[UnittestRoot optionalBoolExtension]] boolValue], @"");
  STAssertEqualObjects(@"115", [message getExtension:[UnittestRoot optionalStringExtension]], @"");
  STAssertEqualObjects([TestUtilities getData:@"116"], [message getExtension:[UnittestRoot optionalBytesExtension]], @"");

  STAssertTrue(117 == [(OptionalGroup_extension *)[message getExtension:[UnittestRoot optionalGroupExtension]] a], @"");
  STAssertTrue(118 == [(TestAllTypes_NestedMessage *)[message getExtension:[UnittestRoot optionalNestedMessageExtension]] bb], @"");
  STAssertTrue(119 == [[message getExtension:[UnittestRoot optionalForeignMessageExtension]] c], @"");
  STAssertTrue(120 == [[message getExtension:[UnittestRoot optionalImportMessageExtension]] d], @"");

  STAssertTrue(TestAllTypes_NestedEnumBaz == [[message getExtension:[UnittestRoot optionalNestedEnumExtension]] intValue], @"");
  STAssertTrue(ForeignEnumForeignBaz == [[message getExtension:[UnittestRoot optionalForeignEnumExtension]] intValue], @"");
  STAssertTrue(ImportEnumImportBaz == [[message getExtension:[UnittestRoot optionalImportEnumExtension]] intValue], @"");

  STAssertEqualObjects(@"124", [message getExtension:[UnittestRoot optionalStringPieceExtension]], @"");
  STAssertEqualObjects(@"125", [message getExtension:[UnittestRoot optionalCordExtension]], @"");

  // -----------------------------------------------------------------

  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedInt32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedInt64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedUint32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedUint64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSint32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSint64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedFixed32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedFixed64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSfixed32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSfixed64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedFloatExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedDoubleExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedBoolExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedStringExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedBytesExtension]] count], @"");

  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedGroupExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedNestedMessageExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedForeignMessageExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedImportMessageExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedNestedEnumExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedForeignEnumExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedImportEnumExtension]] count], @"");

  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedStringPieceExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedCordExtension]] count], @"");

  STAssertTrue(201 == [[[message getExtension:[UnittestRoot repeatedInt32Extension]] objectAtIndex:0] intValue], @"");;
  STAssertTrue(202L == [[[message getExtension:[UnittestRoot repeatedInt64Extension]] objectAtIndex:0] intValue], @"");;
  STAssertTrue(203 == [[[message getExtension:[UnittestRoot repeatedUint32Extension]] objectAtIndex:0] intValue], @"");;
  STAssertTrue(204L == [[[message getExtension:[UnittestRoot repeatedUint64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(205 == [[[message getExtension:[UnittestRoot repeatedSint32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(206L == [[[message getExtension:[UnittestRoot repeatedSint64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(207 == [[[message getExtension:[UnittestRoot repeatedFixed32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(208L == [[[message getExtension:[UnittestRoot repeatedFixed64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(209 == [[[message getExtension:[UnittestRoot repeatedSfixed32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(210L == [[[message getExtension:[UnittestRoot repeatedSfixed64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(211.0 == [[[message getExtension:[UnittestRoot repeatedFloatExtension]] objectAtIndex:0] floatValue], @"");
  STAssertTrue(212.0 == [[[message getExtension:[UnittestRoot repeatedDoubleExtension]] objectAtIndex:0] doubleValue], @"");
  STAssertTrue(YES == [[[message getExtension:[UnittestRoot repeatedBoolExtension]] objectAtIndex:0] boolValue], @"");
  STAssertEqualObjects(@"215", [[message getExtension:[UnittestRoot repeatedStringExtension]] objectAtIndex:0], @"");
  STAssertEqualObjects([TestUtilities getData:@"216"], [[message getExtension:[UnittestRoot repeatedBytesExtension]] objectAtIndex:0], @"");

  STAssertTrue(217 == [(RepeatedGroup_extension *)[[message getExtension:[UnittestRoot repeatedGroupExtension]] objectAtIndex:0] a], @"");
  STAssertTrue(218 == [(TestAllTypes_NestedMessage *)[[message getExtension:[UnittestRoot repeatedNestedMessageExtension]] objectAtIndex:0] bb], @"");
  STAssertTrue(219 == [[[message getExtension:[UnittestRoot repeatedForeignMessageExtension]] objectAtIndex:0] c], @"");
  STAssertTrue(220 == [[[message getExtension:[UnittestRoot repeatedImportMessageExtension]] objectAtIndex:0] d], @"");

  STAssertTrue(TestAllTypes_NestedEnumBar == [[[message getExtension:[UnittestRoot repeatedNestedEnumExtension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(ForeignEnumForeignBar == [[[message getExtension:[UnittestRoot repeatedForeignEnumExtension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(ImportEnumImportBar == [[[message getExtension:[UnittestRoot repeatedImportEnumExtension]] objectAtIndex:0] intValue], @"");

  STAssertEqualObjects(@"224", [[message getExtension:[UnittestRoot repeatedStringPieceExtension]] objectAtIndex:0], @"");
  STAssertEqualObjects(@"225", [[message getExtension:[UnittestRoot repeatedCordExtension]] objectAtIndex:0], @"");

  STAssertTrue(301 == [[[message getExtension:[UnittestRoot repeatedInt32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(302L == [[[message getExtension:[UnittestRoot repeatedInt64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(303 == [[[message getExtension:[UnittestRoot repeatedUint32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(304L == [[[message getExtension:[UnittestRoot repeatedUint64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(305 == [[[message getExtension:[UnittestRoot repeatedSint32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(306L == [[[message getExtension:[UnittestRoot repeatedSint64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(307 == [[[message getExtension:[UnittestRoot repeatedFixed32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(308L == [[[message getExtension:[UnittestRoot repeatedFixed64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(309 == [[[message getExtension:[UnittestRoot repeatedSfixed32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(310L == [[[message getExtension:[UnittestRoot repeatedSfixed64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(311.0 == [[[message getExtension:[UnittestRoot repeatedFloatExtension]] objectAtIndex:1] floatValue], @"");
  STAssertTrue(312.0 == [[[message getExtension:[UnittestRoot repeatedDoubleExtension]] objectAtIndex:1] doubleValue], @"");
  STAssertTrue(NO == [[[message getExtension:[UnittestRoot repeatedBoolExtension]] objectAtIndex:1] boolValue], @"");
  STAssertEqualObjects(@"315", [[message getExtension:[UnittestRoot repeatedStringExtension]] objectAtIndex:1], @"");
  STAssertEqualObjects([TestUtilities getData:@"316"], [[message getExtension:[UnittestRoot repeatedBytesExtension]] objectAtIndex:1], @"");

  STAssertTrue(317 == [(RepeatedGroup_extension *)[[message getExtension:[UnittestRoot repeatedGroupExtension]] objectAtIndex:1] a], @"");
  STAssertTrue(318 == [(TestAllTypes_NestedMessage *)[[message getExtension:[UnittestRoot repeatedNestedMessageExtension]] objectAtIndex:1] bb], @"");
  STAssertTrue(319 == [[[message getExtension:[UnittestRoot repeatedForeignMessageExtension]] objectAtIndex:1] c], @"");
  STAssertTrue(320 == [[[message getExtension:[UnittestRoot repeatedImportMessageExtension]] objectAtIndex:1] d], @"");

  STAssertTrue(TestAllTypes_NestedEnumBaz == [[[message getExtension:[UnittestRoot repeatedNestedEnumExtension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(ForeignEnumForeignBaz == [[[message getExtension:[UnittestRoot repeatedForeignEnumExtension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(ImportEnumImportBaz == [[[message getExtension:[UnittestRoot repeatedImportEnumExtension]] objectAtIndex:1] intValue], @"");

  STAssertEqualObjects(@"324", [[message getExtension:[UnittestRoot repeatedStringPieceExtension]] objectAtIndex:1], @"");
  STAssertEqualObjects(@"325", [[message getExtension:[UnittestRoot repeatedCordExtension]] objectAtIndex:1], @"");

  // -----------------------------------------------------------------

  STAssertTrue([message hasExtension:[UnittestRoot defaultInt32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultInt64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultUint32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultUint64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultSint32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultSint64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultFixed32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultFixed64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultSfixed32Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultSfixed64Extension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultFloatExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultDoubleExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultBoolExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultStringExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultBytesExtension]], @"");

  STAssertTrue([message hasExtension:[UnittestRoot defaultNestedEnumExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultForeignEnumExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultImportEnumExtension]], @"");

  STAssertTrue([message hasExtension:[UnittestRoot defaultStringPieceExtension]], @"");
  STAssertTrue([message hasExtension:[UnittestRoot defaultCordExtension]], @"");

  STAssertTrue(401 == [[message getExtension:[UnittestRoot defaultInt32Extension]] intValue], @"");
  STAssertTrue(402L == [[message getExtension:[UnittestRoot defaultInt64Extension]] intValue], @"");
  STAssertTrue(403 == [[message getExtension:[UnittestRoot defaultUint32Extension]] intValue], @"");
  STAssertTrue(404L == [[message getExtension:[UnittestRoot defaultUint64Extension]] intValue], @"");
  STAssertTrue(405 == [[message getExtension:[UnittestRoot defaultSint32Extension]] intValue], @"");
  STAssertTrue(406L == [[message getExtension:[UnittestRoot defaultSint64Extension]] intValue], @"");
  STAssertTrue(407 == [[message getExtension:[UnittestRoot defaultFixed32Extension]] intValue], @"");
  STAssertTrue(408L == [[message getExtension:[UnittestRoot defaultFixed64Extension]] intValue], @"");
  STAssertTrue(409 == [[message getExtension:[UnittestRoot defaultSfixed32Extension]] intValue], @"");
  STAssertTrue(410L == [[message getExtension:[UnittestRoot defaultSfixed64Extension]] intValue], @"");
  STAssertTrue(411.0 == [[message getExtension:[UnittestRoot defaultFloatExtension]] floatValue], @"");
  STAssertTrue(412.0 == [[message getExtension:[UnittestRoot defaultDoubleExtension]] doubleValue], @"");
  STAssertTrue(NO == [[message getExtension:[UnittestRoot defaultBoolExtension]] boolValue], @"");
  STAssertEqualObjects(@"415", [message getExtension:[UnittestRoot defaultStringExtension]], @"");
  STAssertEqualObjects([TestUtilities getData:@"416"], [message getExtension:[UnittestRoot defaultBytesExtension]], @"");

  STAssertTrue(TestAllTypes_NestedEnumFoo == [[message getExtension:[UnittestRoot defaultNestedEnumExtension]] intValue], @"");
  STAssertTrue(ForeignEnumForeignFoo == [[message getExtension:[UnittestRoot defaultForeignEnumExtension]] intValue], @"");
  STAssertTrue(ImportEnumImportFoo == [[message getExtension:[UnittestRoot defaultImportEnumExtension]] intValue], @"");

  STAssertEqualObjects(@"424", [message getExtension:[UnittestRoot defaultStringPieceExtension]], @"");
  STAssertEqualObjects(@"425", [message getExtension:[UnittestRoot defaultCordExtension]], @"");
}

+ (void)assertAllExtensionsSet:(TestAllExtensions *)message
{
  return [[[TestUtilities alloc] init] assertAllExtensionsSet:message];
}

- (void)assertRepeatedExtensionsModified:(TestAllExtensions *)message
{
  // ModifyRepeatedFields only sets the second repeated element of each
  // field.  In addition to verifying this, we also verify that the first
  // element and size were *not* modified.
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedInt32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedInt64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedUint32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedUint64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSint32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSint64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedFixed32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedFixed64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSfixed32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedSfixed64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedFloatExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedDoubleExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedBoolExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedStringExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedBytesExtension]] count], @"");

  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedGroupExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedNestedMessageExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedForeignMessageExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedImportMessageExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedNestedEnumExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedForeignEnumExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedImportEnumExtension]] count], @"");

  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedStringPieceExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot repeatedCordExtension]] count], @"");

  STAssertTrue(201 == [[[message getExtension:[UnittestRoot repeatedInt32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(202L == [[[message getExtension:[UnittestRoot repeatedInt64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(203 == [[[message getExtension:[UnittestRoot repeatedUint32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(204L == [[[message getExtension:[UnittestRoot repeatedUint64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(205 == [[[message getExtension:[UnittestRoot repeatedSint32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(206L == [[[message getExtension:[UnittestRoot repeatedSint64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(207 == [[[message getExtension:[UnittestRoot repeatedFixed32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(208L == [[[message getExtension:[UnittestRoot repeatedFixed64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(209 == [[[message getExtension:[UnittestRoot repeatedSfixed32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(210L == [[[message getExtension:[UnittestRoot repeatedSfixed64Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(211.0 == [[[message getExtension:[UnittestRoot repeatedFloatExtension]] objectAtIndex:0] floatValue], @"");
  STAssertTrue(212.0 == [[[message getExtension:[UnittestRoot repeatedDoubleExtension]] objectAtIndex:0] doubleValue], @"");
  STAssertTrue(YES == [[[message getExtension:[UnittestRoot repeatedBoolExtension]] objectAtIndex:0] boolValue], @"");
  STAssertEqualObjects(@"215", [[message getExtension:[UnittestRoot repeatedStringExtension]] objectAtIndex:0], @"");
  STAssertEqualObjects([TestUtilities getData:@"216"], [[message getExtension:[UnittestRoot repeatedBytesExtension]] objectAtIndex:0], @"");

  STAssertTrue(217 == [(RepeatedGroup_extension *)[[message getExtension:[UnittestRoot repeatedGroupExtension]] objectAtIndex:0] a], @"");
  STAssertTrue(218 == [(TestAllTypes_NestedMessage *)[[message getExtension:[UnittestRoot repeatedNestedMessageExtension]] objectAtIndex:0] bb], @"");
  STAssertTrue(219 == [[[message getExtension:[UnittestRoot repeatedForeignMessageExtension]] objectAtIndex:0] c], @"");
  STAssertTrue(220 == [[[message getExtension:[UnittestRoot repeatedImportMessageExtension]] objectAtIndex:0] d], @"");

  STAssertTrue(TestAllTypes_NestedEnumBar == [[[message getExtension:[UnittestRoot repeatedNestedEnumExtension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(ForeignEnumForeignBar == [[[message getExtension:[UnittestRoot repeatedForeignEnumExtension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(ImportEnumImportBar == [[[message getExtension:[UnittestRoot repeatedImportEnumExtension]] objectAtIndex:0] intValue], @"");

  STAssertEqualObjects(@"224", [[message getExtension:[UnittestRoot repeatedStringPieceExtension]] objectAtIndex:0], @"");
  STAssertEqualObjects(@"225", [[message getExtension:[UnittestRoot repeatedCordExtension]] objectAtIndex:0], @"");

  // Actually verify the second (modified) elements now.
  STAssertTrue(501 == [[[message getExtension:[UnittestRoot repeatedInt32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(502L == [[[message getExtension:[UnittestRoot repeatedInt64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(503 == [[[message getExtension:[UnittestRoot repeatedUint32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(504L == [[[message getExtension:[UnittestRoot repeatedUint64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(505 == [[[message getExtension:[UnittestRoot repeatedSint32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(506L == [[[message getExtension:[UnittestRoot repeatedSint64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(507 == [[[message getExtension:[UnittestRoot repeatedFixed32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(508L == [[[message getExtension:[UnittestRoot repeatedFixed64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(509 == [[[message getExtension:[UnittestRoot repeatedSfixed32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(510L == [[[message getExtension:[UnittestRoot repeatedSfixed64Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(511.0 == [[[message getExtension:[UnittestRoot repeatedFloatExtension]] objectAtIndex:1] floatValue], @"");
  STAssertTrue(512.0 == [[[message getExtension:[UnittestRoot repeatedDoubleExtension]] objectAtIndex:1] doubleValue], @"");
  STAssertTrue(YES == [[[message getExtension:[UnittestRoot repeatedBoolExtension]] objectAtIndex:1] boolValue], @"");
  STAssertEqualObjects(@"515", [[message getExtension:[UnittestRoot repeatedStringExtension]] objectAtIndex:1], @"");
  STAssertEqualObjects([TestUtilities getData:@"516"], [[message getExtension:[UnittestRoot repeatedBytesExtension]] objectAtIndex:1], @"");

  STAssertTrue(517 == [(RepeatedGroup_extension *)[[message getExtension:[UnittestRoot repeatedGroupExtension]] objectAtIndex:1] a], @"");
  STAssertTrue(518 == [(TestAllTypes_NestedMessage *)[[message getExtension:[UnittestRoot repeatedNestedMessageExtension]] objectAtIndex:1] bb], @"");
  STAssertTrue(519 == [[[message getExtension:[UnittestRoot repeatedForeignMessageExtension]] objectAtIndex:1] c], @"");
  STAssertTrue(520 == [[[message getExtension:[UnittestRoot repeatedImportMessageExtension]] objectAtIndex:1] d], @"");

  STAssertTrue(TestAllTypes_NestedEnumFoo == [[[message getExtension:[UnittestRoot repeatedNestedEnumExtension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(ForeignEnumForeignFoo == [[[message getExtension:[UnittestRoot repeatedForeignEnumExtension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(ImportEnumImportFoo == [[[message getExtension:[UnittestRoot repeatedImportEnumExtension]] objectAtIndex:1] intValue], @"");

  STAssertEqualObjects(@"524", [[message getExtension:[UnittestRoot repeatedStringPieceExtension]] objectAtIndex:1], @"");
  STAssertEqualObjects(@"525", [[message getExtension:[UnittestRoot repeatedCordExtension]] objectAtIndex:1], @"");
}

+ (void)assertRepeatedExtensionsModified:(TestAllExtensions *)message
{
  [[[TestUtilities alloc] init] assertRepeatedExtensionsModified:message];
}

// -------------------------------------------------------------------

/**
* Assert (using {@code junit.framework.Assert}} that all fields of
* {@code message} are set to the values assigned by {@code setAllFields}.
*/
- (void)assertAllFieldsSet:(TestAllTypes *)message
{
  STAssertTrue(message.hasOptionalInt32, @"");
  STAssertTrue(message.hasOptionalInt64, @"");
  STAssertTrue(message.hasOptionalUint32, @"");
  STAssertTrue(message.hasOptionalUint64, @"");
  STAssertTrue(message.hasOptionalSint32, @"");
  STAssertTrue(message.hasOptionalSint64, @"");
  STAssertTrue(message.hasOptionalFixed32, @"");
  STAssertTrue(message.hasOptionalFixed64, @"");
  STAssertTrue(message.hasOptionalSfixed32, @"");
  STAssertTrue(message.hasOptionalSfixed64, @"");
  STAssertTrue(message.hasOptionalFloat, @"");
  STAssertTrue(message.hasOptionalDouble, @"");
  STAssertTrue(message.hasOptionalBool, @"");
  STAssertTrue(message.hasOptionalString, @"");
  STAssertTrue(message.hasOptionalBytes, @"");

  STAssertTrue(message.hasOptionalGroup, @"");
  STAssertTrue(message.hasOptionalNestedMessage, @"");
  STAssertTrue(message.hasOptionalForeignMessage, @"");
  STAssertTrue(message.hasOptionalImportMessage, @"");

  STAssertTrue(message.optionalGroup.hasA, @"");
  STAssertTrue(message.optionalNestedMessage.hasBb, @"");
  STAssertTrue(message.optionalForeignMessage.hasC, @"");
  STAssertTrue(message.optionalImportMessage.hasD, @"");

  STAssertTrue(message.hasOptionalNestedEnum, @"");
  STAssertTrue(message.hasOptionalForeignEnum, @"");
  STAssertTrue(message.hasOptionalImportEnum, @"");

  STAssertTrue(message.hasOptionalStringPiece, @"");
  STAssertTrue(message.hasOptionalCord, @"");

  STAssertTrue(101 == message.optionalInt32, @"");
  STAssertTrue(102 == message.optionalInt64, @"");
  STAssertTrue(103 == message.optionalUint32, @"");
  STAssertTrue(104 == message.optionalUint64, @"");
  STAssertTrue(105 == message.optionalSint32, @"");
  STAssertTrue(106 == message.optionalSint64, @"");
  STAssertTrue(107 == message.optionalFixed32, @"");
  STAssertTrue(108 == message.optionalFixed64, @"");
  STAssertTrue(109 == message.optionalSfixed32, @"");
  STAssertTrue(110 == message.optionalSfixed64, @"");
  STAssertEqualsWithAccuracy(111.0f, message.optionalFloat, 0.1, @"");
  STAssertEqualsWithAccuracy(112.0, message.optionalDouble, 0.1, @"");
  STAssertTrue(YES == message.optionalBool, @"");
  STAssertEqualObjects(@"115", message.optionalString, @"");
  STAssertEqualObjects([TestUtilities getData:@"116"], message.optionalBytes, @"");

  STAssertTrue(117 == message.optionalGroup.a, @"");
  STAssertTrue(118 == message.optionalNestedMessage.bb, @"");
  STAssertTrue(119 == message.optionalForeignMessage.c, @"");
  STAssertTrue(120 == message.optionalImportMessage.d, @"");

  STAssertTrue(TestAllTypes_NestedEnumBaz == message.optionalNestedEnum, @"");
  STAssertTrue(ForeignEnumForeignBaz == message.optionalForeignEnum, @"");
  STAssertTrue(ImportEnumImportBaz == message.optionalImportEnum, @"");

  STAssertEqualObjects(@"124", message.optionalStringPiece, @"");
  STAssertEqualObjects(@"125", message.optionalCord, @"");

  // -----------------------------------------------------------------

  STAssertTrue(2 == message.repeatedInt32.count, @"");
  STAssertTrue(2 == message.repeatedInt64.count, @"");
  STAssertTrue(2 == message.repeatedUint32.count, @"");
  STAssertTrue(2 == message.repeatedUint64.count, @"");
  STAssertTrue(2 == message.repeatedSint32.count, @"");
  STAssertTrue(2 == message.repeatedSint64.count, @"");
  STAssertTrue(2 == message.repeatedFixed32.count, @"");
  STAssertTrue(2 == message.repeatedFixed64.count, @"");
  STAssertTrue(2 == message.repeatedSfixed32.count, @"");
  STAssertTrue(2 == message.repeatedSfixed64.count, @"");
  STAssertTrue(2 == message.repeatedFloat.count, @"");
  STAssertTrue(2 == message.repeatedDouble.count, @"");
  STAssertTrue(2 == message.repeatedBool.count, @"");
  STAssertTrue(2 == message.repeatedString.count, @"");
  STAssertTrue(2 == message.repeatedBytes.count, @"");

  STAssertTrue(2 == message.repeatedGroup.count, @"");
  STAssertTrue(2 == message.repeatedNestedMessage.count, @"");
  STAssertTrue(2 == message.repeatedForeignMessage.count, @"");
  STAssertTrue(2 == message.repeatedImportMessage.count, @"");
  STAssertTrue(2 == message.repeatedNestedEnum.count, @"");
  STAssertTrue(2 == message.repeatedForeignEnum.count, @"");
  STAssertTrue(2 == message.repeatedImportEnum.count, @"");

  STAssertTrue(2 == message.repeatedStringPiece.count, @"");
  STAssertTrue(2 == message.repeatedCord.count, @"");

  STAssertTrue(201 == [message repeatedInt32AtIndex:0], @"");
  STAssertTrue(202 == [message repeatedInt64AtIndex:0], @"");
  STAssertTrue(203 == [message repeatedUint32AtIndex:0], @"");
  STAssertTrue(204 == [message repeatedUint64AtIndex:0], @"");
  STAssertTrue(205 == [message repeatedSint32AtIndex:0], @"");
  STAssertTrue(206 == [message repeatedSint64AtIndex:0], @"");
  STAssertTrue(207 == [message repeatedFixed32AtIndex:0], @"");
  STAssertTrue(208 == [message repeatedFixed64AtIndex:0], @"");
  STAssertTrue(209 == [message repeatedSfixed32AtIndex:0], @"");
  STAssertTrue(210 == [message repeatedSfixed64AtIndex:0], @"");
  STAssertEqualsWithAccuracy(211.0f, [message repeatedFloatAtIndex:0], 0.1, @"");
  STAssertEqualsWithAccuracy(212.0, [message repeatedDoubleAtIndex:0], 0.1, @"");
  STAssertTrue(YES == [message repeatedBoolAtIndex:0], @"");
  STAssertEqualObjects(@"215", [message repeatedStringAtIndex:0], @"");
  STAssertEqualObjects([TestUtilities getData:@"216"], [message repeatedBytesAtIndex:0], @"");

  STAssertTrue(217 == [message repeatedGroupAtIndex:0].a, @"");
  STAssertTrue(218 == [message repeatedNestedMessageAtIndex:0].bb, @"");
  STAssertTrue(219 == [message repeatedForeignMessageAtIndex:0].c, @"");
  STAssertTrue(220 == [message repeatedImportMessageAtIndex:0].d, @"");

  STAssertTrue(TestAllTypes_NestedEnumBar == [message repeatedNestedEnumAtIndex:0], @"");
  STAssertTrue(ForeignEnumForeignBar == [message repeatedForeignEnumAtIndex:0], @"");
  STAssertTrue(ImportEnumImportBar == [message repeatedImportEnumAtIndex:0], @"");

  STAssertEqualObjects(@"224", [message repeatedStringPieceAtIndex:0], @"");
  STAssertEqualObjects(@"225", [message repeatedCordAtIndex:0], @"");

  STAssertTrue(301 == [message repeatedInt32AtIndex:1], @"");
  STAssertTrue(302 == [message repeatedInt64AtIndex:1], @"");
  STAssertTrue(303 == [message repeatedUint32AtIndex:1], @"");
  STAssertTrue(304 == [message repeatedUint64AtIndex:1], @"");
  STAssertTrue(305 == [message repeatedSint32AtIndex:1], @"");
  STAssertTrue(306 == [message repeatedSint64AtIndex:1], @"");
  STAssertTrue(307 == [message repeatedFixed32AtIndex:1], @"");
  STAssertTrue(308 == [message repeatedFixed64AtIndex:1], @"");
  STAssertTrue(309 == [message repeatedSfixed32AtIndex:1], @"");
  STAssertTrue(310 == [message repeatedSfixed64AtIndex:1], @"");
  STAssertEqualsWithAccuracy(311.0f, [message repeatedFloatAtIndex:1], 0.1, @"");
  STAssertEqualsWithAccuracy(312.0, [message repeatedDoubleAtIndex:1], 0.1, @"");
  STAssertTrue(NO == [message repeatedBoolAtIndex:1], @"");
  STAssertEqualObjects(@"315", [message repeatedStringAtIndex:1], @"");
  STAssertEqualObjects([TestUtilities getData:@"316"], [message repeatedBytesAtIndex:1], @"");

  STAssertTrue(317 == [message repeatedGroupAtIndex:1].a, @"");
  STAssertTrue(318 == [message repeatedNestedMessageAtIndex:1].bb, @"");
  STAssertTrue(319 == [message repeatedForeignMessageAtIndex:1].c, @"");
  STAssertTrue(320 == [message repeatedImportMessageAtIndex:1].d, @"");

  STAssertTrue(TestAllTypes_NestedEnumBaz == [message repeatedNestedEnumAtIndex:1], @"");
  STAssertTrue(ForeignEnumForeignBaz == [message repeatedForeignEnumAtIndex:1], @"");
  STAssertTrue(ImportEnumImportBaz == [message repeatedImportEnumAtIndex:1], @"");

  STAssertEqualObjects(@"324", [message repeatedStringPieceAtIndex:1], @"");
  STAssertEqualObjects(@"325", [message repeatedCordAtIndex:1], @"");

  // -----------------------------------------------------------------

  STAssertTrue(message.hasDefaultInt32, @"");
  STAssertTrue(message.hasDefaultInt64, @"");
  STAssertTrue(message.hasDefaultUint32, @"");
  STAssertTrue(message.hasDefaultUint64, @"");
  STAssertTrue(message.hasDefaultSint32, @"");
  STAssertTrue(message.hasDefaultSint64, @"");
  STAssertTrue(message.hasDefaultFixed32, @"");
  STAssertTrue(message.hasDefaultFixed64, @"");
  STAssertTrue(message.hasDefaultSfixed32, @"");
  STAssertTrue(message.hasDefaultSfixed64, @"");
  STAssertTrue(message.hasDefaultFloat, @"");
  STAssertTrue(message.hasDefaultDouble, @"");
  STAssertTrue(message.hasDefaultBool, @"");
  STAssertTrue(message.hasDefaultString, @"");
  STAssertTrue(message.hasDefaultBytes, @"");

  STAssertTrue(message.hasDefaultNestedEnum, @"");
  STAssertTrue(message.hasDefaultForeignEnum, @"");
  STAssertTrue(message.hasDefaultImportEnum, @"");

  STAssertTrue(message.hasDefaultStringPiece, @"");
  STAssertTrue(message.hasDefaultCord, @"");

  STAssertTrue(401 == message.defaultInt32, @"");
  STAssertTrue(402 == message.defaultInt64, @"");
  STAssertTrue(403 == message.defaultUint32, @"");
  STAssertTrue(404 == message.defaultUint64, @"");
  STAssertTrue(405 == message.defaultSint32, @"");
  STAssertTrue(406 == message.defaultSint64, @"");
  STAssertTrue(407 == message.defaultFixed32, @"");
  STAssertTrue(408 == message.defaultFixed64, @"");
  STAssertTrue(409 == message.defaultSfixed32, @"");
  STAssertTrue(410 == message.defaultSfixed64, @"");
  STAssertEqualsWithAccuracy(411.0f, message.defaultFloat, 0.1, @"");
  STAssertEqualsWithAccuracy(412.0, message.defaultDouble, 0.1, @"");
  STAssertTrue(NO == message.defaultBool, @"");
  STAssertEqualObjects(@"415", message.defaultString, @"");
  STAssertEqualObjects([TestUtilities getData:@"416"], message.defaultBytes, @"");

  STAssertTrue(TestAllTypes_NestedEnumFoo == message.defaultNestedEnum, @"");
  STAssertTrue(ForeignEnumForeignFoo == message.defaultForeignEnum, @"");
  STAssertTrue(ImportEnumImportFoo == message.defaultImportEnum, @"");

  STAssertEqualObjects(@"424", message.defaultStringPiece, @"");
  STAssertEqualObjects(@"425", message.defaultCord, @"");
}

+ (void)assertAllFieldsSet:(TestAllTypes *)message
{
  [[[TestUtilities alloc] init] assertAllFieldsSet:message];
}

+ (void)setAllFields:(TestAllTypes *)message
{
  message.optionalInt32 = 101;
  message.optionalInt64 = 102;
  message.optionalUint32 = 103;
  message.optionalUint64 = 104;
  message.optionalSint32 = 105;
  message.optionalSint64 = 106;
  message.optionalFixed32 = 107;
  message.optionalFixed64 = 108;
  message.optionalSfixed32 = 109;
  message.optionalSfixed64 = 110;
  message.optionalFloat = 111;
  message.optionalDouble = 112;
  message.optionalBool = YES;
  message.optionalString = @"115";
  message.optionalBytes = [self getData:@"116"];

  message.optionalGroup = [[TestAllTypes_OptionalGroup alloc] init];
  message.optionalGroup.a = 117;

  message.optionalNestedMessage = [[TestAllTypes_NestedMessage alloc] init];
  message.optionalNestedMessage.bb = 118;

  message.optionalForeignMessage = [[ForeignMessage alloc] init];
  message.optionalForeignMessage.c = 119;

  message.optionalImportMessage = [[ImportMessage alloc] init];
  message.optionalImportMessage.d = 120;

  message.optionalNestedEnum = TestAllTypes_NestedEnumBaz;
  message.optionalForeignEnum = ForeignEnumForeignBaz;
  message.optionalImportEnum = ImportEnumImportBaz;

  message.optionalStringPiece = @"124";
  message.optionalCord = @"125";

  // -----------------------------------------------------------------

  [message addRepeatedInt32:201];
  [message addRepeatedInt64:202];
  [message addRepeatedUint32:203];
  [message addRepeatedUint64:204];
  [message addRepeatedSint32:205];
  [message addRepeatedSint64:206];
  [message addRepeatedFixed32:207];
  [message addRepeatedFixed64:208];
  [message addRepeatedSfixed32:209];
  [message addRepeatedSfixed64:210];
  [message addRepeatedFloat:211];
  [message addRepeatedDouble:212];
  [message addRepeatedBool:YES];
  [message addRepeatedString:@"215"];
  [message addRepeatedBytes:[self getData:@"216"]];

  TestAllTypes_RepeatedGroup *testAllTypesRepeatedGroup1 = [[TestAllTypes_RepeatedGroup alloc] init];
  testAllTypesRepeatedGroup1.a = 217;
  [message addRepeatedGroup:testAllTypesRepeatedGroup1];

  TestAllTypes_NestedMessage *testAllTypesNestedMessage1 = [[TestAllTypes_NestedMessage alloc] init];
  testAllTypesNestedMessage1.bb = 218;
  [message addRepeatedNestedMessage:testAllTypesNestedMessage1];

  ForeignMessage *foreignMessage1 = [[ForeignMessage alloc] init];
  foreignMessage1.c = 219;
  [message addRepeatedForeignMessage:foreignMessage1];

  ImportMessage *importMessage1 = [[ImportMessage alloc] init];
  importMessage1.d = 220;
  [message addRepeatedImportMessage:importMessage1];

  [message addRepeatedNestedEnum:TestAllTypes_NestedEnumBar];
  [message addRepeatedForeignEnum:ForeignEnumForeignBar];
  [message addRepeatedImportEnum:ImportEnumImportBar];

  [message addRepeatedStringPiece:@"224"];
  [message addRepeatedCord:@"225"];

  // Add a second one of each field.
  [message addRepeatedInt32:301];
  [message addRepeatedInt64:302];
  [message addRepeatedUint32:303];
  [message addRepeatedUint64:304];
  [message addRepeatedSint32:305];
  [message addRepeatedSint64:306];
  [message addRepeatedFixed32:307];
  [message addRepeatedFixed64:308];
  [message addRepeatedSfixed32:309];
  [message addRepeatedSfixed64:310];
  [message addRepeatedFloat:311];
  [message addRepeatedDouble:312];
  [message addRepeatedBool:NO];
  [message addRepeatedString:@"315"];
  [message addRepeatedBytes:[self getData:@"316"]];

  TestAllTypes_RepeatedGroup *testAllTypesRepeatedGroup = [[TestAllTypes_RepeatedGroup alloc] init];
  testAllTypesRepeatedGroup.a = 317;
  [message addRepeatedGroup:testAllTypesRepeatedGroup];

  TestAllTypes_NestedMessage *testAllTypesNestedMessage = [[TestAllTypes_NestedMessage alloc] init];
  testAllTypesNestedMessage.bb = 318;
  [message addRepeatedNestedMessage:testAllTypesNestedMessage];

  ForeignMessage *foreignMessage = [[ForeignMessage alloc] init];
  foreignMessage.c = 319;
  [message addRepeatedForeignMessage:foreignMessage];

  ImportMessage *importMessage = [[ImportMessage alloc] init];
  importMessage.d = 320;
  [message addRepeatedImportMessage:importMessage];

  [message addRepeatedNestedEnum:TestAllTypes_NestedEnumBaz];
  [message addRepeatedForeignEnum:ForeignEnumForeignBaz];
  [message addRepeatedImportEnum:ImportEnumImportBaz];

  [message addRepeatedStringPiece:@"324"];
  [message addRepeatedCord:@"325"];

  // -----------------------------------------------------------------

  message.defaultInt32 = 401;
  message.defaultInt64 = 402;
  message.defaultUint32 = 403;
  message.defaultUint64 = 404;
  message.defaultSint32 = 405;
  message.defaultSint64 = 406;
  message.defaultFixed32 = 407;
  message.defaultFixed64 = 408;
  message.defaultSfixed32 = 409;
  message.defaultSfixed64 = 410;
  message.defaultFloat = 411;
  message.defaultDouble = 412;
  message.defaultBool = NO;
  message.defaultString = @"415";
  message.defaultBytes = [self getData:@"416"];

  message.defaultNestedEnum = TestAllTypes_NestedEnumFoo;
  message.defaultForeignEnum = ForeignEnumForeignFoo;
  message.defaultImportEnum = ImportEnumImportFoo;

  message.defaultStringPiece = @"424";
  message.defaultCord = @"425";
}

/**
* Set every field of {@code message} to the values expected by
* {@code assertAllExtensionsSet()}.
*/
+ (void)setAllExtensions:(TestAllExtensions *)message
{
  [message setExtension:[UnittestRoot optionalInt32Extension] value:@101];
  [message setExtension:[UnittestRoot optionalInt64Extension] value:@102L];
  [message setExtension:[UnittestRoot optionalUint32Extension] value:@103];
  [message setExtension:[UnittestRoot optionalUint64Extension] value:@104L];
  [message setExtension:[UnittestRoot optionalSint32Extension] value:@105];
  [message setExtension:[UnittestRoot optionalSint64Extension] value:@106L];
  [message setExtension:[UnittestRoot optionalFixed32Extension] value:@107];
  [message setExtension:[UnittestRoot optionalFixed64Extension] value:@108L];
  [message setExtension:[UnittestRoot optionalSfixed32Extension] value:@109];
  [message setExtension:[UnittestRoot optionalSfixed64Extension] value:@110L];
  [message setExtension:[UnittestRoot optionalFloatExtension] value:@111.0F];
  [message setExtension:[UnittestRoot optionalDoubleExtension] value:@112.0];
  [message setExtension:[UnittestRoot optionalBoolExtension] value:@YES];
  [message setExtension:[UnittestRoot optionalStringExtension] value:@"115"];
  [message setExtension:[UnittestRoot optionalBytesExtension] value:[self getData:@"116"]];

  OptionalGroup_extension *optionalGroupExtension = [[OptionalGroup_extension alloc] init];
  optionalGroupExtension.a = 117;
  [message setExtension:[UnittestRoot optionalGroupExtension] value:optionalGroupExtension];

  TestAllTypes_NestedMessage *testAllTypesNestedMessage = [[TestAllTypes_NestedMessage alloc] init];
  testAllTypesNestedMessage.bb = 118;
  [message setExtension:[UnittestRoot optionalNestedMessageExtension] value:testAllTypesNestedMessage];

  ForeignMessage *foreignMessage = [[ForeignMessage alloc] init];
  foreignMessage.c = 119;
  [message setExtension:[UnittestRoot optionalForeignMessageExtension] value:foreignMessage];

  ImportMessage *importMessage = [[ImportMessage alloc] init];
  importMessage.d = 120;
  [message setExtension:[UnittestRoot optionalImportMessageExtension] value:importMessage];

  [message setExtension:[UnittestRoot optionalNestedEnumExtension] value:@(TestAllTypes_NestedEnumBaz)];
  [message setExtension:[UnittestRoot optionalForeignEnumExtension] value:@(ForeignEnumForeignBaz)];
  [message setExtension:[UnittestRoot optionalImportEnumExtension] value:@(ImportEnumImportBaz)];

  [message setExtension:[UnittestRoot optionalStringPieceExtension] value:@"124"];
  [message setExtension:[UnittestRoot optionalCordExtension] value:@"125"];

  // -----------------------------------------------------------------

  [message addExtension:[UnittestRoot repeatedInt32Extension] value:@201];
  [message addExtension:[UnittestRoot repeatedInt64Extension] value:@202L];
  [message addExtension:[UnittestRoot repeatedUint32Extension] value:@203];
  [message addExtension:[UnittestRoot repeatedUint64Extension] value:@204L];
  [message addExtension:[UnittestRoot repeatedSint32Extension] value:@205];
  [message addExtension:[UnittestRoot repeatedSint64Extension] value:@206L];
  [message addExtension:[UnittestRoot repeatedFixed32Extension] value:@207];
  [message addExtension:[UnittestRoot repeatedFixed64Extension] value:@208L];
  [message addExtension:[UnittestRoot repeatedSfixed32Extension] value:@209];
  [message addExtension:[UnittestRoot repeatedSfixed64Extension] value:@210L];
  [message addExtension:[UnittestRoot repeatedFloatExtension] value:@211.0F];
  [message addExtension:[UnittestRoot repeatedDoubleExtension] value:@212.0];
  [message addExtension:[UnittestRoot repeatedBoolExtension] value:@YES];
  [message addExtension:[UnittestRoot repeatedStringExtension] value:@"215"];
  [message addExtension:[UnittestRoot repeatedBytesExtension] value:[self getData:@"216"]];

  RepeatedGroup_extension *repeatedGroupExtension = [[RepeatedGroup_extension alloc] init];
  repeatedGroupExtension.a = 217;
  [message addExtension:[UnittestRoot repeatedGroupExtension] value:repeatedGroupExtension];

  TestAllTypes_NestedMessage *testAllTypesNestedMessage1 = [[TestAllTypes_NestedMessage alloc] init];
  testAllTypesNestedMessage1.bb = 218;
  [message addExtension:[UnittestRoot repeatedNestedMessageExtension] value:testAllTypesNestedMessage1];

  ForeignMessage *foreignMessage1 = [[ForeignMessage alloc] init];
  foreignMessage1.c = 219;
  [message addExtension:[UnittestRoot repeatedForeignMessageExtension] value:foreignMessage1];

  ImportMessage *importMessage1 = [[ImportMessage alloc] init];
  importMessage1.d = 220;
  [message addExtension:[UnittestRoot repeatedImportMessageExtension] value:importMessage1];

  [message addExtension:[UnittestRoot repeatedNestedEnumExtension] value:@(TestAllTypes_NestedEnumBar)];
  [message addExtension:[UnittestRoot repeatedForeignEnumExtension] value:@(ForeignEnumForeignBar)];
  [message addExtension:[UnittestRoot repeatedImportEnumExtension] value:@(ImportEnumImportBar)];

  [message addExtension:[UnittestRoot repeatedStringPieceExtension] value:@"224"];
  [message addExtension:[UnittestRoot repeatedCordExtension] value:@"225"];

  // Add a second one of each field.
  [message addExtension:[UnittestRoot repeatedInt32Extension] value:@301];
  [message addExtension:[UnittestRoot repeatedInt64Extension] value:@302L];
  [message addExtension:[UnittestRoot repeatedUint32Extension] value:@303];
  [message addExtension:[UnittestRoot repeatedUint64Extension] value:@304L];
  [message addExtension:[UnittestRoot repeatedSint32Extension] value:@305];
  [message addExtension:[UnittestRoot repeatedSint64Extension] value:@306L];
  [message addExtension:[UnittestRoot repeatedFixed32Extension] value:@307];
  [message addExtension:[UnittestRoot repeatedFixed64Extension] value:@308L];
  [message addExtension:[UnittestRoot repeatedSfixed32Extension] value:@309];
  [message addExtension:[UnittestRoot repeatedSfixed64Extension] value:@310L];
  [message addExtension:[UnittestRoot repeatedFloatExtension] value:@311.0F];
  [message addExtension:[UnittestRoot repeatedDoubleExtension] value:@312.0];
  [message addExtension:[UnittestRoot repeatedBoolExtension] value:@NO];
  [message addExtension:[UnittestRoot repeatedStringExtension] value:@"315"];
  [message addExtension:[UnittestRoot repeatedBytesExtension] value:[self getData:@"316"]];

  RepeatedGroup_extension *repeatedGroupExtension1 = [[RepeatedGroup_extension alloc] init];
  repeatedGroupExtension1.a = 317;
  [message addExtension:[UnittestRoot repeatedGroupExtension] value:repeatedGroupExtension1];

  TestAllTypes_NestedMessage *testAllTypesNestedMessage2 = [[TestAllTypes_NestedMessage alloc] init];
  testAllTypesNestedMessage2.bb = 318;
  [message addExtension:[UnittestRoot repeatedNestedMessageExtension] value:testAllTypesNestedMessage2];

  ForeignMessage *foreignMessage2 = [[ForeignMessage alloc] init];
  foreignMessage2.c = 319;
  [message addExtension:[UnittestRoot repeatedForeignMessageExtension] value:foreignMessage2];

  ImportMessage *importMessage2 = [[ImportMessage alloc] init];
  importMessage2.d = 320;
  [message addExtension:[UnittestRoot repeatedImportMessageExtension] value:importMessage2];

  [message addExtension:[UnittestRoot repeatedNestedEnumExtension] value:@(TestAllTypes_NestedEnumBaz)];
  [message addExtension:[UnittestRoot repeatedForeignEnumExtension] value:@(ForeignEnumForeignBaz)];
  [message addExtension:[UnittestRoot repeatedImportEnumExtension] value:@(ImportEnumImportBaz)];

  [message addExtension:[UnittestRoot repeatedStringPieceExtension] value:@"324"];
  [message addExtension:[UnittestRoot repeatedCordExtension] value:@"325"];

  // -----------------------------------------------------------------

  [message setExtension:[UnittestRoot defaultInt32Extension] value:@401];
  [message setExtension:[UnittestRoot defaultInt64Extension] value:@402L];
  [message setExtension:[UnittestRoot defaultUint32Extension] value:@403];
  [message setExtension:[UnittestRoot defaultUint64Extension] value:@404L];
  [message setExtension:[UnittestRoot defaultSint32Extension] value:@405];
  [message setExtension:[UnittestRoot defaultSint64Extension] value:@406L];
  [message setExtension:[UnittestRoot defaultFixed32Extension] value:@407];
  [message setExtension:[UnittestRoot defaultFixed64Extension] value:@408L];
  [message setExtension:[UnittestRoot defaultSfixed32Extension] value:@409];
  [message setExtension:[UnittestRoot defaultSfixed64Extension] value:@410L];
  [message setExtension:[UnittestRoot defaultFloatExtension] value:@411.0F];
  [message setExtension:[UnittestRoot defaultDoubleExtension] value:@412.0];
  [message setExtension:[UnittestRoot defaultBoolExtension] value:@NO];
  [message setExtension:[UnittestRoot defaultStringExtension] value:@"415"];
  [message setExtension:[UnittestRoot defaultBytesExtension] value:[self getData:@"416"]];

  [message setExtension:[UnittestRoot defaultNestedEnumExtension] value:@(TestAllTypes_NestedEnumFoo)];
  [message setExtension:[UnittestRoot defaultForeignEnumExtension] value:@(ForeignEnumForeignFoo)];
  [message setExtension:[UnittestRoot defaultImportEnumExtension] value:@(ImportEnumImportFoo)];

  [message setExtension:[UnittestRoot defaultStringPieceExtension] value:@"424"];
  [message setExtension:[UnittestRoot defaultCordExtension] value:@"425"];
}

/**
* Register all of {@code TestAllExtensions}' extensions with the
* given {@link ExtensionRegistry}.
*/
+ (void)registerAllExtensions:(PBMutableExtensionRegistry *)registry
{
  [UnittestRoot registerAllExtensions:registry];
  /*
  [registry addExtension:[UnittestRoot optionalInt32Extension]];
  [registry addExtension:[UnittestRoot optionalInt64Extension]];
  [registry addExtension:[UnittestRoot optionalUint32Extension]];
  [registry addExtension:[UnittestRoot optionalUint64Extension]];
  [registry addExtension:[UnittestRoot optionalSint32Extension]];
  [registry addExtension:[UnittestRoot optionalSint64Extension]];
  [registry addExtension:[UnittestRoot optionalFixed32Extension]];
  [registry addExtension:[UnittestRoot optionalFixed64Extension]];
  [registry addExtension:[UnittestRoot optionalSfixed32Extension]];
  [registry addExtension:[UnittestRoot optionalSfixed64Extension]];
  [registry addExtension:[UnittestRoot optionalFloatExtension]];
  [registry addExtension:[UnittestRoot optionalDoubleExtension]];
  [registry addExtension:[UnittestRoot optionalBoolExtension]];
  [registry addExtension:[UnittestRoot optionalStringExtension]];
  [registry addExtension:[UnittestRoot optionalBytesExtension]];
  [registry addExtension:[UnittestRoot optionalGroupExtension]];
  [registry addExtension:[UnittestRoot optionalNestedMessageExtension]];
  [registry addExtension:[UnittestRoot optionalForeignMessageExtension]];
  [registry addExtension:[UnittestRoot optionalImportMessageExtension]];
  [registry addExtension:[UnittestRoot optionalNestedEnumExtension]];
  [registry addExtension:[UnittestRoot optionalForeignEnumExtension]];
  [registry addExtension:[UnittestRoot optionalImportEnumExtension]];
  [registry addExtension:[UnittestRoot optionalStringPieceExtension]];
  [registry addExtension:[UnittestRoot optionalCordExtension]];

  [registry addExtension:[UnittestRoot repeatedInt32Extension]];
  [registry addExtension:[UnittestRoot repeatedInt64Extension]];
  [registry addExtension:[UnittestRoot repeatedUint32Extension]];
  [registry addExtension:[UnittestRoot repeatedUint64Extension]];
  [registry addExtension:[UnittestRoot repeatedSint32Extension]];
  [registry addExtension:[UnittestRoot repeatedSint64Extension]];
  [registry addExtension:[UnittestRoot repeatedFixed32Extension]];
  [registry addExtension:[UnittestRoot repeatedFixed64Extension]];
  [registry addExtension:[UnittestRoot repeatedSfixed32Extension]];
  [registry addExtension:[UnittestRoot repeatedSfixed64Extension]];
  [registry addExtension:[UnittestRoot repeatedFloatExtension]];
  [registry addExtension:[UnittestRoot repeatedDoubleExtension]];
  [registry addExtension:[UnittestRoot repeatedBoolExtension]];
  [registry addExtension:[UnittestRoot repeatedStringExtension]];
  [registry addExtension:[UnittestRoot repeatedBytesExtension]];
  [registry addExtension:[UnittestRoot repeatedGroupExtension]];
  [registry addExtension:[UnittestRoot repeatedNestedMessageExtension]];
  [registry addExtension:[UnittestRoot repeatedForeignMessageExtension]];
  [registry addExtension:[UnittestRoot repeatedImportMessageExtension]];
  [registry addExtension:[UnittestRoot repeatedNestedEnumExtension]];
  [registry addExtension:[UnittestRoot repeatedForeignEnumExtension]];
  [registry addExtension:[UnittestRoot repeatedImportEnumExtension]];
  [registry addExtension:[UnittestRoot repeatedStringPieceExtension]];
  [registry addExtension:[UnittestRoot repeatedCordExtension]];

  [registry addExtension:[UnittestRoot defaultInt32Extension]];
  [registry addExtension:[UnittestRoot defaultInt64Extension]];
  [registry addExtension:[UnittestRoot defaultUint32Extension]];
  [registry addExtension:[UnittestRoot defaultUint64Extension]];
  [registry addExtension:[UnittestRoot defaultSint32Extension]];
  [registry addExtension:[UnittestRoot defaultSint64Extension]];
  [registry addExtension:[UnittestRoot defaultFixed32Extension]];
  [registry addExtension:[UnittestRoot defaultFixed64Extension]];
  [registry addExtension:[UnittestRoot defaultSfixed32Extension]];
  [registry addExtension:[UnittestRoot defaultSfixed64Extension]];
  [registry addExtension:[UnittestRoot defaultFloatExtension]];
  [registry addExtension:[UnittestRoot defaultDoubleExtension]];
  [registry addExtension:[UnittestRoot defaultBoolExtension]];
  [registry addExtension:[UnittestRoot defaultStringExtension]];
  [registry addExtension:[UnittestRoot defaultBytesExtension]];
  [registry addExtension:[UnittestRoot defaultNestedEnumExtension]];
  [registry addExtension:[UnittestRoot defaultForeignEnumExtension]];
  [registry addExtension:[UnittestRoot defaultImportEnumExtension]];
  [registry addExtension:[UnittestRoot defaultStringPieceExtension]];
  [registry addExtension:[UnittestRoot defaultCordExtension]];
  */
}

/**
* Get an unmodifiable {@link ExtensionRegistry} containing all the
* extensions of {@code TestAllExtensions}.
*/
+ (PBExtensionRegistry *)extensionRegistry
{
  PBMutableExtensionRegistry *registry = [PBMutableExtensionRegistry registry];
  [self registerAllExtensions:registry];
  return registry;
}

+ (TestAllTypes *)allSet
{
  TestAllTypes *message = [[TestAllTypes alloc] init];
  [self setAllFields:message];
  return message;
}

+ (TestAllExtensions *)allExtensionsSet
{
  TestAllExtensions *message = [[TestAllExtensions alloc] init];
  [self setAllExtensions:message];
  return message;
}

+ (TestPackedTypes *)packedSet
{
  TestPackedTypes *message = [[TestPackedTypes alloc] init];
  [self setPackedFields:message];
  return message;
}

+ (TestPackedExtensions *)packedExtensionsSet
{
  TestPackedExtensions *message = [[TestPackedExtensions alloc] init];
  [self setPackedExtensions:message];
  return message;
}

// -------------------------------------------------------------------

/**
* Assert (using {@code junit.framework.Assert}} that all fields of
* {@code message} are cleared, and that getting the fields returns their
* default values.
*/
- (void)assertClear:(TestAllTypes *)message
{
  // hasBlah() should initially be NO for all optional fields.
  STAssertFalse(message.hasOptionalInt32, @"");
  STAssertFalse(message.hasOptionalInt64, @"");
  STAssertFalse(message.hasOptionalUint32, @"");
  STAssertFalse(message.hasOptionalUint64, @"");
  STAssertFalse(message.hasOptionalSint32, @"");
  STAssertFalse(message.hasOptionalSint64, @"");
  STAssertFalse(message.hasOptionalFixed32, @"");
  STAssertFalse(message.hasOptionalFixed64, @"");
  STAssertFalse(message.hasOptionalSfixed32, @"");
  STAssertFalse(message.hasOptionalSfixed64, @"");
  STAssertFalse(message.hasOptionalFloat, @"");
  STAssertFalse(message.hasOptionalDouble, @"");
  STAssertFalse(message.hasOptionalBool, @"");
  STAssertFalse(message.hasOptionalString, @"");
  STAssertFalse(message.hasOptionalBytes, @"");

  STAssertFalse(message.hasOptionalGroup, @"");
  STAssertFalse(message.hasOptionalNestedMessage, @"");
  STAssertFalse(message.hasOptionalForeignMessage, @"");
  STAssertFalse(message.hasOptionalImportMessage, @"");

  STAssertFalse(message.hasOptionalNestedEnum, @"");
  STAssertFalse(message.hasOptionalForeignEnum, @"");
  STAssertFalse(message.hasOptionalImportEnum, @"");

  STAssertFalse(message.hasOptionalStringPiece, @"");
  STAssertFalse(message.hasOptionalCord, @"");

  // Optional fields without defaults are set to zero or something like it.
  STAssertTrue(0 == message.optionalInt32, @"");
  STAssertTrue(0 == message.optionalInt64, @"");
  STAssertTrue(0 == message.optionalUint32, @"");
  STAssertTrue(0 == message.optionalUint64, @"");
  STAssertTrue(0 == message.optionalSint32, @"");
  STAssertTrue(0 == message.optionalSint64, @"");
  STAssertTrue(0 == message.optionalFixed32, @"");
  STAssertTrue(0 == message.optionalFixed64, @"");
  STAssertTrue(0 == message.optionalSfixed32, @"");
  STAssertTrue(0 == message.optionalSfixed64, @"");
  STAssertTrue(0 == message.optionalFloat, @"");
  STAssertTrue(0 == message.optionalDouble, @"");
  STAssertTrue(NO == message.optionalBool, @"");
  STAssertEqualObjects(@"", message.optionalString, @"");
  STAssertEqualObjects([NSData data], message.optionalBytes, @"");

  // Embedded messages should also be clear.
  STAssertFalse(message.optionalGroup.hasA, @"");
  STAssertFalse(message.optionalNestedMessage.hasBb, @"");
  STAssertFalse(message.optionalForeignMessage.hasC, @"");
  STAssertFalse(message.optionalImportMessage.hasD, @"");

  STAssertTrue(0 == message.optionalGroup.a, @"");
  STAssertTrue(0 == message.optionalNestedMessage.bb, @"");
  STAssertTrue(0 == message.optionalForeignMessage.c, @"");
  STAssertTrue(0 == message.optionalImportMessage.d, @"");

  // Enums without defaults are set to the first value in the enum.
  STAssertTrue(TestAllTypes_NestedEnumFoo == message.optionalNestedEnum, @"");
  STAssertTrue(ForeignEnumForeignFoo == message.optionalForeignEnum, @"");
  STAssertTrue(ImportEnumImportFoo == message.optionalImportEnum, @"");

  STAssertEqualObjects(@"", message.optionalStringPiece, @"");
  STAssertEqualObjects(@"", message.optionalCord, @"");

  // Repeated fields are empty.
  STAssertTrue(0 == message.repeatedInt32.count, @"");
  STAssertTrue(0 == message.repeatedInt64.count, @"");
  STAssertTrue(0 == message.repeatedUint32.count, @"");
  STAssertTrue(0 == message.repeatedUint64.count, @"");
  STAssertTrue(0 == message.repeatedSint32.count, @"");
  STAssertTrue(0 == message.repeatedSint64.count, @"");
  STAssertTrue(0 == message.repeatedFixed32.count, @"");
  STAssertTrue(0 == message.repeatedFixed64.count, @"");
  STAssertTrue(0 == message.repeatedSfixed32.count, @"");
  STAssertTrue(0 == message.repeatedSfixed64.count, @"");
  STAssertTrue(0 == message.repeatedFloat.count, @"");
  STAssertTrue(0 == message.repeatedDouble.count, @"");
  STAssertTrue(0 == message.repeatedBool.count, @"");
  STAssertTrue(0 == message.repeatedString.count, @"");
  STAssertTrue(0 == message.repeatedBytes.count, @"");

  STAssertTrue(0 == message.repeatedGroup.count, @"");
  STAssertTrue(0 == message.repeatedNestedMessage.count, @"");
  STAssertTrue(0 == message.repeatedForeignMessage.count, @"");
  STAssertTrue(0 == message.repeatedImportMessage.count, @"");
  STAssertTrue(0 == message.repeatedNestedEnum.count, @"");
  STAssertTrue(0 == message.repeatedForeignEnum.count, @"");
  STAssertTrue(0 == message.repeatedImportEnum.count, @"");

  STAssertTrue(0 == message.repeatedStringPiece.count, @"");
  STAssertTrue(0 == message.repeatedCord.count, @"");

  // hasBlah() should also be NO for all default fields.
  STAssertFalse(message.hasDefaultInt32, @"");
  STAssertFalse(message.hasDefaultInt64, @"");
  STAssertFalse(message.hasDefaultUint32, @"");
  STAssertFalse(message.hasDefaultUint64, @"");
  STAssertFalse(message.hasDefaultSint32, @"");
  STAssertFalse(message.hasDefaultSint64, @"");
  STAssertFalse(message.hasDefaultFixed32, @"");
  STAssertFalse(message.hasDefaultFixed64, @"");
  STAssertFalse(message.hasDefaultSfixed32, @"");
  STAssertFalse(message.hasDefaultSfixed64, @"");
  STAssertFalse(message.hasDefaultFloat, @"");
  STAssertFalse(message.hasDefaultDouble, @"");
  STAssertFalse(message.hasDefaultBool, @"");
  STAssertFalse(message.hasDefaultString, @"");
  STAssertFalse(message.hasDefaultBytes, @"");

  STAssertFalse(message.hasDefaultNestedEnum, @"");
  STAssertFalse(message.hasDefaultForeignEnum, @"");
  STAssertFalse(message.hasDefaultImportEnum, @"");

  STAssertFalse(message.hasDefaultStringPiece, @"");
  STAssertFalse(message.hasDefaultCord, @"");

  // Fields with defaults have their default values (duh).
  STAssertTrue(41 == message.defaultInt32, @"");
  STAssertTrue(42 == message.defaultInt64, @"");
  STAssertTrue(43 == message.defaultUint32, @"");
  STAssertTrue(44 == message.defaultUint64, @"");
  STAssertTrue(-45 == message.defaultSint32, @"");
  STAssertTrue(46 == message.defaultSint64, @"");
  STAssertTrue(47 == message.defaultFixed32, @"");
  STAssertTrue(48 == message.defaultFixed64, @"");
  STAssertTrue(49 == message.defaultSfixed32, @"");
  STAssertTrue(-50 == message.defaultSfixed64, @"");
  STAssertEqualsWithAccuracy(51.5, message.defaultFloat, 0.1, @"");
  STAssertEqualsWithAccuracy(52e3, message.defaultDouble, 0.1, @"");
  STAssertTrue(YES == message.defaultBool, @"");
  STAssertEqualObjects(@"hello", message.defaultString, @"");
  STAssertEqualObjects([TestUtilities getData:@"world"], message.defaultBytes, @"");

  STAssertTrue(TestAllTypes_NestedEnumBar == message.defaultNestedEnum, @"");
  STAssertTrue(ForeignEnumForeignBar == message.defaultForeignEnum, @"");
  STAssertTrue(ImportEnumImportBar == message.defaultImportEnum, @"");

  STAssertEqualObjects(@"abc", message.defaultStringPiece, @"");
  STAssertEqualObjects(@"123", message.defaultCord, @"");
}

+ (void)assertClear:(TestAllTypes *)message
{
  return [[[TestUtilities alloc] init] assertClear:message];
}

- (void)assertExtensionsClear:(TestAllExtensions *)message
{
  // hasBlah() should initially be NO for all optional fields.
  STAssertFalse([message hasExtension:[UnittestRoot optionalInt32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalInt64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalUint32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalUint64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalSint32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalSint64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalFixed32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalFixed64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalSfixed32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalSfixed64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalFloatExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalDoubleExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalBoolExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalStringExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalBytesExtension]], @"");

  STAssertFalse([message hasExtension:[UnittestRoot optionalGroupExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalNestedMessageExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalForeignMessageExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalImportMessageExtension]], @"");

  STAssertFalse([message hasExtension:[UnittestRoot optionalNestedEnumExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalForeignEnumExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalImportEnumExtension]], @"");

  STAssertFalse([message hasExtension:[UnittestRoot optionalStringPieceExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot optionalCordExtension]], @"");

  // Optional fields without defaults are set to zero or something like it.
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalInt32Extension]] intValue], @"");
  STAssertTrue(0L == [[message getExtension:[UnittestRoot optionalInt64Extension]] intValue], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalUint32Extension]] intValue], @"");
  STAssertTrue(0L == [[message getExtension:[UnittestRoot optionalUint64Extension]] intValue], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalSint32Extension]] intValue], @"");
  STAssertTrue(0L == [[message getExtension:[UnittestRoot optionalSint64Extension]] intValue], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalFixed32Extension]] intValue], @"");
  STAssertTrue(0L == [[message getExtension:[UnittestRoot optionalFixed64Extension]] intValue], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalSfixed32Extension]] intValue], @"");
  STAssertTrue(0L == [[message getExtension:[UnittestRoot optionalSfixed64Extension]] intValue], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalFloatExtension]] floatValue], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalDoubleExtension]] doubleValue], @"");
  STAssertTrue(NO == [[message getExtension:[UnittestRoot optionalBoolExtension]] boolValue], @"");
  STAssertEqualObjects(nil, [message getExtension:[UnittestRoot optionalStringExtension]], @"");
  STAssertEqualObjects(nil, [message getExtension:[UnittestRoot optionalBytesExtension]], @"");

  // Embedded messages should also be clear.

  STAssertFalse([[message getExtension:[UnittestRoot optionalGroupExtension]] hasA], @"");
  STAssertFalse([[message getExtension:[UnittestRoot optionalNestedMessageExtension]] hasBb], @"");
  STAssertFalse([[message getExtension:[UnittestRoot optionalForeignMessageExtension]] hasC], @"");
  STAssertFalse([[message getExtension:[UnittestRoot optionalImportMessageExtension]] hasD], @"");

  STAssertTrue(0 == [(OptionalGroup_extension *)[message getExtension:[UnittestRoot optionalGroupExtension]] a], @"");
  STAssertTrue(0 == [(TestAllTypes_NestedMessage *)[message getExtension:[UnittestRoot optionalNestedMessageExtension]] bb], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalForeignMessageExtension]] c], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot optionalImportMessageExtension]] d], @"");

  // Enums without defaults are set to the first value in the enum.
  STAssertTrue(TestAllTypes_NestedEnumFoo == [[message getExtension:[UnittestRoot optionalNestedEnumExtension]] intValue], @"");
  STAssertTrue(ForeignEnumForeignFoo == [[message getExtension:[UnittestRoot optionalForeignEnumExtension]] intValue], @"");
  STAssertTrue(ImportEnumImportFoo == [[message getExtension:[UnittestRoot optionalImportEnumExtension]] intValue], @"");

  STAssertEqualObjects(nil, [message getExtension:[UnittestRoot optionalStringPieceExtension]], @"");
  STAssertEqualObjects(nil, [message getExtension:[UnittestRoot optionalCordExtension]], @"");

  // Repeated fields are empty.
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedInt32Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedInt64Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedUint32Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedUint64Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedSint32Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedSint64Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedFixed32Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedFixed64Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedSfixed32Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedSfixed64Extension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedFloatExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedDoubleExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedBoolExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedStringExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedBytesExtension]] count], @"");

  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedGroupExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedNestedMessageExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedForeignMessageExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedImportMessageExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedNestedEnumExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedForeignEnumExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedImportEnumExtension]] count], @"");

  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedStringPieceExtension]] count], @"");
  STAssertTrue(0 == [[message getExtension:[UnittestRoot repeatedCordExtension]] count], @"");

  // hasBlah() should also be NO for all default fields.
  STAssertFalse([message hasExtension:[UnittestRoot defaultInt32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultInt64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultUint32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultUint64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultSint32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultSint64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultFixed32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultFixed64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultSfixed32Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultSfixed64Extension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultFloatExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultDoubleExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultBoolExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultStringExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultBytesExtension]], @"");

  STAssertFalse([message hasExtension:[UnittestRoot defaultNestedEnumExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultForeignEnumExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultImportEnumExtension]], @"");

  STAssertFalse([message hasExtension:[UnittestRoot defaultStringPieceExtension]], @"");
  STAssertFalse([message hasExtension:[UnittestRoot defaultCordExtension]], @"");

  // Fields with defaults have their default values (duh).
  STAssertTrue(41 == [[message getExtension:[UnittestRoot defaultInt32Extension]] intValue], @"");
  STAssertTrue(42L == [[message getExtension:[UnittestRoot defaultInt64Extension]] intValue], @"");
  STAssertTrue(43 == [[message getExtension:[UnittestRoot defaultUint32Extension]] intValue], @"");
  STAssertTrue(44L == [[message getExtension:[UnittestRoot defaultUint64Extension]] intValue], @"");
  STAssertTrue(-45 == [[message getExtension:[UnittestRoot defaultSint32Extension]] intValue], @"");
  STAssertTrue(46L == [[message getExtension:[UnittestRoot defaultSint64Extension]] intValue], @"");
  STAssertTrue(47 == [[message getExtension:[UnittestRoot defaultFixed32Extension]] intValue], @"");
  STAssertTrue(48L == [[message getExtension:[UnittestRoot defaultFixed64Extension]] intValue], @"");
  STAssertTrue(49 == [[message getExtension:[UnittestRoot defaultSfixed32Extension]] intValue], @"");
  STAssertTrue(-50L == [[message getExtension:[UnittestRoot defaultSfixed64Extension]] intValue], @"");
  STAssertTrue(51.5 == [[message getExtension:[UnittestRoot defaultFloatExtension]] floatValue], @"");
  STAssertTrue(52e3 == [[message getExtension:[UnittestRoot defaultDoubleExtension]] doubleValue], @"");
  STAssertTrue(YES == [[message getExtension:[UnittestRoot defaultBoolExtension]] boolValue], @"");
  STAssertEqualObjects(@"hello", [message getExtension:[UnittestRoot defaultStringExtension]], @"");
  STAssertEqualObjects([TestUtilities getData:@"world"], [message getExtension:[UnittestRoot defaultBytesExtension]], @"");

  STAssertTrue(TestAllTypes_NestedEnumBar == [[message getExtension:[UnittestRoot defaultNestedEnumExtension]] intValue], @"");
  STAssertTrue(ForeignEnumForeignBar == [[message getExtension:[UnittestRoot defaultForeignEnumExtension]] intValue], @"");
  STAssertTrue(ImportEnumImportBar == [[message getExtension:[UnittestRoot defaultImportEnumExtension]] intValue], @"");

  STAssertEqualObjects(@"abc", [message getExtension:[UnittestRoot defaultStringPieceExtension]], @"");
  STAssertEqualObjects(@"123", [message getExtension:[UnittestRoot defaultCordExtension]], @"");
}

+ (void)assertExtensionsClear:(TestAllExtensions *)message
{
  [[[TestUtilities alloc] init] assertExtensionsClear:message];
}

+ (void)setPackedFields:(TestPackedTypes *)message
{
  [message addPackedInt32:601];
  [message addPackedInt64:602];
  [message addPackedUint32:603];
  [message addPackedUint64:604];
  [message addPackedSint32:605];
  [message addPackedSint64:606];
  [message addPackedFixed32:607];
  [message addPackedFixed64:608];
  [message addPackedSfixed32:609];
  [message addPackedSfixed64:610];
  [message addPackedFloat:611];
  [message addPackedDouble:612];
  [message addPackedBool:YES];
  [message addPackedEnum:ForeignEnumForeignBar];
  // Add a second one of each field.
  [message addPackedInt32:701];
  [message addPackedInt64:702];
  [message addPackedUint32:703];
  [message addPackedUint64:704];
  [message addPackedSint32:705];
  [message addPackedSint64:706];
  [message addPackedFixed32:707];
  [message addPackedFixed64:708];
  [message addPackedSfixed32:709];
  [message addPackedSfixed64:710];
  [message addPackedFloat:711];
  [message addPackedDouble:712];
  [message addPackedBool:NO];
  [message addPackedEnum:ForeignEnumForeignBaz];
}

- (void)assertPackedFieldsSet:(TestPackedTypes *)message
{
  STAssertTrue(2 == message.packedInt32.count, @"");
  STAssertTrue(2 == message.packedInt64.count, @"");
  STAssertTrue(2 == message.packedUint32.count, @"");
  STAssertTrue(2 == message.packedUint64.count, @"");
  STAssertTrue(2 == message.packedSint32.count, @"");
  STAssertTrue(2 == message.packedSint64.count, @"");
  STAssertTrue(2 == message.packedFixed32.count, @"");
  STAssertTrue(2 == message.packedFixed64.count, @"");
  STAssertTrue(2 == message.packedSfixed32.count, @"");
  STAssertTrue(2 == message.packedSfixed64.count, @"");
  STAssertTrue(2 == message.packedFloat.count, @"");
  STAssertTrue(2 == message.packedDouble.count, @"");
  STAssertTrue(2 == message.packedBool.count, @"");
  STAssertTrue(2 == message.packedEnum.count, @"");
  STAssertTrue(601 == [message packedInt32AtIndex:0], @"");
  STAssertTrue(602 == [message packedInt64AtIndex:0], @"");
  STAssertTrue(603 == [message packedUint32AtIndex:0], @"");
  STAssertTrue(604 == [message packedUint64AtIndex:0], @"");
  STAssertTrue(605 == [message packedSint32AtIndex:0], @"");
  STAssertTrue(606 == [message packedSint64AtIndex:0], @"");
  STAssertTrue(607 == [message packedFixed32AtIndex:0], @"");
  STAssertTrue(608 == [message packedFixed64AtIndex:0], @"");
  STAssertTrue(609 == [message packedSfixed32AtIndex:0], @"");
  STAssertTrue(610 == [message packedSfixed64AtIndex:0], @"");
  STAssertTrue(611 == [message packedFloatAtIndex:0], @"");
  STAssertTrue(612 == [message packedDoubleAtIndex:0], @"");
  STAssertTrue(YES == [message packedBoolAtIndex:0], @"");
  STAssertTrue(ForeignEnumForeignBar == [message packedEnumAtIndex:0], @"");
  STAssertTrue(701 == [message packedInt32AtIndex:1], @"");
  STAssertTrue(702 == [message packedInt64AtIndex:1], @"");
  STAssertTrue(703 == [message packedUint32AtIndex:1], @"");
  STAssertTrue(704 == [message packedUint64AtIndex:1], @"");
  STAssertTrue(705 == [message packedSint32AtIndex:1], @"");
  STAssertTrue(706 == [message packedSint64AtIndex:1], @"");
  STAssertTrue(707 == [message packedFixed32AtIndex:1], @"");
  STAssertTrue(708 == [message packedFixed64AtIndex:1], @"");
  STAssertTrue(709 == [message packedSfixed32AtIndex:1], @"");
  STAssertTrue(710 == [message packedSfixed64AtIndex:1], @"");
  STAssertTrue(711 == [message packedFloatAtIndex:1], @"");
  STAssertTrue(712 == [message packedDoubleAtIndex:1], @"");
  STAssertTrue(NO == [message packedBoolAtIndex:1], @"");
  STAssertTrue(ForeignEnumForeignBaz == [message packedEnumAtIndex:1], @"");
}

+ (void)assertPackedFieldsSet:(TestPackedTypes *)message
{
  [[[TestUtilities alloc] init] assertPackedFieldsSet:message];
}

+ (void)setPackedExtensions:(TestPackedExtensions *)message
{
  [message addExtension:[UnittestRoot packedInt32Extension] value:@601];
  [message addExtension:[UnittestRoot packedInt64Extension] value:@602L];
  [message addExtension:[UnittestRoot packedUint32Extension] value:@603];
  [message addExtension:[UnittestRoot packedUint64Extension] value:@604L];
  [message addExtension:[UnittestRoot packedSint32Extension] value:@605];
  [message addExtension:[UnittestRoot packedSint64Extension] value:@606L];
  [message addExtension:[UnittestRoot packedFixed32Extension] value:@607];
  [message addExtension:[UnittestRoot packedFixed64Extension] value:@608L];
  [message addExtension:[UnittestRoot packedSfixed32Extension] value:@609];
  [message addExtension:[UnittestRoot packedSfixed64Extension] value:@610L];
  [message addExtension:[UnittestRoot packedFloatExtension] value:@611.0F];
  [message addExtension:[UnittestRoot packedDoubleExtension] value:@612.0];
  [message addExtension:[UnittestRoot packedBoolExtension] value:@YES];
  [message addExtension:[UnittestRoot packedEnumExtension] value:@(ForeignEnumForeignBar)];
  // Add a second one of each field.
  [message addExtension:[UnittestRoot packedInt32Extension] value:@701];
  [message addExtension:[UnittestRoot packedInt64Extension] value:@702L];
  [message addExtension:[UnittestRoot packedUint32Extension] value:@703];
  [message addExtension:[UnittestRoot packedUint64Extension] value:@704L];
  [message addExtension:[UnittestRoot packedSint32Extension] value:@705];
  [message addExtension:[UnittestRoot packedSint64Extension] value:@706L];
  [message addExtension:[UnittestRoot packedFixed32Extension] value:@707];
  [message addExtension:[UnittestRoot packedFixed64Extension] value:@708L];
  [message addExtension:[UnittestRoot packedSfixed32Extension] value:@709];
  [message addExtension:[UnittestRoot packedSfixed64Extension] value:@710L];
  [message addExtension:[UnittestRoot packedFloatExtension] value:@711.0F];
  [message addExtension:[UnittestRoot packedDoubleExtension] value:@712.0];
  [message addExtension:[UnittestRoot packedBoolExtension] value:@NO];
  [message addExtension:[UnittestRoot packedEnumExtension] value:@(ForeignEnumForeignBaz)];
}

- (void)assertPackedExtensionsSet:(TestPackedExtensions *)message
{
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedInt32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedInt64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedUint32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedUint64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedSint32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedSint64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedFixed32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedFixed64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedSfixed32Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedSfixed64Extension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedFloatExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedDoubleExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedBoolExtension]] count], @"");
  STAssertTrue(2 == [[message getExtension:[UnittestRoot packedEnumExtension]] count], @"");
  STAssertTrue(601 == [[[message getExtension:[UnittestRoot packedInt32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(602L == [[[message getExtension:[UnittestRoot packedInt64Extension]] objectAtIndex:0] longLongValue], @"");
  STAssertTrue(603 == [[[message getExtension:[UnittestRoot packedUint32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(604L == [[[message getExtension:[UnittestRoot packedUint64Extension]] objectAtIndex:0] longLongValue], @"");
  STAssertTrue(605 == [[[message getExtension:[UnittestRoot packedSint32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(606L == [[[message getExtension:[UnittestRoot packedSint64Extension]] objectAtIndex:0] longLongValue], @"");
  STAssertTrue(607 == [[[message getExtension:[UnittestRoot packedFixed32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(608L == [[[message getExtension:[UnittestRoot packedFixed64Extension]] objectAtIndex:0] longLongValue], @"");
  STAssertTrue(609 == [[[message getExtension:[UnittestRoot packedSfixed32Extension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(610L == [[[message getExtension:[UnittestRoot packedSfixed64Extension]] objectAtIndex:0] longLongValue], @"");
  STAssertTrue(611.0F == [[[message getExtension:[UnittestRoot packedFloatExtension]] objectAtIndex:0] floatValue], @"");
  STAssertTrue(612.0 == [[[message getExtension:[UnittestRoot packedDoubleExtension]] objectAtIndex:0] doubleValue], @"");
  STAssertTrue(YES == [[[message getExtension:[UnittestRoot packedBoolExtension]] objectAtIndex:0] boolValue], @"");
  STAssertTrue(ForeignEnumForeignBar == [[[message getExtension:[UnittestRoot packedEnumExtension]] objectAtIndex:0] intValue], @"");
  STAssertTrue(701 == [[[message getExtension:[UnittestRoot packedInt32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(702L == [[[message getExtension:[UnittestRoot packedInt64Extension]] objectAtIndex:1] longLongValue], @"");
  STAssertTrue(703 == [[[message getExtension:[UnittestRoot packedUint32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(704L == [[[message getExtension:[UnittestRoot packedUint64Extension]] objectAtIndex:1] longLongValue], @"");
  STAssertTrue(705 == [[[message getExtension:[UnittestRoot packedSint32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(706L == [[[message getExtension:[UnittestRoot packedSint64Extension]] objectAtIndex:1] longLongValue], @"");
  STAssertTrue(707 == [[[message getExtension:[UnittestRoot packedFixed32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(708L == [[[message getExtension:[UnittestRoot packedFixed64Extension]] objectAtIndex:1] longLongValue], @"");
  STAssertTrue(709 == [[[message getExtension:[UnittestRoot packedSfixed32Extension]] objectAtIndex:1] intValue], @"");
  STAssertTrue(710L == [[[message getExtension:[UnittestRoot packedSfixed64Extension]] objectAtIndex:1] longLongValue], @"");
  STAssertTrue(711.0F == [[[message getExtension:[UnittestRoot packedFloatExtension]] objectAtIndex:1] floatValue], @"");
  STAssertTrue(712.0 == [[[message getExtension:[UnittestRoot packedDoubleExtension]] objectAtIndex:1] doubleValue], @"");
  STAssertTrue(NO == [[[message getExtension:[UnittestRoot packedBoolExtension]] objectAtIndex:1] boolValue], @"");
  STAssertTrue(ForeignEnumForeignBaz == [[[message getExtension:[UnittestRoot packedEnumExtension]] objectAtIndex:1] intValue], @"");
}

+ (void)assertPackedExtensionsSet:(TestPackedExtensions *)message
{
  [[[TestUtilities alloc] init] assertPackedExtensionsSet:message];
}

@end
