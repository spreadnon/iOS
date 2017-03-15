//
//  PlayerTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/13.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "PlayerTableCell.h"

@implementation PlayerTableCell

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
    return @"PlayerTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIImageView *userImage = [[UIImageView alloc] init];
    userImage.contentMode = UIViewContentModeScaleAspectFill;
    //方案1:性能差
     userImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
     userImage.layer.cornerRadius = 5;
     userImage.layer.masksToBounds = YES;
    [self.contentView addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(180/2);
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
    }];
    
    UIImageView *gradientImage = [[UIImageView alloc] init];
    gradientImage.contentMode = UIViewContentModeScaleAspectFill;
    gradientImage.layer.cornerRadius = 5;
    gradientImage.layer.masksToBounds = YES;
    gradientImage.backgroundColor = [UIColor clearColor];
    //方案1:性能差
    gradientImage.image = [UIImage imageNamed:@"gradientView"];
    [self.contentView addSubview:gradientImage];
    [gradientImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(180/2);
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
    }];

    UILabel *userName = [[UILabel alloc] init];
    userName.textColor = [UIColor whiteColor];
    userName.font = kHBFontNineLight;
    [gradientImage addSubview:userName];
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-18);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];
    userName.text = @"王校长";
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.textColor = KFGreenColor;
    timeLabel.font = kHBFontElevenLight;
    [gradientImage addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-7);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];
    timeLabel.text = @"2017/02/12";


    

    //创建进度条
    UIProgressView *progressView=[[UIProgressView alloc]init];
    
    //设置进度条的尺寸
//    progressView.frame=CGRectMake(20, 300, 280, 30);
    
    //设置进度条的风格
    progressView.progressViewStyle = UIProgressViewStyleBar;
    progressView.progressViewStyle = UIProgressViewStyleDefault;
    
    //进度条当前的进度
    progressView.progress = 0.5;
    
    //进度条走过的颜色
    progressView.progressTintColor = KFTextColorOne_h;
    
    //进度条轨道的颜色
    progressView.trackTintColor = KFLineColorThree;
    
    //进度条前进的的图片
//    progressView.progressImage = [UIImage imageNamed:@"GasStation_Icon"];
//    
//    //进度条轨道的图片
//    progressView.trackImage = [UIImage imageNamed:@"circle_Icon_n"];
    
    //设置当前进度
    [progressView setProgress:0.3 animated:YES];
    
    //添加进度条
    [self.contentView addSubview:progressView];
    progressView.layer.cornerRadius = 3.5;
    progressView.layer.masksToBounds = YES;
    
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.height.mas_equalTo(7);
        make.bottom.mas_equalTo(-83);
    }];
    //添加定时器
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Progress:) userInfo:progressView repeats:YES];
    
    UILabel *startLabel = [[UILabel alloc] init];
    startLabel.textColor = KFTextColorOne_h;
    startLabel.font = kHBFontEight;
    [self.contentView addSubview:startLabel];
    [startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(progressView.mas_centerY).offset(0);
        make.right.mas_equalTo(progressView.mas_left).offset(-3);
        make.left.mas_equalTo(20);
    }];
    startLabel.text = @"3:47";
    
    UILabel *endLabel = [[UILabel alloc] init];
    endLabel.textAlignment = NSTextAlignmentRight;
    endLabel.textColor = KFTextColorOne_h;
    endLabel.font = kHBFontEight;
    [self.contentView addSubview:endLabel];
    [endLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(progressView.mas_centerY).offset(0);
        make.right.mas_equalTo(-20);
        make.left.mas_equalTo(progressView.mas_left).offset(-3);
    }];
    endLabel.text = @"5:47";
    
    
    
    UIButton *thePauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    thePauseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [thePauseBtn setImage:[UIImage imageNamed:@"thePause_Btn"] forState:UIControlStateNormal];
    [thePauseBtn setImage:[UIImage imageNamed:@"thePause_Btn"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:thePauseBtn];
    [thePauseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(progressView.mas_bottom).offset(24);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(24);
    }];

    
    UIButton *previousBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    previousBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [previousBtn setImage:[UIImage imageNamed:@"thePrevious_Btn"] forState:UIControlStateNormal];
    [previousBtn setImage:[UIImage imageNamed:@"thePrevious_Btn"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:previousBtn];
    [previousBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(thePauseBtn.mas_centerY).offset(0);
        make.right.mas_equalTo(thePauseBtn.mas_left).offset(-50);
        make.height.mas_equalTo(37/2);
        make.width.mas_equalTo(31/2);
    }];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [nextBtn setImage:[UIImage imageNamed:@"theNext_Btn"] forState:UIControlStateNormal];
    [nextBtn setImage:[UIImage imageNamed:@"theNext_Btn"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(thePauseBtn.mas_centerY).offset(0);
        make.left.mas_equalTo(thePauseBtn.mas_right).offset(50);
        make.height.mas_equalTo(37/2);
        make.width.mas_equalTo(31/2);
    }];

    
}

//定时器触发事件
-(void)Progress:(NSTimer *)timer
{
    UIProgressView *progressView = timer.userInfo;
    //增加进度条当前进度
    progressView.progress+=0.02;
    
}
@end
