//
//  CrappMapContainer.m
//  Crapp
//
//  Created by Hyde, Andrew on 10/6/12.
//  Copyright (c) 2012 Crapp!. All rights reserved.
//

#import "CrappMapContainer.h"

@implementation CrappMapContainer

- (id)initWithFrame:(CGRect)frame andMarkers:(NSArray *)markers
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:webview];
        
        NSError *error = nil;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"map" ofType:@"txt"];
        NSString *fileText = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        [webview loadHTMLString:fileText baseURL:nil];
        

        NSString *jsCommand = [NSString stringWithFormat:@"addMarker(%f, %f)",-33.890542, 151.274856];
        [webview stringByEvaluatingJavaScriptFromString:jsCommand];
        [webview release];
        
        
        
        
        // Initialization code
    }
    return self;
}

@end
