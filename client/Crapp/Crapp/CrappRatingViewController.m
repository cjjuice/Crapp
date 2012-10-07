//
//  CrappRatingViewController.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappRatingViewController.h"

@interface CrappRatingViewController ()

@end

@implementation CrappRatingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:[self createRatingView]];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)createRatingView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    
    NSArray *array = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", @"sixx", @"seven", @"eight", @"nine", @"ten", nil];
    for(int x = 0; x < [array count]; x++)
    {
        UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(0, x*50, scrollView.frame.size.width, scrollView.frame.size.height)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tempView.frame.size.width, tempView.frame.size.height)];
        label.text = [array objectAtIndex:x];
        [tempView addSubview:label];
        [label release];
        [scrollView addSubview:tempView];
        [tempView release];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.contentSize.width, [array count]*55);
    
    
    
    return [view autorelease];
}

@end
