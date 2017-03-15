//
//  VisitTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/9.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "VisitTableCell.h"
@interface VisitTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end
@implementation VisitTableCell


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
        make.top.mas_equalTo(12);
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
    timelabel.font = kHBFontEightLight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textLabel.mas_centerY).offset(0);
        make.right.mas_equalTo(-20);
    }];
    timelabel.text = @"2017.03.12";
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.textColor = KFTextColorOne_h;
    namelabel.font = kHBFontEightLight;
    [self.contentView addSubview:namelabel];
    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.top.mas_equalTo(textLabel.mas_bottom).offset(4);
        make.right.mas_equalTo(-20);
    }];
    namelabel.text = @"姓名：王永驻";
    
    UILabel *phonelabel = [[UILabel alloc] init];
    phonelabel.textColor = KFTextColorOne_h;
    phonelabel.font = kHBFontEightLight;
    [self.contentView addSubview:phonelabel];
    [phonelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.top.mas_equalTo(namelabel.mas_bottom).offset(4);
        make.right.mas_equalTo(-20);
    }];
    phonelabel.text = @"电话：18692938382";
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KFLineColorThree;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    UIImageView *yesImage = [[UIImageView alloc] init];
    [self.contentView addSubview:yesImage];
    [yesImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(namelabel.mas_bottom).offset(-4);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(15);
    }];
    yesImage.image = [UIImage imageNamed:@"yes_Icon"];

    
}


//- (void)createSubviews {
//    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
//    
//    UIView *lineView = [[UIView alloc]init];
//    lineView.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
//    [self.contentView addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.mas_equalTo(0);
//        make.left.mas_equalTo(80);
//        make.width.mas_equalTo(4);
//    }];
//    
//    UIImageView *cellCircleImage = [[UIImageView alloc] init];
//    [self.contentView addSubview:cellCircleImage];
//    [cellCircleImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(lineView.mas_centerX).offset(0);
//        make.centerY.mas_equalTo(0);
//        make.width.height.mas_equalTo(20);
//    }];
//    cellCircleImage.image = [UIImage imageNamed:@"cellCircle_icon"];
//    
//    UIImageView *mainImage = [[UIImageView alloc] init];
//    mainImage.contentMode = UIViewContentModeScaleAspectFill;
//    mainImage.clipsToBounds = YES;
//    [self.contentView addSubview:mainImage];
//    self.mainImage = mainImage;
//    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(0);
//        make.left.mas_equalTo(cellCircleImage.mas_centerX).offset(20);
//        make.width.height.mas_equalTo(45);
//    }];
//    mainImage.image = [UIImage imageNamed:@"officialNotice_Icon"];
//    
//    UILabel *textLabel = [[UILabel alloc] init];
//    textLabel.textColor = KFTextColorOne_h;
//    textLabel.font = kHBFontFourMedium;
//    [self.contentView addSubview:textLabel];
//    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(mainImage.mas_right).offset(20);
//        make.top.mas_equalTo(mainImage.mas_top).offset(0);
//    }];
//    textLabel.text = @"接待人：李娜";
//    
//    
//    UILabel *likelabel = [[UILabel alloc] init];
//    likelabel.textColor = KFTextColorOne_h;
//    likelabel.font = kHBFontThreeBold;
//    [self.contentView addSubview:likelabel];
//    [likelabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(mainImage.mas_top).offset(0);
//        make.left.mas_equalTo(20);
//    }];
//    likelabel.text = @"03.12";
//    
//    UILabel *yearLabel = [[UILabel alloc] init];
//    yearLabel.textColor = KFTextColorThree;
//    yearLabel.font = kHBFontSix;
//    [self.contentView addSubview:yearLabel];
//    [yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(likelabel.mas_bottom).offset(4);
//        make.right.mas_equalTo(likelabel.mas_right).offset(0);
//    }];
//    yearLabel.text = @"2017";
//    
//    
//    UILabel *nameLabel = [[UILabel alloc] init];
//    nameLabel.textColor = KFTextColorThree;
//    nameLabel.font = kHBFontSevenLight;
//    [self.contentView addSubview:nameLabel];
//    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(textLabel.mas_bottom).offset(4);
//        make.left.mas_equalTo(mainImage.mas_right).offset(20);
//    }];
//    nameLabel.text = @"姓名：王永驻";
//    
//    UILabel *phoneLabel = [[UILabel alloc] init];
//    phoneLabel.textColor = KFTextColorThree;
//    phoneLabel.font = kHBFontSevenLight;
//    [self.contentView addSubview:phoneLabel];
//    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(textLabel.mas_bottom).offset(4);
//        make.left.mas_equalTo(nameLabel.mas_right).offset(20);
//    }];
//    phoneLabel.text = @"电话：18692938382";
//
//    
//    
//    
//}
@end
