//
//  CrappFeedHandler.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappFeedHandler.h"
#import <ESPN/ESPN.h>

#define kName @"name"
#define kAddress @"address"
#define kCity @"city"
#define kState @"state"
#define kZip @"zip"
#define kLat @"lat"
#define klng @"lng"
#define kisHandi @"isHandi"
#define kIsPublic @"isPublic"
#define kIsFamily @"isFamily"
#define kIsGreen @"isGreen"
#define kIsUnisex @"isUni"
#define kIsHandsFree @"isHandsFree"
#define kHasProductDisp @"hasProductDisp"
#define kHasAttendent @"hasAttendent"
#define kHasSignage @"hasSignage"
#define kHasWifi @"hasWifi"

@implementation CrappFeedHandler

+(void)getBathroomsByParameters:(NSDictionary *)dictionary
{
    
}
+(void)getBathroomDetailsBy:(NSDictionary *)dictionary
{
    
}
+(void)addBathroomWith:(NSDictionary *)dictionary
{
    NSString *base = @"crapp-api.herokuapp.com/bathrooms/add?";
    
    if([dictionary objectForKey:kName])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kName]];
    }
    if([dictionary objectForKey:kAddress])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kAddress]];
    }
    if([dictionary objectForKey:kCity])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kCity]];
    }
    if([dictionary objectForKey:kIsGreen])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kIsGreen]];
    }
    if([dictionary objectForKey:kHasProductDisp])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kHasProductDisp]];
    }
    if([dictionary objectForKey:kHasAttendent])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kHasAttendent]];
    }
    if([dictionary objectForKey:kHasWifi])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kHasWifi]];
    }
    if([dictionary objectForKey:kHasSignage])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kHasSignage]];
    }
    if([dictionary objectForKey:kIsHandsFree])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kIsHandsFree]];
    }
    if([dictionary objectForKey:kIsUnisex])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kIsUnisex]];
    }
    
    if([dictionary objectForKey:kIsPublic])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kIsPublic]];
    }
    if([dictionary objectForKey:kIsFamily])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kIsFamily]];
    }
    if([dictionary objectForKey:kState])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kState]];
    }
    if([dictionary objectForKey:kZip])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kZip]];
    }
    if([dictionary objectForKey:kLat])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kLat]];
    }
    if([dictionary objectForKey:klng])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:klng]];
    }
    if([dictionary objectForKey:kisHandi])
    {
        base = [NSString stringWithFormat:@"%@%@&", base, [dictionary objectForKey:kisHandi]];
    }
    
    [ESPN loadJSONFromURL:base withBlock:^(NSDictionary *data, NSError *error)
    {
        NSLog(@"%@", dictionary);
    }];
    
    
    
}
+(void)addReviewToBathroomWith:(NSDictionary *)dictionary
{
    
}
+(void)getFeedWithTypes:(NSDictionary *)dictionary
{
    
}

@end
