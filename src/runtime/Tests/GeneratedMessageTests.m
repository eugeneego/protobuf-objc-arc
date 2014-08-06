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

#import "GeneratedMessageTests.h"

#import "TestUtilities.h"
#import "Unittest.pb.h"

@implementation GeneratedMessageTests

- (void)testAccessors
{
  TestAllTypes *message = [[TestAllTypes alloc] init];
  [TestUtilities setAllFields:message];
  [TestUtilities assertAllFieldsSet:message];
}

- (void)testRepeatedAppend
{
  TestAllTypes *message = [[TestAllTypes alloc] init];

  NSArray *array = @[ @1, @2, @3, @4 ];

  [message setRepeatedInt32Array:array];
  [message setRepeatedForeignEnumArray:@[ @(ForeignEnumForeignBaz) ]];

  ForeignMessage *foreignMessage = [[ForeignMessage alloc] init];
  foreignMessage.c = 12;
  [message setRepeatedForeignMessageArray:@[ foreignMessage ]];

  STAssertTrue(1 == message.repeatedForeignMessage.count, @"");
  STAssertTrue(12 == [[message repeatedForeignMessageAtIndex:0] c], @"");
}

- (void)testClearExtension
{
  // clearExtension() is not actually used in TestUtil, so try it manually.
  PBExtendableMessage *message1 = [[TestAllExtensions alloc] init];
  [message1 setExtension:[UnittestRoot optionalInt32Extension] value:@1];

  STAssertTrue([message1 hasExtension:[UnittestRoot optionalInt32Extension]], @"");
  [message1 clearExtension:[UnittestRoot optionalInt32Extension]];
  STAssertFalse([message1 hasExtension:[UnittestRoot optionalInt32Extension]], @"");

  PBExtendableMessage *message2 = [[TestAllExtensions alloc] init];
  [message2 addExtension:[UnittestRoot repeatedInt32Extension] value:@1];

  STAssertTrue(1 == [[message2 getExtension:[UnittestRoot repeatedInt32Extension]] count], @"");
  [message2 clearExtension:[UnittestRoot repeatedInt32Extension]];
  STAssertTrue(0 == [[message2 getExtension:[UnittestRoot repeatedInt32Extension]] count], @"");
}

- (void)testExtensionAccessors
{
  TestAllExtensions *message = [[TestAllExtensions alloc] init];
  [TestUtilities setAllExtensions:message];
  [TestUtilities assertAllExtensionsSet:message];
}

- (void)testExtensionRepeatedSetters
{
  TestAllExtensions *message = [[TestAllExtensions alloc] init];
  [TestUtilities setAllExtensions:message];
  [TestUtilities modifyRepeatedExtensions:message];
  [TestUtilities assertRepeatedExtensionsModified:message];
}

- (void)testExtensionDefaults
{
  [TestUtilities assertExtensionsClear:[[TestAllExtensions alloc] init]];
}

@end
