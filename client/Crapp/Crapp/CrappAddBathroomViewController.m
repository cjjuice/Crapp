//
//  CrappAddBathroomViewController.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/7/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappAddBathroomViewController.h"
#import "CrappCheckBoxView.h"
#import "CrappFeedHandler.h"

@interface CrappAddBathroomViewController ()

@end

@implementation CrappAddBathroomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

-(UIView *)createMainView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    view.tag = 1234;
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(300, 0, 20, 20);
    [doneButton setTitle:@"x" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:doneButton];
    
    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 40, 300, 40)];
    textField.delegate = self;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"Name";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.tag = 65;

    [view addSubview:textField];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 90, 280, 300)];
    
    [scrollView addSubview:[self createCheckBoxWithName:@"star" andOrigin:0]];
    [scrollView addSubview:[self createCheckBoxWithName:@"star" andOrigin:50]];
    [scrollView addSubview:[self createCheckBoxWithName:@"star" andOrigin:100]];
    [scrollView addSubview:[self createCheckBoxWithName:@"star" andOrigin:150]];
    
    
    [view addSubview:scrollView];
    [scrollView release];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    submitButton.frame = CGRectMake(60, 380, 200, 40);
    
    [view addSubview:submitButton];
    
    return [view autorelease];
}

-(IBAction)submitButtonPressed:(id)sender
{
    UIView *main = [self.view viewWithTag:1234];
    UITextField *field = (UITextField *)[main viewWithTag:65];
    
    [CrappFeedHandler addBathroomWith:[NSDictionary dictionaryWithObjectsAndKeys:field.text, @"name", @"41.819870", @"lat", @"-71.412601", @"lng", @"yes", @"isPublic", nil]];
}

-(UIView *)createCheckBoxWithName:(NSString *)name andOrigin:(int)origin
{
    CrappCheckBoxView *view = [[CrappCheckBoxView alloc]initWithFrame:CGRectMake(0, origin, 100, 50) andName:name];
    view.delegate = self;
    return [view autorelease];
}

-(IBAction)doneButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        //Nothing
    }];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void)switchWithName:(NSString *)name is:(BOOL)status
{
    if(status)
    {
        [self.curDict addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"yes", @"status", name, @"name", nil]];
    }
    else
    {
         [self.curDict addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"no", @"status", name, @"name", nil]];
    }
    
    NSLog(@"%@", name);
}


@end
