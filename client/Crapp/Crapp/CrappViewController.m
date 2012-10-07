//
//  CrappViewController.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <ESPN/ESPN.h>
#import "CrappViewController.h"
#import "CrappGottaGoViewController.h"
#import "CrappEntertainmentViewController.h"
#import "CrappRatingViewController.h"
#import "CrappAroundMeViewController.h"
#import "CrappLogViewController.h"
#import "CrappVirtualStallViewController.h"
#import "CrappNewsViewController.h"
#import "CrappAddRatingViewController.h"

#define kButtonSize 94
#define kPadding 10


typedef enum
{
    kAroundMe,
    kRating,
    kEntertainment,
    kLog,
    kGottaGo
}MAINBUTTONTYPE;

@interface CrappViewController ()

@end

@implementation CrappViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:[self createMainViewWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)]];

    [self.view addSubview:[self createAdWithURL:@"http://s0.2mdn.net/3159915/CFBMobileAppBanner320x50-AT41523072.jpg"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)createMainViewWithFrame:(CGRect)frame
{
    UIView *mainView = [[UIView alloc]initWithFrame:frame];
    mainView.backgroundColor = [UIColor clearColor];
    
    UIImage *image = [UIImage imageNamed:@"background.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    imageView.image = image;
    [mainView addSubview:imageView];
    [imageView release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kPadding, kPadding, kButtonSize, kButtonSize);
    //button.backgroundColor = [UIColor redColor];
    [button setImage:[UIImage imageNamed:@"Icon-AroundMe.png"] forState:UIControlStateNormal];
    button.tag = 1;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kPadding, kPadding+kButtonSize, kButtonSize, 20)];
    label.text = @"Around Me";
    label.font = [UIFont fontWithName:@"Helvetica" size:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [mainView addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kPadding +kButtonSize+kPadding, kPadding, kButtonSize, kButtonSize);
    //button.backgroundColor = [UIColor purpleColor];
    [button setImage:[UIImage imageNamed:@"Icon-BathroomLog.png"] forState:UIControlStateNormal];
    button.tag = 2;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(kPadding+kButtonSize+kPadding, kPadding+kButtonSize, kButtonSize, 20)];
    label.text = @"Log";
    label.font = [UIFont fontWithName:@"Helvetica" size:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [mainView addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kPadding +kButtonSize+kPadding+kButtonSize+kPadding, kPadding, kButtonSize, kButtonSize);
    //button.backgroundColor = [UIColor greenColor];
    [button setImage:[UIImage imageNamed:@"Icon-Entertainment.png"] forState:UIControlStateNormal];
    button.tag = 3;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(kPadding+kButtonSize+kPadding+kButtonSize+kPadding, kPadding+kButtonSize, kButtonSize, 20)];
    label.text = @"Entertainment";
    label.font = [UIFont fontWithName:@"Helvetica" size:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [mainView addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kPadding, kPadding+kButtonSize+kPadding*3, kButtonSize, kButtonSize);
    //button.backgroundColor = [UIColor blackColor];
    [button setImage:[UIImage imageNamed:@"Icon-News.png"] forState:UIControlStateNormal];
    button.tag = 4;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(kPadding, kPadding+kButtonSize+kButtonSize+kPadding*3, kButtonSize, 20)];
    label.text = @"News";
    label.font = [UIFont fontWithName:@"Helvetica" size:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [mainView addSubview:label];

    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kPadding +kButtonSize+kPadding, kPadding+kButtonSize+kPadding*3, kButtonSize, kButtonSize);
    //button.backgroundColor = [UIColor orangeColor];
    [button setImage:[UIImage imageNamed:@"Icon-Ratings.png"] forState:UIControlStateNormal];
    button.tag = 7;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(kPadding+kButtonSize+kPadding, kPadding+kButtonSize+kButtonSize+kPadding*3, kButtonSize, 20)];
    label.text = @"Browse";
    label.font = [UIFont fontWithName:@"Helvetica" size:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [mainView addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kPadding +kButtonSize+kPadding+kButtonSize+kPadding, kPadding+kButtonSize+kPadding*3, kButtonSize, kButtonSize);
    //button.backgroundColor = [UIColor blueColor];
    [button setImage:[UIImage imageNamed:@"Icon-VirtualStall.png"] forState:UIControlStateNormal];
    button.tag = 5;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(kPadding+kButtonSize+kPadding+kButtonSize+kPadding, kPadding+kButtonSize+kButtonSize+kPadding*3, kButtonSize, 20)];
    label.text = @"Virtual Stall";
    label.font = [UIFont fontWithName:@"Helvetica" size:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [mainView addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kPadding, kPadding+kButtonSize+kPadding+kButtonSize+kPadding*5, mainView.frame.size.width-(kPadding*2), kButtonSize);
    [button setImage:[UIImage imageNamed:@"Icon-Gottago-sm.png"] forState:UIControlStateNormal];
    //button.backgroundColor = [UIColor yellowColor];
    button.tag = 6;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
    
    
    return [mainView autorelease];
}

-(UIView *)createAdWithURL:(NSString *)url
{
    UIView *adView = [[UIView alloc]initWithFrame:CGRectMake(0, 366, 320, 50)];
    adView.backgroundColor = [UIColor clearColor];
    
    [ESPN loadDataFromURL:url withBlock:^(NSData *data, NSError *error)
    {
        UIImage *image = [UIImage imageWithData:data];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [adView addSubview:imageView];
        [imageView release];
    }];
    
    return [adView autorelease];
}

-(IBAction)buttonPressed:(id)sender
{
    switch ([sender tag]) {
        case 1:
        {
            CrappAroundMeViewController *gottaGo = [[CrappAroundMeViewController alloc]init];
            gottaGo.title = @"Around Me";
            [self.navigationController pushViewController:gottaGo animated:YES];
            [gottaGo release];
            break;
        }
        case 2:
        {
            CrappAddRatingViewController *gottaGo = [[CrappAddRatingViewController alloc]init];
            gottaGo.title = @"Add Rating";
            [self.navigationController pushViewController:gottaGo animated:YES];
            [gottaGo release];
            break;
        }
        case 3:
        {
            CrappEntertainmentViewController *gottaGo = [[CrappEntertainmentViewController alloc]init];
            gottaGo.title = @"Entertainment";
            [self.navigationController pushViewController:gottaGo animated:YES];
            [gottaGo release];
            break;
        }
        case 4:
        {
            CrappLogViewController *gottaGo = [[CrappLogViewController alloc]init];
            gottaGo.title = @"Log";
            [self.navigationController pushViewController:gottaGo animated:YES];
            [gottaGo release];
            break;
        }
        case 5:
        {
            CrappNewsViewController *gottaGo = [[CrappNewsViewController alloc]init];
            gottaGo.title = @"News";
            [self.navigationController pushViewController:gottaGo animated:YES];
            [gottaGo release];
            break;
        }
        case 7:
        {
            CrappVirtualStallViewController *gottaGo = [[CrappVirtualStallViewController alloc]init];
            gottaGo.title = @"Virtual Stall";
            [self.navigationController pushViewController:gottaGo animated:YES];
            [gottaGo release];
            break;
        }
        case 6:
        {
            CrappGottaGoViewController *gottaGo = [[CrappGottaGoViewController alloc]init];
            gottaGo.title = @"GOTTA GO";
            [self.navigationController pushViewController:gottaGo animated:YES];
            [gottaGo release];
            break;
        }
            
        default:
            break;
    }
}

@end
