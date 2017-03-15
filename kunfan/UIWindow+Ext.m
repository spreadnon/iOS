//
//  UIWindow+Ext.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/4.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "UIWindow+Ext.h"
#import "BaseTabBarController.h"
#import "LoginViewController.h"
#import "BaseNavigationViewController.h"
@implementation UIWindow (Ext)
- (void)chooseRootViewController {
//    if ([[HBUser currentUser] isLoggedIn]) {
//        if (nil != [Util sharedInstance].launchShortcutItemId || nil != [Util sharedInstance].spotlightTag) {
//            [self showTabbarVc];
//        } else {
//            if ([Util sharedInstance].shownFlashVc) {
                [self showTabbarVc];
//            } else {
//                [self showSplashScreen];
//            }
//        }
//    } else {
//        [self showLoginVc];
//    }
    
    
//    [self showLoginVc];
}

- (void)animateToTabbarVc {
    UIViewController *rootVc = self.rootViewController;
    
    if ([rootVc isKindOfClass:[BaseTabBarController class]]) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    BaseTabBarController *tabbarVc = [[BaseTabBarController alloc] init];
    // 推送、闪屏或魔窗跳转时有0.5秒延时，此处动画必须小于0.5秒，否则tabbar会有问题
    [UIView transitionFromView:weakSelf.rootViewController.view toView:tabbarVc.view duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        weakSelf.rootViewController = tabbarVc;
    }];
}

- (void)showLoginVc {
    // 登录之后不再出闪屏
    //[Util sharedInstance].shownFlashVc = YES;
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    LoginViewController *welcomeVc = [[LoginViewController alloc] init];
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:welcomeVc];
    window.rootViewController = nav;
}

- (void)showSplashScreen{

}

- (void)showTabbarVc {
    // 不带feed out 效果
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    NSArray *subViews = window.subviews;
    [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    BaseTabBarController *tabbarVc = [[BaseTabBarController alloc] init];
    window.rootViewController = tabbarVc;
    
    // 带feed out 效果
    /*
     UIWindow *window = [UIApplication sharedApplication].keyWindow;
     __block NSArray *subViews = window.subviews;
     
     HBTabBarController *tabbarVc = [[HBTabBarController alloc] init];
     window.rootViewController = tabbarVc;
     
     @WeakObj(self);
     [UIView animateWithDuration:0.5f animations:^{
     [selfWeak animatedDismissWithSubviews:subViews];
     } completion:^(BOOL finished) {
     window.rootViewController = tabbarVc;
     [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
     }];*/
}
@end
