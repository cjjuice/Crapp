//
//  CrappListingCell.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappBathroomCellView.h"
#import "CrappListingCell.h"

#define kViewTag 6543

@implementation CrappListingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAttributesWith:(NSDictionary *)dictionary
{
    CrappBathroomCellView *view = [[CrappBathroomCellView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 100)];
    view.tag = kViewTag;
    [view setAttributesWith:dictionary];
    [self.contentView addSubview:view];
    [view release];
    
}

-(void)removeInnerview
{
    [[self.contentView viewWithTag:kViewTag]removeFromSuperview];
}

@end
