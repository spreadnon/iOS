//
//  HappyBirthdayViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/9.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "HappyBirthdayViewController.h"
#import "BigTitleView.h"
#import "BirthdayViewCell.h"
@interface HappyBirthdayViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) BigTitleView *titleView;

@property (nonatomic, strong,nullable) NSArray *names;
@property(nullable,nonatomic,strong)UIButton *currentBtn;
@property (strong, nonatomic,nullable) NSArray *buttons;
@property(nullable,nonatomic,strong)UIImageView *iconView;
@end

@implementation HappyBirthdayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLayout];
    [self addHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupLayout{
    // tableView
    UITableView *tableView = [[UITableView alloc] init];
    tableView.separatorStyle = UITableViewCellStyleDefault;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    self.tableView = tableView;
    [tableView registerClass:[BirthdayViewCell class] forCellReuseIdentifier:[BirthdayViewCell identifier]];
    
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight + 20);
    [titleView changTitle:@"教师生日" andDetail:@"2017年03月份教师生日"];
    self.titleView = titleView;
    
    [self.tableView setTableHeaderView:titleView];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 40;
    }else{
        return 10;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 40)];
        
        UIView* customView1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 37)];
        customView1.backgroundColor = [UIColor whiteColor];
        [customView addSubview:customView1];

        self.names = [NSArray arrayWithObjects:@"教师",@"家长",nil];
        
        NSMutableArray *btns=[[NSMutableArray alloc]init];
        
        CGFloat lastX=0;
        for (NSInteger i=0; i<self.names.count; i++) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:self.names[i] forState:UIControlStateNormal];
            
            NSString *string=self.names[i];
            
            button.frame=CGRectMake(lastX+14, 0, 50, 25);
            lastX += 14 + 50;
           
            [button setTitleColor:KFTextColorThree forState:UIControlStateNormal];
            [button setTitleColor:KFTextColorOne_h forState:UIControlStateSelected];
            button.titleLabel.font = kHBFontThreeBold;
            [button addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [customView1 addSubview:button];
            
            [btns addObject:button];
            
            if (i==0) {
                button.selected=YES;
                self.currentBtn=button;
            }
            
        }
        self.buttons=btns;
        UIButton *lastBtn=[self.buttons lastObject];
        
        UIImageView *lineView = [[UIImageView alloc] init];
        lineView.backgroundColor = KFLineColorThree;
        [customView1 addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.currentBtn.mas_bottom).offset(10);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(2);
        }];
        
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.frame = CGRectMake(self.currentBtn.center.x - 12, self.currentBtn.center.y + 20, 24, 6);
        [customView1 addSubview:iconView];
        iconView.image = [UIImage imageNamed:@"slideLine_Icon"];
        self.iconView = iconView;



        
        return customView;

    }else{
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 0.01)];
        customView.backgroundColor = [UIColor clearColor];
        return customView;

    }
}

-(void)headerBtnClick:(UIButton *)headerBtn
{
    NSInteger currentPage=[self.buttons indexOfObjectIdenticalTo:headerBtn];
    [self setCurrentheaderbtn:currentPage];
    if (currentPage == 0) {
        [self.titleView changTitle:@"教师生日" andDetail:@"2017年03月份教师生日"];
    }else{
        [self.titleView changTitle:@"家长生日" andDetail:@"2017年03月份家长生日"];
    }

}

-(void)setCurrentheaderbtn:(NSInteger)index
{
    self.currentBtn.selected=NO;
    self.currentBtn=self.buttons[index];
    self.currentBtn.selected=YES;
    
    
    [UIView animateWithDuration:0.8 delay:0.1 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:0 animations:^{
        self.iconView.frame = CGRectMake(self.currentBtn.center.x - 12, self.currentBtn.center.y + 20, 24, 6);
    } completion:^(BOOL finished) {
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置 添加好友
    BirthdayViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[BirthdayViewCell identifier] forIndexPath:indexPath];
    if (!cell) {
        cell = [[BirthdayViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[BirthdayViewCell identifier]];
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
