//
//  BaseViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)loadView {
    [super loadView];
    if ([self shouldExit]) {
        if ([self.navigationController respondsToSelector:@selector(viewControllers)]) {
            if (self.navigationController && self.navigationController.viewControllers.count != 1) {
                UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                   target:nil action:nil];
                negativeSpacer.width = 4;
                
                UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navBack_Btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(exit)];
                
                self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,leftBarButton, nil];
                
                self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
            }
        }
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (self.view == nil) {
        self.view = [[UIView alloc] init];
    }
    self.view.backgroundColor = [UIColor whiteColor];

}

- (BOOL)shouldExit {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:[UIColor whiteColor]]];
}

- (UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)pushVC:(UIViewController *)dst animated:(BOOL)animated {
    dst.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dst animated:animated];
}

- (void)exit {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
