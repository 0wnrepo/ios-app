//
//  WALSettingsTests.m
//  Wallabag
//
//  Created by Kevin Meyer on 30.05.14.
//  Copyright (c) 2014 Wallabag. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WALSettings.h"

@interface WALSettingsTests : XCTestCase
@property (strong) WALSettings* settings;
@end

@implementation WALSettingsTests

- (void)setUp
{
    [super setUp];
	self.settings = [[WALSettings alloc] init];
}

- (void)tearDown
{
	self.settings = nil;
    [super tearDown];
}

- (void)testUnreadFeedURL_domainWithHTTP_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"http://example.com/"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"http://example.com/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testUnreadFeedURL_domainWithHTTPS_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"https://example.com/"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"https://example.com/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testUnreadFeedURL_withTrailingSlashInBaseURL_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"https://example.com/wallabag/"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"https://example.com/wallabag/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testUnreadFeedURL_withoutTrailingSlashInBaseURL_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"https://example.com/wallabag"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"https://example.com/wallabag/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testUnreadFeedURL_subdomainWithTrailingSlash_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"https://wallabag.example.com/"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"https://wallabag.example.com/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testUnreadFeedURL_subdomainWithoutTrailingSlash_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"https://wallabag.example.com"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"https://wallabag.example.com/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testUnreadFeedURL_domainWithTrailingSlash_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"https://wallabag.com/"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"https://wallabag.com/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testUnreadFeedURL_domainWithoutTrailingSlash_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"https://wallabag.com"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"https://wallabag.com/wallabag/abc123/unread.xml";
	
	XCTAssertNotNil([self.settings getUnreadFeedURL]);
	
	NSString *resultString = [self.settings getUnreadFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testFavoriteFeedURL_domainWithHTTP_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"http://example.com/"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"http://example.com/wallabag/abc123/starred.xml";
	
	XCTAssertNotNil([self.settings getFavoriteFeedURL]);
	
	NSString *resultString = [self.settings getFavoriteFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}

- (void)testArchiveFeedURL_domainWithHTTP_correctFeedURL
{
	self.settings.wallabagURL = [NSURL URLWithString:@"http://example.com/"];
	self.settings.userName = @"wallabag";
	self.settings.apiToken = @"abc123";
	
	NSString *expectedResult = @"http://example.com/wallabag/abc123/archive.xml";
	
	XCTAssertNotNil([self.settings getArchiveFeedURL]);
	
	NSString *resultString = [self.settings getArchiveFeedURL].absoluteString;
	XCTAssert([expectedResult isEqualToString:resultString], @"Expected: %@ Got: %@", expectedResult, resultString);
}
@end
