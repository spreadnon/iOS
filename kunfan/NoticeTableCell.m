//
//  NoticeTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/9.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "NoticeTableCell.h"
@interface NoticeTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation NoticeTableCell

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
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(45);
    }];
    mainImage.image = [UIImage imageNamed:@"officialNotice_Icon"];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.numberOfLines = 2;
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFourMedium;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-50);
    }];
    textLabel.text = @"结盟帮团队";
    
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFTextColorThree;
    timelabel.font = kHBFontEightLight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textLabel.mas_centerY).offset(0);
        make.right.mas_equalTo(-20);
    }];
    timelabel.text = @"2017.03.04";
    
    UILabel *likelabel = [[UILabel alloc] init];
    likelabel.textColor = KFTextColorOne_h;
    likelabel.font = kHBFontSeven;
    [self.contentView addSubview:likelabel];
    [likelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(20);
        make.top.mas_equalTo(textLabel.mas_bottom).offset(4);
        make.right.mas_equalTo(-20);
    }];
    likelabel.text = @"欢迎加入结盟帮，在这里我们会提供您更加专业的服务";
    
}
@end
