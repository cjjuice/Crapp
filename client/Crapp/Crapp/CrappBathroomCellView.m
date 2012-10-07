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
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width-30, 50)];
    label.text = bathroom.name;
    label.font = [UIFont fontWithName:@"Helvetica" size:14];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    [label release];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-50,(self.frame.size.height-50)/2, 50, 50)];
    label.text = [NSString stringWithFormat:@"%@ mi", bathroom.distance];
    label.font = [UIFont fontWithName:@"Helvetica" size:12];
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    [label release];
    
    UIView *charsView = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 200, 25)];
    
    int x = 0;
    
    if([bathroom.isUnisex boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-unisex"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
        
    }
    if([bathroom.hasAttendent boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-attendant"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    if([bathroom.hasProductDispenser boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-dispenser"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    if([bathroom.isGreen boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-ecofriendly"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    if([bathroom.isFamily boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-family"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    if([bathroom.isHandicapAccessible boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-handicap"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    if([bathroom.isHandsFree boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-handsfree"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    if([bathroom.isPublic boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-public"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    if([bathroom.hasWifi boolValue])
    {
        UIImage *image = [UIImage imageNamed:@"icon-wifi"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x*28, 0, 25, 25)];
        imageView.image = image;
        [charsView addSubview:imageView];
        x++;
    }
    
    [self addSubview:charsView];
    
    UIView *starView = [[UIView alloc]initWithFrame:CGRectMake(20, self.frame.size.height-25, 150, 25)];
    
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
