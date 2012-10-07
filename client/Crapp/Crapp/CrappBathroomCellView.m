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

-(void)setAttributesWith:(Bathroom *)bathroom
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    label.text = bathroom.name;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    [label release];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-50,(self.frame.size.height-50)/2, 50, 50)];
    label.text = @".3 MI";
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    [label release];
    
    UIView *starView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-25, 150, 25)];
    
    for(int x = 0; x < 5; x++)
    {
        UIView *star = [[UIView alloc]initWithFrame:CGRectMake(25*x+5, 0, 25, 25)];
        UIImage *image = [UIImage imageNamed:@"star.png"];
        UIImageView *view = [[UIImageView alloc]initWithImage:image];
        [star addSubview:view];
        [view release];
        [starView addSubview:star];
        [star release];
    }
    
    [self addSubview:starView];
    [starView release];
    
    //self.backgroundColor = [UIColor orangeColor];
}


@end
