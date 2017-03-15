//
//  UINavigationBar+Ext.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/14.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "UINavigationBar+Ext.h"
#import <objc/runtime.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
@implementation UINavigationBar (Ext)
- (void)lt_setBackgroundColor:(UIColor *)backgroundColor andFont:(UIFont*)font
{
    
//    if (!self.overlay) {
//        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
//        self.overlay.userInteractionEnabled = NO;
//        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;    // Should not set `UIViewAutoresizingFlexibleHeight`
//        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
//    }
//    //    self.overlay.backgroundColor = backgroundColor;
    
    self.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                backgroundColor, NSForegroundColorAttributeName, font, NSFontAttributeName, nil];
}

- (void)lt_reset
{

}

@end
