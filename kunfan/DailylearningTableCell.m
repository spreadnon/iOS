//
//  DailylearningTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "DailylearningTableCell.h"

@interface DailylearningTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;


@end
@implementation DailylearningTableCell

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
    return @"DailylearningTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.clipsToBounds = YES;
    [self.contentView addSubview:mainImage];
    self.mainImage = mainImage;
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(132);
    }];
    mainImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    
//    UIView *maskImage = [[UIView alloc] init];
//    maskImage.backgroundColor = [UIColor blackColor];
//    maskImage.alpha = 0.6;
//    [self.contentView addSubview:maskImage];
//    [maskImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.mas_equalTo(0);
//        make.left.mas_equalTo(15);
//        make.width.mas_equalTo(132);
//    }];

    UIImageView *iconImage = [[UIImageView alloc] init];
    [self.contentView addSubview:iconImage];
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(34);
        make.centerX.mas_equalTo(mainImage.mas_centerX).offset(0);
        make.centerY.mas_equalTo(mainImage.mas_centerY).offset(0);
    }];
    iconImage.image = [UIImage imageNamed:@"music_Icon_n"];
    
    UIImageView *lineView = [[UIImageView alloc] init];
    [self.contentView addSubview:lineView];
    lineView.image = [UIImage imageNamed:@"slideLine2_Icon"];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(36/2);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(6);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = KFTextColorOne_h;
    typeLabel.font = kHBFontTwoBold;
    [self.contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lineView.mas_right).offset(8);
        make.centerY.mas_equalTo(lineView.mas_centerY).offset(0);
    }];
    typeLabel.text = @"每日一学";
    
    UIImageView *moreiconView = [[UIImageView alloc] init];
    [self.contentView addSubview:moreiconView];
    moreiconView.image = [UIImage imageNamed:@"more_Icon"];
    [moreiconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(typeLabel.mas_centerY).offset(0);
        make.width.mas_equalTo(6);
        make.height.mas_equalTo(10);
    }];
    
    UILabel *morelabel = [[UILabel alloc] init];
    morelabel.textColor = KFTextColorThree;
    morelabel.font = kHBFontSevenLight;
    [self.contentView addSubview:morelabel];
    [morelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(moreiconView.mas_left).offset(-4);
        make.centerY.mas_equalTo(typeLabel.mas_centerY).offset(0);
    }];
    morelabel.text = @"查看更多";
    
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.numberOfLines = 2;
    textLabel.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
    textLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(18);
        make.top.mas_equalTo(typeLabel.mas_bottom).offset(7);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-25);
    }];
    textLabel.text = @"第89期：如何最大化成都发挥招聘的作用";
    
//    
//    UIImageView *timeIconView = [[UIImageView alloc] init];
//    [self.contentView addSubview:timeIconView];
//    timeIconView.image = [UIImage imageNamed:@"cellTime_Icon"];
//    [timeIconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(mainImage.mas_right).offset(18);
//        make.bottom.mas_equalTo(0);
//        make.width.height.mas_equalTo(11);
//    }];
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFTextColorThree;
    timelabel.font = kHBFontEightLight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(18);
        make.bottom.mas_equalTo(0);
    }];
    timelabel.text = @"编者：王安";
    
    
    
    UILabel *likelabel = [[UILabel alloc] init];
    likelabel.textColor = KFTextColorThree;
    likelabel.font = kHBFontEightLight;
    [self.contentView addSubview:likelabel];
    [likelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
    }];
    likelabel.text = @"11 收藏";
    
    UIImageView *likeIconView = [[UIImageView alloc] init];
    [self.contentView addSubview:likeIconView];
    likeIconView.image = [UIImage imageNamed:@"cellLike_Btn_n"];
    [likeIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(likelabel.mas_left).offset(-4);
        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
        make.width.height.mas_equalTo(12);
    }];

    
    
//    UILabel *feedbacklabel = [[UILabel alloc] init];
//    feedbacklabel.textColor = [UIColor colorWithRed:152/255.0 green:158/255.0 blue:171/255.0 alpha:1.0];
//    feedbacklabel.font = [UIFont systemFontOfSize:11];
//    [self.contentView addSubview:feedbacklabel];
//    [feedbacklabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(likeIconView.mas_left).offset(-15);
//        make.centerY.mas_equalTo(timeIconView.mas_centerY).offset(0);
//    }];
//    feedbacklabel.text = @"9";
//    
//    UIImageView *feedbackIconView = [[UIImageView alloc] init];
//    [self.contentView addSubview:feedbackIconView];
//    feedbackIconView.image = [UIImage imageNamed:@"cellFeedback_Btn"];
//    [feedbackIconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(feedbacklabel.mas_left).offset(-4);
//        make.centerY.mas_equalTo(timeIconView.mas_centerY).offset(0);
//        make.width.mas_equalTo(13);
//        make.height.mas_equalTo(12);
//    }];
    
    
    
//    UIImageView *shareIconView = [[UIImageView alloc] init];
//    [self.contentView addSubview:shareIconView];
//    shareIconView.image = [UIImage imageNamed:@"cellShare_Btn"];
//    [shareIconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(-self.frame.size.width/3);
//        make.bottom.mas_equalTo(0);
////        make.width.height.mas_equalTo(11);
//    }];
    

    
    

}
@end
