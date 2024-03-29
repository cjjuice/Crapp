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
#import "CrappLocationManager.h"
#import "CrappFeedHandler.h"
#import "CCEFeedManager.h"
#import <ESPN/ESPN.h>
#import "Bathroom.h"
#import "CrappDetailViewController.h"
#import "CrappAddBathroomViewController.h"

#define kCurrentViewTag 12345

@interface CrappAroundMeViewController ()

@end

@implementation CrappAroundMeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UISegmentedControl *control = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"Map", @"List", nil]];
        control.frame = CGRectMake(-10, 0, 340, 35);
        control.tintColor = [UIColor darkGrayColor];
        control.segmentedControlStyle = UISegmentedControlStyleBar;
        control.selectedSegmentIndex = 1;
        [control addTarget:self action:@selector(controlChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:control];
        [control release];
        
        
        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [button setTitle:@"Map" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(mapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        button.frame = CGRectMake(0, 0, 160, 50);
//        [self.view addSubview:button];
//        
//        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [button setTitle:@"List" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(listButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        button.frame = CGRectMake(160, 0, 160, 50);
//        [self.view addSubview:button];
        
        UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBathroom:)];
        [self.navigationItem setRightBarButtonItem:addButton];
        [addButton release];
        
        
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicator.frame = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 50, 50) ;
        [self.view addSubview:indicator];
        
        [CrappFeedHandler getBathroomsByParameters:[NSDictionary dictionaryWithObjectsAndKeys:@"41.819870", @"flat", @"-71.412601", @"flong", nil] withBlock:^(NSDictionary *data)
         {
             
             [CCEFeedManager parseBathroomFeedWithDictionary:data andBlock:^(NSError *error)
              {
                  [indicator removeFromSuperview];
                  [indicator release];
                   [self.view addSubview:[self createTableView]];
              }];
         }];
    }
    return self;
}

-(IBAction)controlChanged:(id)sender
{
    [[self.view viewWithTag:kCurrentViewTag]removeFromSuperview];
    
    UISegmentedControl *control = (UISegmentedControl *)sender;
    NSLog(@"%d", control.selectedSegmentIndex);
    switch(control.selectedSegmentIndex)
    {
        case 0:
             [self.view addSubview:[self createMapView]];
            break;
            
        case 1:
            [self.view addSubview:[self createTableView]];
            break;
            
        default:
            break;
            
    }
    
}

-(IBAction)addBathroom:(id)sender
{
    CrappAddBathroomViewController *add = [[CrappAddBathroomViewController alloc]init];
    [self presentViewController:add animated:YES completion:^{
        //Nothing
    }];
}

-(IBAction)mapButtonPressed:(id)sender
{
    
   

}

-(IBAction)listButtonPressed:(id)sender
{
    [[self.view viewWithTag:kCurrentViewTag]removeFromSuperview];
    
}

-(void)updateArray
{
    NSArray *array = [ESPN fetchForEntity:@"Bathroom" withPredicate:nil andSortDescriptor:nil];
    
    self.currentArray = array;
    
}

-(UIView *)createTableView
{
    [self updateArray];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, self.view.frame.size.height-50)];
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
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, self.view.frame.size.height)];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Bathroom *currentBathroom = [self.currentArray objectAtIndex:indexPath.row];
    CrappDetailViewController *detail = [[CrappDetailViewController alloc]init];
    detail.bathroom = currentBathroom;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.currentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CrappListingCell *cell = nil;
    Bathroom *bathroom = [self.currentArray objectAtIndex:indexPath.row];
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCellID"];
    if (cell == nil) {
        cell = [[[CrappListingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListingCellID"] autorelease];
        cell.clearsContextBeforeDrawing = YES;
    }
    
    [cell removeInnerview];
    [cell setAttributesWith:bathroom];
    
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
