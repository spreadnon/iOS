//
//  DailylearnDetailController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/13.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "DailylearnDetailController.h"
#import "BigTitleView.h"
#import "AllPlayerTableCell.h"
#import "PlayerTableCell.h"
#import "RecommendPlayerCell.h"
#import "AllPlayerTitleTableCell.h"

#define NAVBAR_CHANGE_POINT 50
@interface DailylearnDetailController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation DailylearnDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupLayout];
    
    self.navigationItem.title = @"正在播放：第38期";
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor] andFont:kHBFontFiveBold];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = KFTextColorOne_h;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha] andFont:kHBFontFiveBold];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0] andFont:kHBFontFiveBold];
    }
}



#pragma mark - Private Method
- (void)setupNavigationBar {
    
    UIButton *cleanNoticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanNoticeBtn.frame = CGRectMake(0, 0, 17, 17);
    cleanNoticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [cleanNoticeBtn setImage:[UIImage imageNamed:@"navLike_Btn"] forState:UIControlStateNormal];
    [cleanNoticeBtn setImage:[UIImage imageNamed:@"navLike_Btn"] forState:UIControlStateHighlighted];
    [cleanNoticeBtn addTarget:self action:@selector(likeBtn)
             forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:cleanNoticeBtn];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 20;
    

    
    UIButton *NoticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NoticeBtn.frame = CGRectMake(0, 0, 17, 17);
    NoticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NoticeBtn setImage:[UIImage imageNamed:@"navShare_Btn"] forState:UIControlStateNormal];
    [NoticeBtn setImage:[UIImage imageNamed:@"navShare_Btn"] forState:UIControlStateHighlighted];
    [NoticeBtn addTarget:self action:@selector(shareBtn)
             forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuButton1 = [[UIBarButtonItem alloc] initWithCustomView:NoticeBtn];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:menuButton,negativeSpacer,menuButton1, nil];
}

#pragma mark - Private Method

- (void)setupLayout {
    
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
        make.bottom.mas_equalTo(0);
    }];
    self.tableView = tableView;
    [tableView registerClass:[AllPlayerTableCell class] forCellReuseIdentifier:[AllPlayerTableCell identifier]];
    [tableView registerClass:[PlayerTableCell class] forCellReuseIdentifier:[PlayerTableCell identifier]];
    [tableView registerClass:[RecommendPlayerCell class] forCellReuseIdentifier:[RecommendPlayerCell identifier]];
    [tableView registerClass:[AllPlayerTitleTableCell class] forCellReuseIdentifier:[AllPlayerTitleTableCell identifier]];
    
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"第38期" andDetail:@"正在播放：如何最大化程度发挥招聘"];
    
    [self.tableView setTableHeaderView:titleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section || 1 == section || 2 == section) {
        return 1;
    }else{
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (0 == section) {
//        return 35;
//    }else{
        return 10;
//    }
    
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
    if (0 == indexPath.section) {
        return 220;
    }else if (1 == indexPath.section){
        return 150;
    }
    else if (2 == indexPath.section){
        return 50;
    }else{
        return 78;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 220;
    }else if (1 == indexPath.section){
        return 150;
    }
    else if (2 == indexPath.section){
        return 50;
    }else{
        return 78;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        
        //设置 添加好友
        PlayerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[PlayerTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[PlayerTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[PlayerTableCell identifier]];
        }
        
        return cell;
    }
    else if (1 == indexPath.section) {
        
        //设置 添加好友
        RecommendPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:[RecommendPlayerCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[RecommendPlayerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[RecommendPlayerCell identifier]];
        }
        
        return cell;
    }
    else if (2 == indexPath.section) {
        
        //设置 添加好友
        AllPlayerTitleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[AllPlayerTitleTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[AllPlayerTitleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AllPlayerTitleTableCell identifier]];
        }
        
        return cell;

    }
       else{
    
        
        //设置 添加好友
        AllPlayerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[AllPlayerTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[AllPlayerTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AllPlayerTableCell identifier]];
        }
        
        return cell;
    }
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (0 == indexPath.section) {
        return;
    }
    else if (1 == indexPath.section) {
    }
}

- (void)likeBtn{

}

- (void)shareBtn{
    
}

@end
