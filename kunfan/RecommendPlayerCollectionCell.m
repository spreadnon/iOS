//
//  RecommendPlayerCollectionCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/13.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "RecommendPlayerCollectionCell.h"
@interface RecommendPlayerCollectionCell ()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;
@property (nonatomic, weak) UILabel *textLabel;
@end
@implementation RecommendPlayerCollectionCell
+ (NSString *)identifier{
    return @"RecommendPlayerCollectionCell";
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
    
    UIImageView *topNewsMoreImage = [[UIImageView alloc] init];
    [self.contentView addSubview:topNewsMoreImage];
    topNewsMoreImage.contentMode = UIViewContentModeScaleAspectFill;
    topNewsMoreImage.layer.cornerRadius = 5;
    topNewsMoreImage.layer.masksToBounds = YES;
    [topNewsMoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.height.mas_equalTo(100);
    }];
    topNewsMoreImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    
    UIImageView *gradientImage = [[UIImageView alloc] init];
    gradientImage.contentMode = UIViewContentModeScaleAspectFill;
    gradientImage.layer.cornerRadius = 5;
    gradientImage.layer.masksToBounds = YES;
    gradientImage.backgroundColor = [UIColor clearColor];
    //方案1:性能差
    gradientImage.image = [UIImage imageNamed:@"gradientView"];
    [topNewsMoreImage addSubview:gradientImage];
    [gradientImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.mas_equalTo(0);
    }];

    
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = [UIColor whiteColor];
    typeLabel.font = kHBFontTenLight;
    [self.contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
    }];
    typeLabel.text = @"第85期";
    
    
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.numberOfLines = 2;
    detailLabel.textColor = [UIColor whiteColor];
    detailLabel.font = kHBFontNine;
    [self.contentView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-25);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    detailLabel.text = @"如何最大化成都发挥招聘的作用？";
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = kHBFontTenLight;
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
    }];
    nameLabel.text = @"编者：杨松";
    
    UIImageView *playingImage = [[UIImageView alloc] init];
    playingImage.image = [UIImage imageNamed:@"playing_Icon"];
    [gradientImage addSubview:playingImage];
    [playingImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(6);
        make.right.mas_equalTo(-6);
        make.height.width.mas_equalTo(33/2);
    }];

    
}
@end
