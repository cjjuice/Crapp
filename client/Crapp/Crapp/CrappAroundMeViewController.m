//
//  CrappAroundMeViewController.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappAroundMeViewController.h"
#import "CrappListingCell.h"
#import "CrappMapContainer.h"

#define kCurrentViewTag 12345

@interface CrappAroundMeViewController ()

@end

@implementation CrappAroundMeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"Map" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(mapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(0, 0, 160, 50);
        [self.view addSubview:button];
        
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"List" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(listButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(160, 0, 160, 50);
        [self.view addSubview:button];
        
        [self.view addSubview:[self createMapView]];

        
        // Custom initialization
    }
    return self;
}

-(IBAction)mapButtonPressed:(id)sender
{
    [[self.view viewWithTag:kCurrentViewTag]removeFromSuperview];
    [self.view addSubview:[self createMapView]];

}

-(IBAction)listButtonPressed:(id)sender
{
    [[self.view viewWithTag:kCurrentViewTag]removeFromSuperview];
    [self.view addSubview:[self createTableView]];
}

-(UIView *)createTableView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height)];
    view.tag = kCurrentViewTag;
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [view addSubview:tableview];
    [tableview release];
    
    return [view autorelease];
}

-(UIView *)createMapView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height)];
    view.tag = kCurrentViewTag;
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"41", @"lat", @"-71", @"long", @"JWU", @"name", nil]];
    
    CrappMapContainer *map = [[CrappMapContainer alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) andMarkers:array];
    
    [view addSubview:map];
    
    [map release];
    
    
    return [view autorelease];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CrappListingCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCellID"];
    if (cell == nil) {
        cell = [[[CrappListingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListingCellID"] autorelease];
        cell.clearsContextBeforeDrawing = YES;
    }
    
    [cell removeInnerview];
    [cell setAttributesWith:[NSDictionary dictionaryWithObjectsAndKeys:@"hey", @"hey", nil]];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex {
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
