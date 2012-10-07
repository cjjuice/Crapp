//
//  CrappFeedHandler.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappFeedHandler.h"
#import <ESPN/ESPN.h>
#import "JSONKit.h"

//Add Bathroom
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

//Fetch bathroom
#define kID @"id"
#define kFLat @"flat"
#define kFLong @"flong"

@implementation CrappFeedHandler

+(void)getBathroomsByParameters:(NSDictionary *)dictionary withBlock:(FeedGettingBlock)block
{
    NSString *base = @"crapp-api.herokuapp.com/bathrooms/fetch?";
    
    if([dictionary objectForKey:kID])
    {
        base = [NSString stringWithFormat:@"%@id=%@", base, [dictionary objectForKey:kID]];
    }
    else if([dictionary objectForKey:@"flat"])
    {
        base = [NSString stringWithFormat:@"%@lat=%@&", base, [dictionary objectForKey:@"flat"]];
    }
    if([dictionary objectForKey:@"flong"])
    {
        base = [NSString stringWithFormat:@"%@lng=%@&", base, [dictionary objectForKey:@"flong"]];
    }
    
    //NSLog(@"%@", base);
    base = @"http://crapp-api.herokuapp.com/bathrooms/fetch?lat=41.234&lng=-71.234";
    [ESPN loadDataFromURL:base withBlock:^(NSData *data, NSError *error)
     {
         NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
         if(string)
         {
             NSDictionary *dict = [string objectFromJSONString];
             block(dict);
         }
     }];
}
+(void)getBathroomDetailsBy:(NSDictionary *)dictionary
{
    //Unused
}
+(void)addBathroomWith:(NSDictionary *)dictionary
{
    NSString *base = @"http://crapp-api.herokuapp.com/bathrooms/add?";
    
    if([dictionary objectForKey:kName])
    {
        base = [NSString stringWithFormat:@"%@name=%@&", base, [dictionary objectForKey:kName]];
    }
    if([dictionary objectForKey:kAddress])
    {
        base = [NSString stringWithFormat:@"%@address=%@&", base, [dictionary objectForKey:kAddress]];
    }
    if([dictionary objectForKey:kCity])
    {
        base = [NSString stringWithFormat:@"%@city=%@&", base, [dictionary objectForKey:kCity]];
    }
    if([dictionary objectForKey:kIsGreen])
    {
        base = [NSString stringWithFormat:@"%@isGreen=%@&", base, [dictionary objectForKey:kIsGreen]];
    }
    if([dictionary objectForKey:kHasProductDisp])
    {
        base = [NSString stringWithFormat:@"%@hasProductDispenser=%@&", base, [dictionary objectForKey:kHasProductDisp]];
    }
    if([dictionary objectForKey:kHasAttendent])
    {
        base = [NSString stringWithFormat:@"%@hasAttendent=%@&", base, [dictionary objectForKey:kHasAttendent]];
    }
    if([dictionary objectForKey:kHasWifi])
    {
        base = [NSString stringWithFormat:@"%@hasWifi=%@&", base, [dictionary objectForKey:kHasWifi]];
    }
    if([dictionary objectForKey:kHasSignage])
    {
        base = [NSString stringWithFormat:@"%@hasSignage=%@&", base, [dictionary objectForKey:kHasSignage]];
    }
    if([dictionary objectForKey:kIsHandsFree])
    {
        base = [NSString stringWithFormat:@"%@isHandsFree=%@&", base, [dictionary objectForKey:kIsHandsFree]];
    }
    if([dictionary objectForKey:kIsUnisex])
    {
        base = [NSString stringWithFormat:@"%@isUnisex=%@&", base, [dictionary objectForKey:kIsUnisex]];
    }
    
    if([dictionary objectForKey:kIsPublic])
    {
        base = [NSString stringWithFormat:@"%@isPublic=%@&", base, [dictionary objectForKey:kIsPublic]];
    }
    if([dictionary objectForKey:kIsFamily])
    {
        base = [NSString stringWithFormat:@"%@isFamily=%@&", base, [dictionary objectForKey:kIsFamily]];
    }
    if([dictionary objectForKey:kState])
    {
        base = [NSString stringWithFormat:@"%@state=%@&", base, [dictionary objectForKey:kState]];
    }
    if([dictionary objectForKey:kZip])
    {
        base = [NSString stringWithFormat:@"%@zip=%@&", base, [dictionary objectForKey:kZip]];
    }
    if([dictionary objectForKey:kLat])
    {
        base = [NSString stringWithFormat:@"%@lat=%@&", base, [dictionary objectForKey:kLat]];
    }
    if([dictionary objectForKey:klng])
    {
        base = [NSString stringWithFormat:@"%@lng=%@&", base, [dictionary objectForKey:klng]];
    }
    if([dictionary objectForKey:kisHandi])
    {
        base = [NSString stringWithFormat:@"%@isHandicapAccessible=%@&", base, [dictionary objectForKey:kisHandi]];
    }
    
    NSLog(@"%@", base);
    
    [ESPN loadJSONFromURL:base withBlock:^(NSDictionary *data, NSError *error)
    {
        NSLog(@"%@", data);
    }];
    
    
    
}
+(void)addReviewToBathroomWith:(NSDictionary *)dictionary
{
    NSString *base = @"http://crapp-api.herokuapp.com/reviews/add?id=";
    
    base = [NSString stringWithFormat:@"%@%@", base,[dictionary objectForKey:@"ID"]];
    base = [NSString stringWithFormat:@"%@&reviewtext=%@", base,[dictionary objectForKey:@"text"]];
    
    NSLog(@"%@", base);
    
    [ESPN loadJSONFromURL:base withBlock:^(NSDictionary *data, NSError *error)
     {
         NSLog(@"%@", data);
     }];
    
    
    //base = [NSString stringWithFormat:@"%@&overall=%@", base,[dictionary objectForKey:@"Overall"]];
    //base = [NSString stringWithFormat:@"%@&cleanliness=%@", base,[dictionary objectForKey:@"Cleanliness"]];
    //base = [NSString stringWithFormat:@"%@&atmosphere=%@", base,[dictionary objectForKey:@"Atmosphere"]];
    //base = [NSString stringWithFormat:@"%@&privacy=%@", base,[dictionary objectForKey:@"Privacy"]];
    //base = [NSString stringWithFormat:@"%@&heighborhood=%@", base,[dictionary objectForKey:@"neighborhood"]];
}
+(void)getFeedWithTypes:(NSDictionary *)dictionary
{
    
}

@end
