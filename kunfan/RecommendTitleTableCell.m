//
//  RecommendTitleTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "RecommendTitleTableCell.h"

@interface RecommendTitleTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;
@end

@implementation RecommendTitleTableCell

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
    return @"RecommendTitleTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = KFTextColorOne_h;
    typeLabel.font = kHBFontTwoBold;
    [self.contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
    }];
    typeLabel.text = @"精选推荐";
    
   
    
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

    
}
@end
