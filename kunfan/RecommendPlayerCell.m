//
//  RecommendPlayerCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/13.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "RecommendPlayerCell.h"
#import "RecommendPlayerCollectionCell.h"
@interface RecommendPlayerCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(weak,nonatomic)UICollectionView *collectionView;
@property(weak,nonatomic) UILabel *typeLabel;

@end
@implementation RecommendPlayerCell


#pragma mark - Override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubviews];
        //        self.backgroundColor = [UIColor purpleColor];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Public Method
+ (NSString *)identifier {
    return @"RecommendPlayerCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];

    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = KFTextColorOne_h;
    typeLabel.font = kHBFontThreeBold;
    [self.contentView addSubview:typeLabel];
    self.typeLabel = typeLabel;
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
    }];
    typeLabel.text = @"精选列表";
    
    [self setCollectionView];
}



- (void)setCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 14;
    flowLayout.minimumLineSpacing = 15;
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *colleciton = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    colleciton.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _collectionView = colleciton;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[RecommendPlayerCollectionCell class] forCellWithReuseIdentifier:[RecommendPlayerCollectionCell identifier]];
    [self.contentView addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.typeLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RecommendPlayerCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[RecommendPlayerCollectionCell identifier] forIndexPath:indexPath];
//    cell.indexPath = indexPath;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
