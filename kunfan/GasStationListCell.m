//
//  GasStationListCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "GasStationListCell.h"
@interface GasStationListCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation GasStationListCell

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
    return @"GasStationListCell";
}

- (void)createSubviews {
    //    self.backgroundColor = [UIColor whiteColor];
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.clipsToBounds = YES;
    [self.contentView addSubview:mainImage];
    self.mainImage = mainImage;
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(264/2);
        make.height.mas_equalTo(100);
    }];
    mainImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.numberOfLines = 2;
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFour;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(-13);
    }];
    textLabel.text = @"第89期：如何最大化成都发挥招聘的作用?";
    
//    UIImageView *timeIconView = [[UIImageView alloc] init];
//    [self.contentView addSubview:timeIconView];
//    timeIconView.image = [UIImage imageNamed:@"cellTime_Icon"];
//    [timeIconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(mainImage.mas_right).offset(20);
//        make.bottom.mas_equalTo(-5);
//        make.width.height.mas_equalTo(11);
//    }];
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFTextColorThree;
    timelabel.font = kHBFontEightLight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.bottom.mas_equalTo(-5);
    }];
    timelabel.text = @"编者：李教授";
    
    UILabel *likelabel = [[UILabel alloc] init];
    likelabel.textColor = KFTextColorThree;
    likelabel.font = kHBFontEightLight;
    [self.contentView addSubview:likelabel];
    [likelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
    }];
    likelabel.text = @"11";
    
    UIImageView *likeIconView = [[UIImageView alloc] init];
    [self.contentView addSubview:likeIconView];
    likeIconView.image = [UIImage imageNamed:@"cellLike_Btn_n"];
    [likeIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(likelabel.mas_left).offset(-4);
        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
        make.width.height.mas_equalTo(12);
    }];
    
    
    
    UILabel *feedbacklabel = [[UILabel alloc] init];
    feedbacklabel.textColor = KFTextColorThree;
    feedbacklabel.font = kHBFontEightLight;
    [self.contentView addSubview:feedbacklabel];
    [feedbacklabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(likeIconView.mas_left).offset(-15);
        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
    }];
    feedbacklabel.text = @"9";
    
    UIImageView *feedbackIconView = [[UIImageView alloc] init];
    [self.contentView addSubview:feedbackIconView];
    feedbackIconView.image = [UIImage imageNamed:@"cellFeedback_Btn"];
    [feedbackIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(feedbacklabel.mas_left).offset(-4);
        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
        make.width.mas_equalTo(13);
        make.height.mas_equalTo(12);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KFLineColorThree;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];

}
@end
