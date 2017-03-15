//
//  TopNewsDetailCollectionCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "TopNewsDetailCollectionCell.h"
@interface TopNewsDetailCollectionCell ()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;
@property (nonatomic, weak) UILabel *textLabel;
@end

@implementation TopNewsDetailCollectionCell
+ (NSString *)identifier{
    return @"TopNewsDetailCollectionCell";
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
//        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)createSubviews {
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.clipsToBounds = YES;
    [self.contentView addSubview:mainImage];
    self.mainImage = mainImage;
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    mainImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    
    UIView *maskImage = [[UIView alloc] init];
    maskImage.backgroundColor = [UIColor blackColor];
    maskImage.alpha = 0.6;
    [self.contentView addSubview:maskImage];
    [maskImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];

    
    UIImageView *tagImage = [[UIImageView alloc] init];
    [self.contentView addSubview:tagImage];
    self.tagImage = tagImage;
    [tagImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(8);
    }];
    
    srand((unsigned)time(0));
    int x = arc4random() % 7;
    NSString *iconCount = [NSString stringWithFormat:@"TopNews_Icon%d",x];
    tagImage.image = [UIImage imageNamed:iconCount];
    
    
    UIImageView *topNewsMoreImage = [[UIImageView alloc] init];
    [self.contentView addSubview:topNewsMoreImage];
    [topNewsMoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-20);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(55/2);
        make.height.mas_equalTo(25/2);
    }];
    topNewsMoreImage.image = [UIImage imageNamed:@"TopNewsMore_Icon"];
    
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.numberOfLines = 2;
    typeLabel.textColor = [UIColor whiteColor];
    typeLabel.font = kHBFontSix;
    [self.contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-25);
    }];
    typeLabel.text = @"2017年3月6日结盟帮携手北京电视台在国家会议中心召开交流会";

//80 40 40 50
}
@end
