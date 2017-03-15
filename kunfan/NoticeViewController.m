//
//  NoticeViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "NoticeViewController.h"
#import "BigTitleView.h"
#import "NoticeTableCell.h"
@interface NoticeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupLayout];

}

#pragma mark - Private Method
- (void)setupNavigationBar {

    UIButton *cleanNoticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanNoticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [cleanNoticeBtn setTitle:@"全部标记已读" forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFTextColorThree forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFBlueColor forState:UIControlStateHighlighted];
    cleanNoticeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [cleanNoticeBtn addTarget:self action:@selector(noticeBtn)
     forControlEvents:UIControlEventTouchUpInside];
    cleanNoticeBtn.frame = CGRectMake(10, 10, 100, 40);
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:cleanNoticeBtn];
    self.navigationItem.rightBarButtonItem = menuButton;
}

#pragma mark - Private Method

- (void)setupLayout {
//    BigTitleView *titleView = [[BigTitleView alloc]init];
//    [self.view addSubview:titleView];
//    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.top.mas_equalTo(0);
//        make.width.mas_equalTo(self.view.frame.size.width);
//        make.height.mas_equalTo(100);
//    }];
//    [titleView changTitle:@"收件箱" andDetail:@"您没有未读信息"];
//    
//    UILabel *detaillabel1 = [[UILabel alloc] init];
//    detaillabel1.textColor = [UIColor colorWithRed:71/255.0 green:71/255.0 blue:71/255.0 alpha:1.0];
//    detaillabel1.font = [UIFont boldSystemFontOfSize:15];
//    [self.view addSubview:detaillabel1];
//    [detaillabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.centerY.mas_equalTo(0);
//    }];
//    detaillabel1.text = @"您已经读完所有消息了";
    
    
    // tableView
    UITableView *tableView = [[UITableView alloc] init];
    tableView.separatorStyle = UITableViewCellStyleDefault;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-49);
    }];
    self.tableView = tableView;
    [tableView registerClass:[NoticeTableCell class] forCellReuseIdentifier:[NoticeTableCell identifier]];
 
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"收件箱" andDetail:@"您没有未读信息"];
    
    [self.tableView setTableHeaderView:titleView];
}

//officialNotice_Icon
//RecommendNotice_Icon
//SystemNotice_Icon
- (void)noticeBtn{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 35;
    }else{
        return 10;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 35)];
    customView.backgroundColor = [UIColor clearColor];
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置 添加好友
    NoticeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[NoticeTableCell identifier] forIndexPath:indexPath];
    if (!cell) {
        cell = [[NoticeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NoticeTableCell identifier]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (0 == indexPath.section) {
        return;
    }
    else if (1 == indexPath.section) {
    }
}


@end
