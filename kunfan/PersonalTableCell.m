//
//  PersonalTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "PersonalTableCell.h"

@interface PersonalTableCell()
@property (nonatomic, weak) UIImageView *mainIconImage;
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *typeLabel;
@property (nonatomic, weak) UIView *lineView;

@end

@implementation PersonalTableCell

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
    return @"PersonalTableCell";
}

- (void)createSubviews {
//    self.backgroundColor = [UIColor whiteColor];
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    UIImageView *mainIconImage = [[UIImageView alloc] init];
    [self.contentView addSubview:mainIconImage];
    self.mainIconImage = mainIconImage;
    [mainIconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50/2);
        make.centerY.mas_equalTo(0);
    }];
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = KFTextColorOne_h;
    typeLabel.font = kHBFontFive;
    [self.contentView addSubview:typeLabel];
    self.typeLabel = typeLabel;
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainIconImage.mas_right).offset(10);
        make.centerY.mas_equalTo(0);
    }];

    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    iconView.image = [UIImage imageNamed:@"cellMore_Icon"];
    self.iconView = iconView;
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-40/2);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(12/2);
        make.height.mas_equalTo(22/2);
    }];
    
    
    UIImageView *lineView = [[UIImageView alloc] init];
    lineView.backgroundColor = KFLineColorThree;
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(34/2);
        make.bottom.mas_equalTo(-0.5);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];

}

- (void)updataCell:(NSString*)name andImage:(NSString*)image{
    self.typeLabel.text = name;
    self.mainIconImage.image = [UIImage imageNamed:image];
}













































@end
