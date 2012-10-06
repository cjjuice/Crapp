//
//  CCEFeedHandler.m
//  CCE
//
//  Created by Hyde, Andrew on 9/27/12.
//  Copyright (c) 2012 Hyde, Andrew. All rights reserved.
//

#import "CCEFeedManager.h"
#import <ESPN/ESPN.h>
#import <ESPN/JSONKit.h>

@interface CCEFeedManager (Private)

+(void)parseBathroomDataFeedWithDictionary:(NSDictionary *)dictionary andBlock:(FeedParsingBlock)block;
+(void)parseNewsFeedWithDictionary:(NSDictionary *)dictionary andBlock:(FeedParsingBlock)block;

-(NSString *)getFeedURLForName:(NSString *)name;

@end

@implementation CCEFeedManager

#pragma mark -
#pragma mark Public Methods

+(void)getFeedWithName:(NSString *)name Type:(FeedType)type andBlock:(FeedLoadingBlock)block;
{    
    [ESPN loadDataFromURL:[CCEFeedManager getFeedURLForName:name] withBlock:^(NSData *data, NSError *error)
    {
        if(error)
            return;
        NSString *feedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if([feedString length] > 0)
        {
            switch (type) {
                case GetBathroom:
                {
                    [self parseBathroomDataFeedWithDictionary:[feedString objectFromJSONString] andBlock:^(NSError *error)
                    {
                        block(error);
                    }];
                    break;
                }
                case GetFeedWithTypes:
                {
                    [self parseNewsFeedWithDictionary:[feedString objectFromJSONString] andBlock:^(NSError *error)
                    {
                        block(error);
                    }];
                    break;
                }
                default:
                    break;
            }
        }
    }];
}

#pragma mark -
#pragma mark Parsing Methods

+(void)parseBathroomFeedWithDictionary:(NSDictionary *)dictionary andBlock:(FeedParsingBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
                       NSManagedObjectContext *context = [[ESPN threadDependentManagedObjectContext] retain];
                       
                       //[ESPN deleteEntityWithName:@"TestEntity"];
                        
                       

                       NSError *error = nil;
                       if (![context save:&error]) {
                            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                       }
                       
                       [context release];
                       
                       [pool drain];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          block(nil);
                                      });
                   });
}

+(void)parseNewsFeedWithDictionary:(NSDictionary *)dictionary andBlock:(FeedParsingBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       //DO PARSING
                       NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
                       NSManagedObjectContext *context = [[ESPN threadDependentManagedObjectContext] retain];
                       
                       //[ESPN deleteEntityWithName:@"TestEntity"];
                       
                       
                       
                       NSError *error = nil;
                       if (![context save:&error]) {
                           NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                       }
                       
                       [context release];
                       
                       [pool drain];

                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          block(nil);
                                      });
                   });
}

#pragma mark -
#pragma mark Utilities

+(NSString *)getFeedURLForName:(NSString *)name
{
    if([name isEqualToString:@"getBathroom"])
        return @"http://qam.espn.go.com/ncf/apps/bcs/shell";
    
    else if([name isEqualToString:@"getNews"])
        return @"http://qam.espn.go.com/ncf/apps/bcs/shell";
    
    else if([name isEqualToString:@"addBathroom"])
        return @"http://qam.espn.go.com/ncf/apps/bcs/shell";
    
    else if([name isEqualToString:@"reviewBathroom"])
        return @"http://qam.espn.go.com/ncf/apps/bcs/shell";
    else return nil;
}

@end
