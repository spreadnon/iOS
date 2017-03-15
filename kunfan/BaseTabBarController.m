//
//  BaseTabBarController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationViewController.h"

#import "PrincipalHomeViewController.h"
#import "MeetingViewController.h"
#import "PersonalViewController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabbar];
    [self createAllChildVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupTabbar {
    self.tabBar.translucent = YES;
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:202.0/255.0 green:209.0/255.0 blue:217.0/255.0 alpha:1.0], NSForegroundColorAttributeName, [UIFont systemFontOfSize:10], NSFontAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:9.0/255.0 green:50.0/255.0 blue:255.0/255.0 alpha:1.0],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10], NSFontAttributeName, nil]forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
}

- (void)createAllChildVc {
    PrincipalHomeViewController *principalVc = [[PrincipalHomeViewController alloc] init];
    BaseNavigationViewController *principalNav = [[BaseNavigationViewController alloc] initWithRootViewController:principalVc];
    principalNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"principal_Tabbar_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"principal_Tabbar_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //principalNav.tabBarItem.badgeValue=@"12";
    
    MeetingViewController *meetingVc  = [[MeetingViewController alloc]init];
    BaseNavigationViewController *meetingNav = [[BaseNavigationViewController alloc] initWithRootViewController:meetingVc];
    meetingNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"会议" image:[[UIImage imageNamed:@"meeting_Tabbar_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"meeting_Tabbar_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    PersonalViewController *personalVc = [[PersonalViewController alloc]init];
    BaseNavigationViewController *personalNav = [[BaseNavigationViewController alloc] initWithRootViewController:personalVc];
    personalNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"personal_Tabbar_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"personal_Tabbar_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = @[principalNav, meetingNav, personalNav];
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if ([item.title isEqualToString:@"首页"]) {
        
    } else if ([item.title isEqualToString:@"会议"]) {
        
    } else if ([item.title isEqualToString:@"我的"]) {
        
    }
}

@end
