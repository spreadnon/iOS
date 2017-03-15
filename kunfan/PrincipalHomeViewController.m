//
//  PrincipalHomeViewController.m
//  
//
//  Created by 坤凡 on 2017/3/4.
//
//

#import "PrincipalHomeViewController.h"
#import "BannerTableViewCell.h"
#import "FunctionBtnsTableViewCell.h"
#import "TopNewsTableViewCell.h"
#import "DailylearningTableCell.h"
#import "GasStationTableCell.h"
#import "RecommendTitleTableCell.h"
#import "RecommendTableCell.h"

#import "NoticeViewController.h"
#import "DailyAttendanceViewController.h"
#import "GasStationListController.h"
#import "HappyBirthdayViewController.h"
#import "VisitViewController.h"
#import "DailylearnDetailController.h"
#import "SearchViewController.h"

@interface PrincipalHomeViewController ()<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation PrincipalHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"结盟帮";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigationBar];
    [self setupLayout];
    [self setupSearchBar];
    
    }

- (void)setupSearchBar{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 100, 30)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.tintColor;
    [titleView setBackgroundColor:[UIColor clearColor]];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.barStyle = UIBarStyleDefault;
    UIImage* searchBarBg = [Util GetImageWithColor:KFLineColorThree andHeight:30];
    //设置背景图片
    [searchBar setBackgroundImage:searchBarBg];
    //设置背景色
    [searchBar setBackgroundColor:[UIColor clearColor]];
    //设置文本框背景
    [searchBar setSearchFieldBackgroundImage:searchBarBg forState:UIControlStateNormal];
    searchBar.delegate = self;
    searchBar.placeholder = @"搜索文章 视频 课程 会议";
    searchBar.frame = CGRectMake(0, 0, kScreenWidth - 100, 30);
    searchBar.layer.cornerRadius = 18;
    searchBar.layer.masksToBounds = YES;
    //修改placeholder 文字颜色
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    searchField.textColor = KFTextColorThree;
    [searchField setValue:KFTextColorThree forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:kHBFontSeven forKeyPath:@"_placeholderLabel.font"];
    //修改放大镜
    UIView *searchBgIconView = [[UIView alloc]init];
    searchBgIconView.frame = CGRectMake(0, 0, 20 , 15);
    UIImage *image = [UIImage imageNamed:@"search_Icon"];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:image];
    iconView.frame = CGRectMake(0, 0, image.size.width , image.size.height);
    [searchBgIconView addSubview:iconView];
    searchField.leftView = searchBgIconView;
    [titleView addSubview:searchBar];
    
    //Set to titleView
    self.navigationItem.titleView = titleView;

}
- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    SearchViewController *vc = [[SearchViewController alloc]init];
    [self pushVC:vc animated:NO];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    SearchViewController *vc = [[SearchViewController alloc]init];
    [self pushVC:vc animated:NO];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Private Method
- (void)setupNavigationBar {
    UIBarButtonItem *leftNegativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
    leftNegativeSpacer.width = 0;
    
    // 签到按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 17, 17);
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backBtn setImage:[UIImage imageNamed:@"sign_Btn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"sign_Btn"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(signBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftNegativeSpacer,leftBarItem, nil];
    
    // 通知按钮
    UIButton *noticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noticeBtn.frame = CGRectMake(0, 0, 33/2, 37/2);
    noticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [noticeBtn setImage:[UIImage imageNamed:@"notice_Btn"] forState:UIControlStateNormal];
    [noticeBtn setImage:[UIImage imageNamed:@"notice_Btn"] forState:UIControlStateHighlighted];
    [noticeBtn addTarget:self action:@selector(noticeBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:noticeBtn];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:leftNegativeSpacer,rightBarItem, nil];

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
        make.bottom.mas_equalTo(-49);
    }];
    self.tableView = tableView;
    [tableView registerClass:[BannerTableViewCell class] forCellReuseIdentifier:[BannerTableViewCell identifier]];
    [tableView registerClass:[FunctionBtnsTableViewCell class] forCellReuseIdentifier:[FunctionBtnsTableViewCell identifier]];
    [tableView registerClass:[TopNewsTableViewCell class] forCellReuseIdentifier:[TopNewsTableViewCell identifier]];
    [tableView registerClass:[DailylearningTableCell class] forCellReuseIdentifier:[DailylearningTableCell identifier]];
    [tableView registerClass:[GasStationTableCell class] forCellReuseIdentifier:[GasStationTableCell identifier]];
    [tableView registerClass:[RecommendTitleTableCell class] forCellReuseIdentifier:[RecommendTitleTableCell identifier]];
    [tableView registerClass:[RecommendTableCell class] forCellReuseIdentifier:[RecommendTableCell identifier]];
    
    
}



