//
//  CCEFeedHandler.h
//  CCE
//
//  Created by Hyde, Andrew on 9/27/12.
//  Copyright (c) 2012 Hyde, Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FeedLoadingBlock)(NSError *);
typedef void (^FeedParsingBlock)(NSError *);

typedef enum
{
    GetBathroom,
    GetFeedWithTypes,
}FeedType;

@interface CCEFeedManager : NSObject

+(void)getFeedWithName:(NSString *)name Type:(FeedType)type andBlock:(FeedLoadingBlock)block;
+(void)parseBathroomFeedWithDictionary:(NSDictionary *)dictionary andBlock:(FeedParsingBlock)block;

@end
