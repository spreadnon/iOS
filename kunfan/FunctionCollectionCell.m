//
//  FunctionCollectionCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "FunctionCollectionCell.h"

static const CGFloat kMaskAlpha = 0.3f;
@interface FunctionCollectionCell ()
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, weak) UILabel *dataLabel;
@property (nonatomic, weak) UIView *maskView;

@end

@implementation FunctionCollectionCell
+ (NSString *)identifier{
    return @"FunctionCollectionCell";
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"data1_Icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"data1_Icon"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(headerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    button.userInteractionEnabled = NO;
    [self.contentView addSubview:button];
    self.button = button;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.centerX.mas_equalTo(0);
    }];
    
    UILabel *dataLabel = [[UILabel alloc] init];
    dataLabel.textColor = KFTextColorThree;
    dataLabel.font = kHBFontEight;
    [self addSubview:dataLabel];
    self.dataLabel = dataLabel;
    [dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.centerX.mas_equalTo(0);
    }];
    self.dataLabel.text = @"";
    
    UIView *maskView = [[UIView alloc] init];
    maskView.backgroundColor = HBColorA(232, 232, 232, kMaskAlpha);
    maskView.hidden = YES;
    [self.contentView addSubview:maskView];
    _maskView = maskView;
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.mas_equalTo(0);
    }];
    
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    
    NSString *imageName = [NSString stringWithFormat:@"data%ld_Icon",(long)_indexPath.row+1];
    [self.button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.button setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    
   self.dataLabel.text = _datas[indexPath.row];
}

- (void)setDatas:(NSArray *)datas{
    _datas = datas;
}

-(void)headerBtnClick{

}

#pragma mark - Public Method
- (void)showMaskView {
    _maskView.hidden = NO;
}

- (void)hideMaskView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _maskView.hidden = YES;
    });
}

@end
