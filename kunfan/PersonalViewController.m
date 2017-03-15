//
//  PersonalViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/4.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "PersonalViewController.h"

#import "PersonalTableCell.h"

@interface PersonalViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *homeItems;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayout];
    [self addHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Private Method

- (void)setupLayout {
    
    
    
    // tableView
    UITableView *tableView = [[UITableView alloc] init];
//    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellStyleDefault;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-49);
    }];
    self.tableView = tableView;
    [tableView registerClass:[PersonalTableCell class] forCellReuseIdentifier:[PersonalTableCell identifier]];
    
}

- (void)addHeaderView{
    
    UIView *headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, kScreenWidth, 380/2);
    
    // 头像
    UIImageView *userImage = [[UIImageView alloc] init];
    //userImage.contentMode = UIViewContentModeScaleAspectFill;
    
    /*方案1:性能差
     userImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
     userImage.layer.cornerRadius = 45;
     userImage.layer.masksToBounds = YES;
     */
    
    [headView addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(180/2);
        make.top.mas_equalTo(116/2 - 50);
        make.centerX.mas_equalTo(0);
    }];
    userImage.image =  [self imageWithCornerRadius:45];
    
    
    UILabel *userName = [[UILabel alloc] init];
    userName.textColor = [UIColor colorWithRed:70/255.0 green:76/255.0 blue:86/255.0 alpha:1.0];
    userName.font = [UIFont boldSystemFontOfSize:20];
    [headView addSubview:userName];
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userImage.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
    }];
    userName.text = @"王校长";

    
    [self.tableView setTableHeaderView:headView];
//    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(380/2);
//        make.top.mas_equalTo(0);
//        make.left.right.mas_equalTo(0);
//    }];

}

- (UIImage *)imageWithCornerRadius:(CGFloat)radius {
    
    CGSize size = CGSizeMake(90.0f, 90.0f);
    
    CGRect rect = (CGRect){0.f, 0.f, size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    UIImageView *userImage = [[UIImageView alloc] init];
    userImage.contentMode = UIViewContentModeScaleAspectFill;
    userImage.clipsToBounds = YES;
    userImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    [userImage.image drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section  ||  1 == section) {
        return 3;
    }
    else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 0.01;
    }else
        return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
  
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, self.view.frame.size.width, 45)];
    customView.backgroundColor = [UIColor clearColor];
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置 添加好友
    PersonalTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[PersonalTableCell identifier] forIndexPath:indexPath];
    if (!cell) {
        cell = [[PersonalTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[PersonalTableCell identifier]];
    }
    
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            [cell updataCell:@"邀请好友" andImage:@"friends_Icon"];
        }else if (1 == indexPath.row){
            [cell updataCell:@"我的积分" andImage:@"integral_Icon"];
        }
        else if (2 == indexPath.row){
            [cell updataCell:@"我的收藏" andImage:@"myLike_Icon"];
        }
    }else if(1 == indexPath.section){
        if (0 == indexPath.row) {
            [cell updataCell:@"给我们评分" andImage:@"score_Icon"];
        }else if (1 == indexPath.row){
            [cell updataCell:@"联系我们" andImage:@"call_Icon"];
        }
        else if (2 == indexPath.row){
            [cell updataCell:@"设置" andImage:@"setting_Icon"];
        }
    }else{
        if (0 == indexPath.row) {
            [cell updataCell:@"录制课程" andImage:@"video_Icon"];
        }
    }
    //        [cell updataCell];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (0 == indexPath.section) {
        return;
    }
    else if (1 == indexPath.section) {
//        //活动cell
//        if (self.homeActivity.datas.count > 0) {
//            NSTimeInterval delay = 0.5f;
//            
//            HBHomeActivityDataItem *actItem = self.homeActivity.datas[indexPath.row];
//            UIViewController *destVc = [[HBJumpManager sharedJumpManager] destVcWithJumpLink:actItem.custom];
//            HBJumpType jumpType = [HBJumpManager sharedJumpManager].jumpType;
//            
//            [[HBZhugeioManager sharedZhugeioManager] trackEventWithName:@"我的 - 动态活动入口 - 点击"
//                                                                   dict:@{@"入口文案":actItem.title?actItem.title:@"",
//                                                                          @"URL":actItem.custom?actItem.custom:@""}];
//            
//            
//            if (!destVc) {// 如果没有控制器，则不响应跳转
//                return;
//            }
//            
//            [self pushVC:destVc animated:YES];
//        }
    }
}
#pragma mark - HBHomePagePhotoCellDelegate
- (void)pushAlbumVC{
//    HBDynamicController *vc = [[HBDynamicController alloc] initWithUserId:userId userInfo:[self getUserInfo]];
//    vc.selectIndex = 1;
//    [self pushVC:vc animated:YES];
}

- (void)pushDynamicVC{
   
}

@end
