//
//  SearchViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/14.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSearchBar];
}

- (void)setupSearchBar{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 105, 30)];//allocate titleView
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
    searchBar.frame = CGRectMake(0, 0, kScreenWidth - 105, 30);
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
    
    
    UIBarButtonItem *leftNegativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
    leftNegativeSpacer.width = 20;
    UIButton *cleanNoticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanNoticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [cleanNoticeBtn setTitle:@"清除" forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFTextColorThree forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFBlueColor forState:UIControlStateHighlighted];
    cleanNoticeBtn.titleLabel.font = kHBFontSix;
    [cleanNoticeBtn addTarget:self action:@selector(canelBtn)
             forControlEvents:UIControlEventTouchUpInside];
    cleanNoticeBtn.frame = CGRectMake(10, 10, 40, 40);
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:cleanNoticeBtn];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:menuButton,leftNegativeSpacer, nil];
    
}
- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)canelBtn{

}

@end
