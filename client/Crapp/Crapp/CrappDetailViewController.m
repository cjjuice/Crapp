//
//  CrappDetailViewController.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/7/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappDetailViewController.h"
#import "BathroomReview.h"
#import "CrappRateViewController.h"

@interface CrappDetailViewController ()

@end

@implementation CrappDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UIView *)createMainView
{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 50)];
    label.text = self.bathroom.name;
    NSLog(@"%@", self.bathroom.name);
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    [label release];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20,50, 50, 50)];
    label.text = @".3 MI";
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    [label release];
    
    UIView *starView = [[UIView alloc]initWithFrame:CGRectMake(180, 100, 150, 25)];
    
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
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, 320, 300)];
    
    NSArray *reviewArray = [self.bathroom.reviews allObjects];
    
    for(int x = 0; x < [reviewArray count]; x++)
    {
        BathroomReview *currentReview = [reviewArray objectAtIndex:x];
        
        UIView *reviewView = [[UIView alloc]initWithFrame:CGRectMake(0, 200*x, 320, 200)];
        
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 320, 200)];
        text.text = currentReview.text;
        
        [reviewView addSubview:text];
        [text release];
        
        [scroll addSubview:reviewView];
    }
    
    scroll.contentSize = CGSizeMake(320, [reviewArray count]*200);
    
    [view addSubview:scroll];
    [scroll release];
    
    [view addSubview:starView];
    [starView release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Rate!" forState:UIControlStateNormal];
    button.frame = CGRectMake(130, 380, 60, 40);
    [button addTarget:self action:@selector(rateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    
    return [view autorelease];
    
}

-(IBAction)rateButtonPressed:(id)sender
{
    CrappRateViewController *rate = [[CrappRateViewController alloc]init];
    rate.identifier = self.bathroom.identifier;
    [self presentViewController:rate animated:YES completion:^{
        //Nothing
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:[self createMainView]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
