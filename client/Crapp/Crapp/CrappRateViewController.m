//
//  CrappRateViewController.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/7/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappRateViewController.h"
#import "CrappFeedHandler.h"

@interface CrappRateViewController ()

@end

@implementation CrappRateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)doneButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        //Nothing
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(300, 0, 20, 20);
    [doneButton setTitle:@"x" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:doneButton];
    
    [self.view addSubview:[self createMainView]];
    
    // Do any additional setup after loading the view from its nib.
}

//-(NSMutableArray *)createDict
//{
//    NSMutableArray *returnArray = [[NSMutableArray alloc]init];
//    
//    NSDictionary *dict = NSDictionary dictionaryWithObjectsAndKeys:@", nil
//    
//    
//    return [returnArray autorelease];
//}

-(UIView *)createMainView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40)];
    view.tag = 13;
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, 300, 150)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"Enter your review";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    textField.tag = 65;
    textField.delegate = self;
    
    [view addSubview:textField];
    [textField release];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    submitButton.frame = CGRectMake(60, 380, 200, 40);
    
    [view addSubview:submitButton];
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 160, 320, 200)];
    scroll.tag = 5432;
    [scroll addSubview:[self createScoreWithLabel:@"Overall" andOrigin:0 andTag:1]];
    [scroll addSubview:[self createScoreWithLabel:@"Cleanliness" andOrigin:60 andTag:2]];
    [scroll addSubview:[self createScoreWithLabel:@"Atmosphere" andOrigin:120 andTag:3]];
    [scroll addSubview:[self createScoreWithLabel:@"Privacy" andOrigin:180 andTag:4]];
    [scroll addSubview:[self createScoreWithLabel:@"Neighborhood" andOrigin:240 andTag:5]];
    
    scroll.contentSize = CGSizeMake(320, 60*5);
    
    [view addSubview:scroll];
    
    
    return [view autorelease];
}

-(UIView *)createScoreWithLabel:(NSString *)label andOrigin:(int)origin andTag:(int)tag
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, origin, 320, 60)];
    view.tag = 300+tag;
    UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 20)];
    newLabel.text = label;
    [view addSubview:newLabel];
    [newLabel release];
    
    for(int x = 0; x < 5; x++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"star.png" ] forState:UIControlStateNormal];
        button.tag = 200+x;
        [button addTarget:self action:@selector(starButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(25*x+5, 30, 30, 30);
        
        [view addSubview:button];
    }
    
    
    return [view autorelease];
}

-(IBAction)starButtonPressed:(id)sender
{
    
}

-(IBAction) submitButtonPressed:(id)sender
{
    UIView *mainView = [self.view viewWithTag:13];
    UITextField *field = (UITextField *)[mainView viewWithTag:65];
    
    [CrappFeedHandler addReviewToBathroomWith:[NSDictionary dictionaryWithObjectsAndKeys:self.identifier, @"ID", field.text, @"text", @"5", @"Overall", @"4", @"Cleanliness", @"5", @"Atmosphere", @"5", @"Privacy", @"5", @"Neighborhood", nil]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
