//
//  Bathroom.h
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BathroomReview, BathroomScore;

@interface Bathroom : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSNumber * hasAttendent;
@property (nonatomic, retain) NSNumber * hasProductDispenser;
@property (nonatomic, retain) NSNumber * hasSignage;
@property (nonatomic, retain) NSNumber * hasWifi;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSNumber * isFamily;
@property (nonatomic, retain) NSNumber * isGreen;
@property (nonatomic, retain) NSNumber * isHandicapAccessible;
@property (nonatomic, retain) NSNumber * isHandsFree;
@property (nonatomic, retain) NSNumber * isPublic;
@property (nonatomic, retain) NSNumber * isUnisex;
@property (nonatomic, retain) NSString * lat;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * zip;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSSet *scores;
@property (nonatomic, retain) NSSet *reviews;
@end

@interface Bathroom (CoreDataGeneratedAccessors)

- (void)addScoresObject:(BathroomScore *)value;
- (void)removeScoresObject:(BathroomScore *)value;
- (void)addScores:(NSSet *)values;
- (void)removeScores:(NSSet *)values;

- (void)addReviewsObject:(BathroomReview *)value;
- (void)removeReviewsObject:(BathroomReview *)value;
- (void)addReviews:(NSSet *)values;
- (void)removeReviews:(NSSet *)values;

@end
