//
//  S4wdspLibTests.m
//  S4wdspLibTests
//
//  Created by Michael Papp on 8/29/25.
//

#import <XCTest/XCTest.h>

@interface S4wdspLibTests : XCTestCase

@end

#import "S4wdspLib_tests.h"

@implementation S4wdspLibTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL success;
	NSError *error = nil;

	NSString *filePath1 = @"/private/tmp/wdspWisdom00";
	NSString *filePath2 = @"/private/tmp/wdspWisdom";

	if ([fileManager fileExistsAtPath: filePath1])
	{
		NSLog(@"File exists at path: %@", filePath1);
		success = [fileManager removeItemAtPath: filePath1 error: &error];
		if (true == success)
		{
			NSLog(@"File %@ was removed", filePath1);
		}
		else
		{
			NSLog(@"File %@ was NOT removed", filePath1);
		}
	}
	else if ([fileManager fileExistsAtPath: filePath2])
	{
		NSLog(@"File exists at path: %@", filePath2);
		success = [fileManager removeItemAtPath: filePath2 error: &error];
		if (true == success)
		{
			NSLog(@"File %@ was removed", filePath2);
		}
		else
		{
			NSLog(@"File %@ was NOT removed", filePath2);
		}
	}
	else
	{
		NSLog(@"File does not exist at path: %@", @"/private/tmp");
	}
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testXCtest {
	XCTAssertEqual(false, 0);
}

- (void)test_wdsp_wisdom_generation {
	// wisdom file is removed in setup method; build a new wisdom file
	XCTAssertEqual(test_wisdom_generation(), 0);
	// now test re-using an existing (just built) wisdom file
	XCTAssertEqual(test_wisdom_generation(), 0);
}


@end
