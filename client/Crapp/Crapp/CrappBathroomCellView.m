//
//  CrappBathroomCellView.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappBathroomCellView.h"

@implementation CrappBathroomCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setAttributesWith:(NSDictionary *)dictionary
{
    self.backgroundColor = [UIColor orangeColor];
}


@end
