//
//  BaseViewController.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)pushVC:(UIViewController *)dst animated:(BOOL)animated;
- (void)exit;
//- (void)toast:(NSString *)text withColor:(UIColor *)color;
//- (void)toastTopPadding:(NSString *)text withColor:(UIColor *)color;
@end
