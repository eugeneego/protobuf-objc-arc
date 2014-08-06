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

#import "MessageTests.h"

#import "Unittest.pb.h"

@implementation MessageTests

- (TestAllTypes *)mergeSource
{
  TestAllTypes *message = [[TestAllTypes alloc] init];
  message.optionalInt32 = 1;
  message.optionalString = @"foo";
  message.optionalForeignMessage = nil;
  [message addRepeatedString:@"bar"];
  return message;
}

- (TestAllTypes *)mergeDestination
{
  TestAllTypes *message = [[TestAllTypes alloc] init];
  message.optionalInt64 = 2;
  message.optionalString = @"baz";
  message.optionalForeignMessage = [[ForeignMessage alloc] init];
  message.optionalForeignMessage.c = 3;
  [message addRepeatedString:@"qux"];
  return message;
}

- (TestAllTypes *)mergeResult
{
  TestAllTypes *message = [[TestAllTypes alloc] init];
  message.optionalInt32 = 1;
  message.optionalInt64 = 2;
  message.optionalString = @"foo";
  message.optionalForeignMessage = [[ForeignMessage alloc] init];
  message.optionalForeignMessage.c = 3;
  [message addRepeatedString:@"qux"];
  [message addRepeatedString:@"bar"];
  return message;
}

- (void)testMergeFrom
{
  TestAllTypes *result = [[[TestAllTypes builderWithPrototype:self.mergeDestination] mergeFrom:self.mergeSource] build];

  STAssertEqualObjects(result.data, self.mergeResult.data, @"");
}

// =================================================================
// Required-field-related tests.

- (TestRequired *)testRequiredUninitialized
{
  TestRequired *message = [[TestRequired alloc] init];
  return message;
}

- (TestRequired *)testRequiredInitialized
{
  TestRequired *message = [[TestRequired alloc] init];
  message.a = 1;
  message.b = 2;
  message.c = 3;
  return message;
}

- (void)testRequired
{
  TestRequired *message = [[TestRequired alloc] init];

  STAssertFalse(message.isInitialized, @"");
  message.a = 1;
  STAssertFalse(message.isInitialized, @"");
  message.b = 1;
  STAssertFalse(message.isInitialized, @"");
  message.c = 1;
  STAssertTrue(message.isInitialized, @"");
}

- (void)testRequiredForeign
{
  TestRequiredForeign *message = [[TestRequiredForeign alloc] init];

  STAssertTrue(message.isInitialized, @"");

  message.optionalMessage = self.testRequiredUninitialized;
  STAssertFalse(message.isInitialized, @"");

  message.optionalMessage = self.testRequiredInitialized;
  STAssertTrue(message.isInitialized, @"");

  [message addRepeatedMessage:self.testRequiredUninitialized];
  STAssertFalse(message.isInitialized, @"");
}

- (void)testRequiredExtension
{
  TestAllExtensions *message = [[TestAllExtensions alloc] init];

  STAssertTrue(message.isInitialized, @"");

  [message setExtension:[TestRequired single] value:self.testRequiredUninitialized];
  STAssertFalse(message.isInitialized, @"");

  [message setExtension:[TestRequired single] value:self.testRequiredInitialized];
  STAssertTrue(message.isInitialized, @"");

  [message addExtension:[TestRequired multi] value:self.testRequiredUninitialized];
  STAssertFalse(message.isInitialized, @"");

  [message setExtension:[TestRequired multi] index:0 value:self.testRequiredInitialized];
  STAssertTrue(message.isInitialized, @"");
}

- (void)testUninitializedException
{
  STAssertThrows([[TestRequired builder] build], @"");
}

- (void)testBuildPartial
{
  // We're mostly testing that no exception is thrown.
  TestRequired *message = [[TestRequired alloc] init];
  STAssertFalse(message.isInitialized, @"");
}

- (void)testNestedUninitializedException
{
  STAssertThrows([[[[[TestRequiredForeign builder]
    setOptionalMessage:self.testRequiredUninitialized]
    addRepeatedMessage:self.testRequiredUninitialized]
    addRepeatedMessage:self.testRequiredUninitialized]
    build], @"");
}

- (void)testBuildNestedPartial
{
  // We're mostly testing that no exception is thrown.

  TestRequiredForeign *message = [[TestRequiredForeign alloc] init];
  message.optionalMessage = self.testRequiredUninitialized;
  [message addRepeatedMessage:self.testRequiredUninitialized];
  [message addRepeatedMessage:self.testRequiredUninitialized];

  STAssertFalse(message.isInitialized, @"");
}

- (void)testParseUnititialized
{
  STAssertThrows([TestRequired parseFromData:[NSData data]], @"");
}

- (void)testParseNestedUnititialized
{
  TestRequiredForeign *message = [[TestRequiredForeign alloc] init];
  message.optionalMessage = self.testRequiredUninitialized;
  [message addRepeatedMessage:self.testRequiredUninitialized];
  [message addRepeatedMessage:self.testRequiredUninitialized];

  NSData *data = message.data;

  STAssertThrows([TestRequiredForeign parseFromData:data], @"");
}

@end
