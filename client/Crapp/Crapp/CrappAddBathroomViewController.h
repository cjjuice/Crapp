//
//  CrappAddBathroomViewController.h
//  Crapp
//
//  Created by Hyde, Andrew on 10/7/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrappCheckBoxView.h"

@interface CrappAddBathroomViewController : UIViewController <UITextFieldDelegate, CheckBoxProtocol>

@property(nonatomic, retain)NSMutableArray *curDict;

@end
