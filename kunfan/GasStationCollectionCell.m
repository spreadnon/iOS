//
//  GasStationCollectionCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "GasStationCollectionCell.h"
@interface GasStationCollectionCell ()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;
@property (nonatomic, weak) UILabel *textLabel;
@end

@implementation GasStationCollectionCell
+ (NSString *)identifier{
    return @"GasStationCollectionCell";
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
//                self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)createSubviews {
//    UIImageView *mainImage = [[UIImageView alloc] init];
//    mainImage.contentMode = UIViewContentModeScaleAspectFill;
//    mainImage.clipsToBounds = YES;
//    [self.contentView addSubview:mainImage];
//    self.mainImage = mainImage;
//    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.mas_equalTo(0);
//    }];
//    mainImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
//    
//    UIView *maskImage = [[UIView alloc] init];
//    maskImage.backgroundColor = [UIColor blackColor];
//    maskImage.alpha = 0.6;
//    [self.contentView addSubview:maskImage];
//    [maskImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.mas_equalTo(0);
//    }];
//    
//    
    UIView *bgview = [[UIView alloc] init];
    [self.contentView addSubview:bgview];
    bgview.layer.cornerRadius = 5;
    bgview.layer.masksToBounds = YES;
    bgview.layer.borderWidth = 1;
    bgview.layer.borderColor = [[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0] CGColor];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    
    UIImageView *topNewsMoreImage = [[UIImageView alloc] init];
    [self.contentView addSubview:topNewsMoreImage];
    [topNewsMoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(13);
        make.right.mas_equalTo(-13);
        make.width.height.mas_equalTo(9);
    }];
    topNewsMoreImage.image = [UIImage imageNamed:@"GasStation_Icon"];
    
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = KFTextColorOne_h;
    typeLabel.font = kHBFontSix;
    [self.contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(13);
        make.top.mas_equalTo(30);
    }];
    typeLabel.text = @"最新报名";
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.textColor = KFTextColorThree;
    detailLabel.font = kHBFontEightLight;
    [self.contentView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(typeLabel.mas_bottom).offset(2);
        make.left.mas_equalTo(13);
    }];
    detailLabel.text = @"言传身教和生活实践";
   
}

@end
