//
//  BigTitleView.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BigTitleView.h"

@interface BigTitleView ()

@property (nonatomic, weak) UILabel *bigTitlelabel;
@property (nonatomic, weak) UILabel *detaillabel;

@end

@implementation BigTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

#pragma mark - Private method
- (void)createSubViews {
    UILabel *bigTitlelabel = [[UILabel alloc] init];
    bigTitlelabel.textColor = KFTextColorOne_h;
    bigTitlelabel.font = kHBFontOneBold;
    [self addSubview:bigTitlelabel];
    self.bigTitlelabel = bigTitlelabel;
    [bigTitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
    }];
    bigTitlelabel.text = @"";
    
    UILabel *detaillabel = [[UILabel alloc] init];
    detaillabel.textColor = KFTextColorOne_h;
    detaillabel.font = kHBFontFiveLight;
    [self addSubview:detaillabel];
    self.detaillabel = detaillabel;
    [detaillabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(23);
        make.top.mas_equalTo(bigTitlelabel.mas_bottom).offset(2);
    }];
    detaillabel.text = @"";
}


- (void)changTitle:(NSString *)title andDetail:(NSString *)detail{
    self.bigTitlelabel.text = title;
    self.detaillabel.text = detail;
}


@end
