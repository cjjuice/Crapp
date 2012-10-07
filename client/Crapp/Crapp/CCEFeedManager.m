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

#import "Bathroom.h"
#import "BathroomReview.h"
#import "BathroomScore.h"

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
   // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                  // ^{
                       NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
                       NSManagedObjectContext *context = [[ESPN threadDependentManagedObjectContext] retain];
                       
                       [ESPN deleteEntityWithName:@"Bathroom"];
                       
                       NSLog(@"%@", dictionary);
                       
                       NSArray *array = [dictionary objectForKey:@"bathrooms"];
                       
                       for(int x = 0; x < [array count]; x++)
                       {
                           NSDictionary *dict = [array objectAtIndex:x];
                           
                           Bathroom *bathroom = (Bathroom *)[NSEntityDescription insertNewObjectForEntityForName:@"Bathroom" inManagedObjectContext:context];
                           
//                           if([dict objectForKey:@"type"])
//                           {
//                               bathroom.type = [dict objectForKey:@"type"];
//                           }
                           
                            NSDictionary *infoDict = [dict objectForKey:@"info"];
                           if(![[infoDict objectForKey:@"address"] isKindOfClass:[NSNull class]])
                               bathroom.address = [infoDict objectForKey:@"address"];
                           if(![[infoDict objectForKey:@"city"] isKindOfClass:[NSNull class]])
                               bathroom.city = [infoDict objectForKey:@"city"];
                           if(![[infoDict objectForKey:@"hasAttendent"] isKindOfClass:[NSNull class]])
                                bathroom.hasAttendent =[NSNumber numberWithInt:[[infoDict objectForKey:@"hasAttendent"]intValue]];
                           if(![[infoDict objectForKey:@"hasProductDispenser"] isKindOfClass:[NSNull class]])
                               bathroom.hasProductDispenser = [NSNumber numberWithInt:[[infoDict objectForKey:@"hasProductDispenser"]intValue]];
                           if(![[infoDict objectForKey:@"hasSignage"] isKindOfClass:[NSNull class]])
                               bathroom.hasSignage = [NSNumber numberWithInt:[[infoDict objectForKey:@"hasSignage"]intValue]];
                           if(![[infoDict objectForKey:@"hasWifi"] isKindOfClass:[NSNull class]])
                               bathroom.hasWifi = [NSNumber numberWithInt:[[infoDict objectForKey:@"hasWifi"]intValue]];
                           if(![[infoDict objectForKey:@"identifier"] isKindOfClass:[NSNull class]])
                               bathroom.identifier = [NSString stringWithFormat:@"%d", [[infoDict objectForKey:@"id"]intValue]];
                           if(![[infoDict objectForKey:@"isFamily"] isKindOfClass:[NSNull class]])
                               bathroom.isFamily = [NSNumber numberWithInt:[[infoDict objectForKey:@"isFamily"]intValue]];
                           if(![[infoDict objectForKey:@"isGreen"] isKindOfClass:[NSNull class]])
                               bathroom.isGreen = [NSNumber numberWithInt:[[infoDict objectForKey:@"isGreen"]intValue]];
                           if(![[infoDict objectForKey:@"isHandicapAccessible"] isKindOfClass:[NSNull class]])
                               bathroom.isHandicapAccessible = [NSNumber numberWithInt:[[infoDict objectForKey:@"isHandicapAccessible"]intValue]];
                           if(![[infoDict objectForKey:@"isHandsFree"] isKindOfClass:[NSNull class]])
                               bathroom.isHandsFree = [NSNumber numberWithInt:[[infoDict objectForKey:@"isHandsFree"]intValue]];
                           if(![[infoDict objectForKey:@"isPublic"] isKindOfClass:[NSNull class]])
                               bathroom.isPublic = [NSNumber numberWithInt:[[infoDict objectForKey:@"isPublic"]intValue]];
                           if(![[infoDict objectForKey:@"isUnisex"] isKindOfClass:[NSNull class]])
                               bathroom.isUnisex = [NSNumber numberWithInt:[[infoDict objectForKey:@"isUnisex"]intValue]];
                           if(![[infoDict objectForKey:@"lat"] isKindOfClass:[NSNull class]])
                               bathroom.lat = [infoDict objectForKey:@"lat"];
                           if(![[infoDict objectForKey:@"lng"] isKindOfClass:[NSNull class]])
                               bathroom.longitude = [infoDict objectForKey:@"lng"];
                           if(![[infoDict objectForKey:@"name"] isKindOfClass:[NSNull class]])
                               bathroom.name = [infoDict objectForKey:@"name"];
                           if(![[infoDict objectForKey:@"state"] isKindOfClass:[NSNull class]])
                               bathroom.state = [infoDict objectForKey:@"state"];
                           if(![[infoDict objectForKey:@"zip"] isKindOfClass:[NSNull class]])
                               bathroom.zip = [infoDict objectForKey:@"zip"];
                           
                           if([dict objectForKey:@"reviews"])
                           {
                               NSArray *array = (NSArray *)[dict objectForKey:@"reviews"];
                               for(int x = 0; x < [array count]; x++)
                               {
                                   NSDictionary *reviewDict = [array objectAtIndex:x];
                                   BathroomReview *review = (BathroomReview *)[NSEntityDescription insertNewObjectForEntityForName:@"BathroomReview" inManagedObjectContext:context];
                                   if(![[reviewDict objectForKey:@"reviewtext"] isKindOfClass:[NSNull class]])
                                       review.text = [reviewDict objectForKey:@"reviewtext"];
                                   
                                   [bathroom addReviewsObject:review];
                               }
                           }
                           
                   
                           
                       }
                       
                      
                       
                       
                       
                       

                       NSError *error = nil;
                       if (![context save:&error]) {
                            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                       }
                       
                       [context release];
                       
                       [pool drain];
                       
                       //dispatch_async(dispatch_get_main_queue(),
                                    //  ^{
                                          block(nil);
                                    //  });
                   //});
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
