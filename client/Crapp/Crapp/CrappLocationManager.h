//
//  CrappLocationManager.h
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CrappLocationManager : NSObject <CLLocationManagerDelegate>
{
    
}

+(id)sharedInstance;
-(void)start;
+(NSString *)getLat;
+(NSString *)getLong;
+(NSDictionary *)getCurrentLocation;

@property(nonatomic, retain)CLLocationManager *manager;
@property(nonatomic, retain)NSString *lat;
@property(nonatomic, retain)NSString *longi;
@end
