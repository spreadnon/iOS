//
//  AllPlayerTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/13.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "AllPlayerTableCell.h"


@interface AllPlayerTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;


@end
@implementation AllPlayerTableCell

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
    return @"AllPlayerTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.layer.cornerRadius = 3;
    mainImage.layer.masksToBounds = YES;
    mainImage.clipsToBounds = YES;
    [self.contentView addSubview:mainImage];
    self.mainImage = mainImage;
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(106/2);
        make.height.mas_equalTo(118/2);
    }];
    mainImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    
    UIImageView *playingImage = [[UIImageView alloc] init];
    playingImage.image = [UIImage imageNamed:@"playing_Icon"];
    [self.contentView addSubview:playingImage];
    [playingImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.right.mas_equalTo(-20);
        make.height.width.mas_equalTo(33/2);
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
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.numberOfLines = 2;
    typeLabel.textColor = KFTextColorOne_h;
    typeLabel.font = kHBFontSixLight;
    [self.contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(13);
        make.top.mas_equalTo(mainImage.mas_top).offset(0);
        make.right.mas_equalTo(-20);
        
    }];
    typeLabel.text = @"第89期：如何最大化成都发挥招聘的作用？";
    
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.textColor = KFTextColorOne_h;
    namelabel.font = kHBFontEightLight;
    [self.contentView addSubview:namelabel];
    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(13);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(typeLabel.mas_bottom).offset(2);
    }];
    namelabel.text = @"编者：王安     时长：3'20''      234 人听过";

    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFTextColorThree;
    timelabel.font = kHBFontNineLight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(13);
        make.right.mas_equalTo(-50);
        make.bottom.mas_equalTo(mainImage.mas_bottom).offset(0);
    }];
    timelabel.text = @"2017/03/23";
    
//    UIImageView *moreiconView = [[UIImageView alloc] init];
//    [self.contentView addSubview:moreiconView];
//    moreiconView.image = [UIImage imageNamed:@"more_Icon"];
//    [moreiconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(-20);
//        make.centerY.mas_equalTo(typeLabel.mas_centerY).offset(0);
//        make.width.mas_equalTo(6);
//        make.height.mas_equalTo(10);
//    }];
//    
//    UILabel *morelabel = [[UILabel alloc] init];
//    morelabel.textColor = KFTextColorThree;
//    morelabel.font = kHBFontSevenLight;
//    [self.contentView addSubview:morelabel];
//    [morelabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(moreiconView.mas_left).offset(-4);
//        make.centerY.mas_equalTo(typeLabel.mas_centerY).offset(0);
//    }];
//    morelabel.text = @"查看更多";
//    
//    
//    UILabel *textLabel = [[UILabel alloc] init];
//    textLabel.numberOfLines = 2;
//    textLabel.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
//    textLabel.font = [UIFont systemFontOfSize:16];
//    [self.contentView addSubview:textLabel];
//    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(mainImage.mas_right).offset(18);
//        make.top.mas_equalTo(typeLabel.mas_bottom).offset(7);
//        make.right.mas_equalTo(-20);
//        make.bottom.mas_equalTo(-25);
//    }];
//    textLabel.text = @"第89期：如何最大化成都发挥招聘的作用";
    
    //
    //    UIImageView *timeIconView = [[UIImageView alloc] init];
    //    [self.contentView addSubview:timeIconView];
    //    timeIconView.image = [UIImage imageNamed:@"cellTime_Icon"];
    //    [timeIconView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(mainImage.mas_right).offset(18);
    //        make.bottom.mas_equalTo(0);
    //        make.width.height.mas_equalTo(11);
    //    }];
    
//    UILabel *timelabel = [[UILabel alloc] init];
//    timelabel.textColor = KFTextColorThree;
//    timelabel.font = kHBFontEightLight;
//    [self.contentView addSubview:timelabel];
//    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(mainImage.mas_right).offset(18);
//        make.bottom.mas_equalTo(0);
//    }];
//    timelabel.text = @"编者：王安";
    
    
//    
//    UILabel *likelabel = [[UILabel alloc] init];
//    likelabel.textColor = KFTextColorThree;
//    likelabel.font = kHBFontEightLight;
//    [self.contentView addSubview:likelabel];
//    [likelabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(-20);
//        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
//    }];
//    likelabel.text = @"11 收藏";
//    
//    UIImageView *likeIconView = [[UIImageView alloc] init];
//    [self.contentView addSubview:likeIconView];
//    likeIconView.image = [UIImage imageNamed:@"cellLike_Btn_n"];
//    [likeIconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(likelabel.mas_left).offset(-4);
//        make.centerY.mas_equalTo(timelabel.mas_centerY).offset(0);
//        make.width.height.mas_equalTo(12);
//    }];
    
    
}


@end
