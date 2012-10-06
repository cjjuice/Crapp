//
//  CrappLocationManager.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappLocationManager.h"

@implementation CrappLocationManager

@synthesize manager, lat, longi;

static CrappLocationManager *sharedInstance;

+(CrappLocationManager *)sharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[CrappLocationManager alloc] init];
        [sharedInstance start];
    }
    return sharedInstance;

}

-(void)start
{
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    manager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [manager startUpdatingLocation];
}

-(void)stop
{
    [manager stopUpdatingLocation];
}

+(NSDictionary *)getCurrentLocation
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:[[CrappLocationManager sharedInstance] lat], @"lat", [[CrappLocationManager sharedInstance] longi], @"long", nil];
    return dictionary;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    int degrees = newLocation.coordinate.latitude;
    double decimal = fabs(newLocation.coordinate.latitude - degrees);
    int minutes = decimal * 60;
    double seconds = decimal * 3600 - minutes * 60;
    self.lat = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
                     degrees, minutes, seconds];
    
    degrees = newLocation.coordinate.longitude;
    decimal = fabs(newLocation.coordinate.longitude - degrees);
    minutes = decimal * 60;
    seconds = decimal * 3600 - minutes * 60;
    self.longi = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
                       degrees, minutes, seconds];
    
    
}



@end
