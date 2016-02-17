//
//  WALSettings.h
//  Wallabag
//
//  Created by Kevin Meyer on 20.02.14.
//  Copyright (c) 2014 Wallabag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WALSettings : NSObject

+ (WALSettings*) settingsFromSavedSettings;
- (void) saveSettings;

- (void) setWallabagURL:(NSURL*) url;
- (NSURL*) getWallabagURL;

- (NSURL*) getUnreadFeedURL;
- (NSURL*) getFavoriteFeedURL;
- (NSURL*) getArchiveFeedURL;

- (NSURL*) getURLToAddArticle:(NSURL*) articleURL;

@property NSString *userName;
@property (strong) NSString *apiToken;

@end
