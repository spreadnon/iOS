//
//  TopNewsTableViewCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "TopNewsTableViewCell.h"
#import "TopNewsDetailCollectionCell.h"
@interface TopNewsTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(weak,nonatomic)UICollectionView *collectionView;

@end
@implementation TopNewsTableViewCell

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
    return @"TopNewsTableViewCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIImageView *moreiconView = [[UIImageView alloc] init];
    [self.contentView addSubview:moreiconView];
    moreiconView.image = [UIImage imageNamed:@"slideLine1_Icon"];
    [moreiconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(6);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = KFTextColorOne_h;
    typeLabel.font = kHBFontTwoBold;
    [self.contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(moreiconView.mas_right).offset(8);
        make.centerY.mas_equalTo(moreiconView.mas_centerY).offset(0);
    }];
    typeLabel.text = @"结盟头条";
    
    [self setCollectionView];
}



- (void)setCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 15;
    flowLayout.minimumLineSpacing = 15;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 80, 100);
    flowLayout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *colleciton = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    colleciton.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _collectionView = colleciton;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[TopNewsDetailCollectionCell class] forCellWithReuseIdentifier:[TopNewsDetailCollectionCell identifier]];
    [self.contentView addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(43);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TopNewsDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TopNewsDetailCollectionCell identifier] forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
   
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
