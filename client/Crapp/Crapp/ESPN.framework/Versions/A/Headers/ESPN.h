//
//  ESPN.h
//  ESPNFramework-iOS
//
//  Created by Hyde, Andrew on 10/2/12.
//  Copyright (c) 2012 ESPN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

typedef void (^NetworkingBlock)(NSData *, NSError *);
typedef void (^JSONBlock)(NSDictionary *, NSError *);

@interface ESPN : NSObject
{

}

//------------------------------------------------------------------------------------------------------------------------------------------//

#pragma mark -
#pragma mark NETWORKING

//Takes NSString and block, standard request is used. Block is always executed on MAIN thread when returning.
+(void)loadDataFromURL:(NSString *)URL withBlock:(NetworkingBlock)block;

//Takes Request and block. Block is always executed on MAIN thread when returning.
+(void)loadDataFromRequest:(NSMutableURLRequest *)request withBlock:(NetworkingBlock)block;

//Takes URL and returns NSDictionary of parsed JSON
+(void)loadJSONFromURL:(NSString *)URL withBlock:(JSONBlock)block;

//Takes REquest and returns NSDictionary of parsed JSON
+(void)loadJSONFromRequest:(NSMutableURLRequest *)request withBlock:(JSONBlock)block;

//------------------------------------------------------------------------------------------------------------------------------------------//

#pragma mark -
#pragma mark COREDATA

//Returns core data entity matching name. Optional predicate and descriptor can/should be sent as nil if not being used.
+(id)fetchForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicateRequest andSortDescriptor:(NSArray *)descriptor;

//Checks current thread requesting on, and returns the correct MOC for that thread
+(NSManagedObjectContext *)threadDependentManagedObjectContext;

//Deletes ALL entities with the name provided.
+(BOOL)deleteEntityWithName:(NSString *)name;

//------------------------------------------------------------------------------------------------------------------------------------------//

#pragma mark -
#pragma mark KEYCHAIN
//Updates a value in the keychain
+(BOOL)updateKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier;

//Creates a value in the keychain
+(BOOL)createKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier;

//Deletes and out in the keychain
+(BOOL)deleteKeychainValueForIdentifier:(NSString *)identifier;

//Retrieves a value from the keychain
+(NSString*)getKeychainValueForIdentifier:(NSString *)identifier;

//------------------------------------------------------------------------------------------------------------------------------------------//

#pragma mark -
#pragma mark UTILITIES
//Returns whether the screen supports retina or not
+(BOOL)isRetina;

//Returns YES for iPad and NO for iPhone
+(BOOL)isIPad;

//Scrolls the UIView passed in the first parameter to be visible in the scrollview passed in the second parameter.
+(void)scrollViewToVisible:(UIView *)view inScrollView:(UIScrollView *)scrollView animated:(BOOL)animated;

//Swizzle selector is used to replace a method in a class with another permanently.
+(void)swizzleSelector:(SEL)orig ofClass:(Class)c withSelector:(SEL)new;

//Removes characters in set from the string
+(NSString *) stripCharactersFromString:(NSString *)string inSet: (NSCharacterSet *) chars;

//Takes in time of format yyyyMMdd HH:mm ZZZZ and returns it in client time in the form of HH:mm ZZZZ
+(NSString *)convertDateStringIntoClientTime:(NSString *)timeString forDate:(NSString *)dateString;

//User agent string is a combination of device, system version, app name and build number
+(NSString *)getUserAgentString;

//------------------------------------------------------------------------------------------------------------------------------------------//

#pragma mark -
#pragma mark OMNITURE
//OUID is the omniture visitor ID to link between Mobile Web and Apps, it should be set on all Webview requests and all omniture tracks
+(NSString*)getOUID;

//trackLink is intended to be called for all user touch event tracking. It is required your dictionary contain a key/value pair for "linkName" otherwise the trackLink will be sent as a track.
+(void)trackLink:(NSDictionary*)trackVars removingWhiteSpace:(BOOL)remove;

//track is intended to be called for page views. 
+(void)track:(NSDictionary*)trackVars removingWhiteSpace:(BOOL)remove;

//You MUST initialize omniture client before you can begin tracking otherwise no tracks will be correct
+(void)initializeOmnitureWithAccount:(NSString*)account channel:(NSString*)channel prop25:(NSString*)prop25 prop26:(NSString*)prop26 currency:(NSString*)currency trackingServer:(NSString *)trackingServer trackingServerSecure:(NSString *)trackingServerSecure dc:(NSString *)dc debug:(BOOL)debug;
@end
