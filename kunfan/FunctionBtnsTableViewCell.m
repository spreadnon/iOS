//
//  FunctionBtnsTableViewCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "FunctionBtnsTableViewCell.h"
#import "FunctionCollectionCell.h"

@interface FunctionBtnsTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) UIImageView *mainIconImage;
@property (nonatomic, weak) UILabel *typeLabel;
@property (nonatomic, weak) UILabel *typeLabel1;
@property (nonatomic, weak) UIView *lineView;
@property(weak,nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong,nullable) NSArray *datas;

@end
@implementation FunctionBtnsTableViewCell

#pragma mark - Override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubviews];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Public Method
+ (NSString *)identifier {
    return @"FunctionBtnsTableViewCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    self.names = [NSArray arrayWithObjects:@"昨日",@"今日",@"本周",@"本月",nil];
    self.datas = [NSArray arrayWithObjects:@"最新报名 10 人",@"接待记录 8 人",@"意见建议 21 人",@"请假信息 3 人",@"教师生日 5 人",@"家长生日 11 人",@"查看日报",@"制定措施",@"拨打电话",nil];
    
    NSMutableArray *btns=[[NSMutableArray alloc]init];
    
    CGFloat lastX=0;
    for (NSInteger i=0; i<self.names.count; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:self.names[i] forState:UIControlStateNormal];
        
        NSString *string=self.names[i];
        
        button.frame=CGRectMake(lastX+13, 0, 50, 25);
        lastX += 13 + 40;
        
        [button setTitleColor:KFTextColorThree forState:UIControlStateNormal];
        [button setTitleColor:KFTextColorOne_h forState:UIControlStateSelected];
        button.titleLabel.font = kHBFontTwoBold;
        [button addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        
        [btns addObject:button];
        
        if (i==0) {
            button.selected=YES;
            self.currentBtn=button;
        }
        
    }
    self.buttons=btns;
    UIButton *lastBtn=[self.buttons lastObject];
    
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.frame = CGRectMake(self.currentBtn.center.x - 12, self.currentBtn.center.y + 20, 24, 6);
    [self.contentView addSubview:iconView];
    iconView.image = [UIImage imageNamed:@"slideLine_Icon"];
    self.iconView = iconView;

    
    
    [self setCollectionView];
}

-(void)headerBtnClick:(UIButton *)headerBtn
{
    NSInteger currentPage=[self.buttons indexOfObjectIdenticalTo:headerBtn];
    [self setCurrentheaderbtn:currentPage];
    if (self.delegate) {
        [self.delegate pageCurrentBtn:currentPage];
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

- (void)setCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width /4, 80);
    flowLayout.scrollDirection  = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *colleciton = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    colleciton.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _collectionView = colleciton;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[FunctionCollectionCell class] forCellWithReuseIdentifier:[FunctionCollectionCell identifier]];
    [self.contentView addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_bottom).offset(10);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FunctionCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FunctionCollectionCell identifier] forIndexPath:indexPath];
    cell.datas = self.datas;
    cell.indexPath = indexPath;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.homepageBlock) {
        self.homepageBlock(indexPath);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    FunctionCollectionCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell showMaskView];
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    FunctionCollectionCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell hideMaskView];
}


@end
