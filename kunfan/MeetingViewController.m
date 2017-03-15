//
//  MeetingViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/4.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "MeetingViewController.h"
#import "BigTitleView.h"
@interface MeetingViewController ()

@end

@implementation MeetingViewController

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
    [titleView changTitle:@"参加会议" andDetail:@"暂时没有会议"];
    
    UILabel *detaillabel1 = [[UILabel alloc] init];
    detaillabel1.textColor = [UIColor colorWithRed:71/255.0 green:71/255.0 blue:71/255.0 alpha:1.0];
    detaillabel1.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:detaillabel1];
    [detaillabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
    }];
    detaillabel1.text = @"没有发现新的会议可以参加";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
