//
//  BirthdayViewCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/9.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BirthdayViewCell.h"
@interface BirthdayViewCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end
@implementation BirthdayViewCell


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
    return @"NoticeTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.clipsToBounds = YES;
    [self.contentView addSubview:mainImage];
    self.mainImage = mainImage;
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(45);
    }];
    mainImage.image = [UIImage imageNamed:@"officialNotice_Icon"];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFourMedium;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-50);
    }];
    textLabel.text = @"李娜";
    
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFTextColorThree;
    timelabel.font = kHBFontSix;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textLabel.mas_centerY).offset(0);
        make.right.mas_equalTo(-20);
    }];
    timelabel.text = @"32周岁";
    
    UILabel *likelabel = [[UILabel alloc] init];
    likelabel.textColor = KFTextColorOne_h;
    likelabel.font = kHBFontSeven;
    [self.contentView addSubview:likelabel];
    [likelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.top.mas_equalTo(textLabel.mas_bottom).offset(4);
        make.right.mas_equalTo(-20);
    }];
    likelabel.text = @"2017.03.12";
    
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
