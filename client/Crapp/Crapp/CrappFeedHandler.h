//
//  CrappFeedHandler.h
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrappFeedHandler : NSObject

+(void)getBathroomsByParameters:(NSDictionary *)dictionary;
+(void)getBathroomDetailsBy:(NSDictionary *)dictionary;
+(void)addBathroomWith:(NSDictionary *)dictionary;
+(void)addReviewToBathroomWith:(NSDictionary *)dictionary;
+(void)getFeedWithTypes:(NSDictionary *)dictionary;

@end