#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (6 == section) {
        return 10;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 0.01;
    }
    else if (1 == section){
        return 30;
    }
    else if ( 2 == section ){
        return 30;
    }
    else if ( 6 == section){
        return 20;
    }
    else{
        return 55;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] init];
    customView.backgroundColor = [UIColor clearColor];
    if (0 == section) {
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 0.01);
    }else{
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 30);
    }
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else if(1 == indexPath.section){
        return 310;
    }else if(2 == indexPath.section){
        return 130;
    }else if(3 == indexPath.section){
        return 100;
    }else if(4 == indexPath.section){
        return 210;
    }else if(5 == indexPath.section){
        return 28;
    }else if(6 == indexPath.section){
        return 105;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else if(1 == indexPath.section){
        return 310;
    }else if(2 == indexPath.section){
        return 130;
    }else if(3 == indexPath.section){
        return 100;
    }else if(4 == indexPath.section){
        return 210;
    }else if(5 == indexPath.section){
        return 28;
    }else if(6 == indexPath.section){
        return 105;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        //banner
        BannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[BannerTableViewCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[BannerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[BannerTableViewCell identifier]];
        }
        
        return cell;
    } else if (1 == indexPath.section){
        FunctionBtnsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FunctionBtnsTableViewCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[FunctionBtnsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[FunctionBtnsTableViewCell identifier]];
        }
        @WeakObj(self);
        cell.homepageBlock = ^(NSIndexPath* index) {
            if (0 == index.row || 1 == index.row) {
                VisitViewController *vc = [[VisitViewController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }else if (2 == index.row || 3 == index.row) {
                HappyBirthdayViewController *vc = [[HappyBirthdayViewController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }
            else if (4 == index.row || 5 == index.row) {
                HappyBirthdayViewController *vc = [[HappyBirthdayViewController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }else if (6 == index.row) {
                HappyBirthdayViewController *vc = [[HappyBirthdayViewController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }else if (7 == index.row) {
                HappyBirthdayViewController *vc = [[HappyBirthdayViewController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }else if (8 == index.row) {
                HappyBirthdayViewController *vc = [[HappyBirthdayViewController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }
            else {
                return ;
            }
        };
        
        return cell;
    }
    else if (2 == indexPath.section){
        TopNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TopNewsTableViewCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[TopNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[TopNewsTableViewCell identifier]];
        }
        
        return cell;
    }else if (3 == indexPath.section){
        DailylearningTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[DailylearningTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[DailylearningTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DailylearningTableCell identifier]];
        }
        
        return cell;
    }else if (4 == indexPath.section){
        GasStationTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[GasStationTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[GasStationTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[GasStationTableCell identifier]];
        }
        
        @WeakObj(self);
        cell.homepageBlock = ^(NSIndexPath* index) {
            NSLog(@"asdasdasd");
            GasStationListController *vc = [[GasStationListController alloc]init];
            [selfWeak pushVC:vc animated:YES];
        };
        
        return cell;
    }else if (5 == indexPath.section){
        RecommendTitleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[RecommendTitleTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[RecommendTitleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[RecommendTitleTableCell identifier]];
        }
        
        return cell;
    }
    else if (6 == indexPath.section){
        RecommendTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[RecommendTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[RecommendTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[RecommendTableCell identifier]];
        }
        
        return cell;
    }
    else{
        UITableViewCell *cell = [UITableViewCell new];
        return cell;

    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (3 == indexPath.section) {
        DailylearnDetailController *vc = [[DailylearnDetailController alloc]init];
        [self pushVC:vc animated:YES];
    }
}

- (void)signBtn{
    DailyAttendanceViewController *vc = [[DailyAttendanceViewController alloc]init];
    [self pushVC:vc animated:YES];
}

- (void)noticeBtn{
    NoticeViewController *vc = [[NoticeViewController alloc]init];
    [self pushVC:vc animated:YES];
}




@end
