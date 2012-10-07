//
//  CrappCheckBoxView.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/7/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappCheckBoxView.h"

@implementation CrappCheckBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andName:(NSString *)name
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.curName = name;
        UIImage *image = [UIImage imageNamed:name];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
        imageView.image = image;
        
        [self addSubview:imageView];
        [imageView release];
        
        UISwitch *curSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(40, 10, 60, 20)];
        curSwitch.on = NO;
        [curSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:curSwitch];
        [curSwitch release];
    }
    return self;
}

-(IBAction)switchChanged:(id)sender
{
    UISwitch *curswitch = (UISwitch *)sender;
    
    [self.delegate switchWithName:self.curName is:curswitch.on];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
