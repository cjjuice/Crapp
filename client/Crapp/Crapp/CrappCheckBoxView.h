//
//  CrappCheckBoxView.h
//  Crapp
//
//  Created by Hyde, Andrew on 10/7/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckBoxProtocol <NSObject>

-(void)switchWithName:(NSString *)name is:(BOOL)status;

@end

@interface CrappCheckBoxView : UIView

-(id)initWithFrame:(CGRect)frame andName:(NSString *)name;

@property(nonatomic, retain)NSString *curName;

@property(nonatomic, assign) id<CheckBoxProtocol> delegate;

@end
