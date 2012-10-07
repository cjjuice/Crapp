//
//  NewsItem.h
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NewsItem : NSManagedObject

@property (nonatomic, retain) NSString * headline;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * byline;
@property (nonatomic, retain) NSString * linkURL;
@property (nonatomic, retain) NSNumber * order;

@end
