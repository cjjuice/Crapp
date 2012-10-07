//
//  BathroomReview.h
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BathroomReview : NSManagedObject

@property (nonatomic, retain) NSString * headline;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSManagedObject *bathroom;

@end
