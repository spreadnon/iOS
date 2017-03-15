//
//  BaseNavigationViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBar.tintColor = [UIColor blackColor];
//    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    self.navigationBar.translucent = NO;
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
}


#pragma mark - UIGestureRecognizerDelegate

//修复有水平方向滚动的ScrollView时边缘返回手势失效的问题
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}


//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    
//    if (viewController.navigationController.viewControllers.count) {
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    
////    [self.navigationController pushViewController:[BLWrapViewController wrapViewControllerWithViewController:viewController] animated:animated];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
