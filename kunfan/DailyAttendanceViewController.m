//
//  DailyAttendanceViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "DailyAttendanceViewController.h"
#import "BigTitleView.h"
@interface DailyAttendanceViewController ()

@end

@implementation DailyAttendanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BigTitleView *titleView = [[BigTitleView alloc]init];
    [self.view addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.view.frame.size.width);
        make.height.mas_equalTo(100);
    }];
    [titleView changTitle:@"每日签到" andDetail:@"抱歉暂无签到信息"];
    
    UILabel *detaillabel1 = [[UILabel alloc] init];
    detaillabel1.textColor = [UIColor colorWithRed:71/255.0 green:71/255.0 blue:71/255.0 alpha:1.0];
    detaillabel1.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:detaillabel1];
    [detaillabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
    }];
    detaillabel1.text = @"您还没有签到信息";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
