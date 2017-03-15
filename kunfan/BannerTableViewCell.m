//
//  BannerTableViewCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BannerTableViewCell.h"
#import "FFBannerView.h"

@interface BannerTableViewCell() <FFBannerViewDelegate>

@end

@implementation BannerTableViewCell

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
    return @"BannerTableViewCell";
}

- (void)createSubviews{

    [self setupLocalBannerImageView];
//    [self setupNetWorkBannerImageView];
}

/**
 *  加载本地图片Banner
 */
- (void)setupLocalBannerImageView
{
    NSArray *array = @[@"patterns_asana-2.jpg", @"patterns_asana-2.jpg", @"patterns_asana-2.jpg", @"patterns_asana-2.jpg", @"patterns_asana-2.jpg"];
    
    FFBannerView *bannerVew = [FFBannerView bannerViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 350/2) locationImageArray:array];
    bannerVew.timeInterval = 3.0;
    bannerVew.pageControlStyle = FFPageControlStyleMiddle;
    bannerVew.delegate = self;
    [self.contentView addSubview:bannerVew];
}

/**
 *  加载网络图片Banner
 */
- (void)setupNetWorkBannerImageView
{
    NSArray *array = @[@"http://i3.download.fd.pchome.net/t_960x600/g1/M00/07/09/oYYBAFMv8q2IQHunACi90oB0OHIAABbUQAAXO4AKL3q706.jpg",
                       @"http://images.weiphone.net/attachments/photo/Day_120308/118871_91f6133116504086ed1b82e0eb951.jpg",
                       @"http://benyouhuifile.it168.com/forum/macos/attachments/month_1104/110425215921926a173e0f728e.jpg",
                       @"http://benyouhuifile.it168.com/forum/macos/attachments/month_1104/1104241737046031b3a754f783.jpg"];
    
    FFBannerView *bannerVew = [FFBannerView bannerViewWithFrame:CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, 200) netWorkImageArray:array placeHolderImage:nil];
    bannerVew.timeInterval = 2.0;
    bannerVew.pageControlStyle = FFPageControlStyleMiddle;
    bannerVew.delegate = self;
    [self.contentView addSubview:bannerVew];
}

#pragma mark - FFBannerViewDelegate
- (void)ffBannerViewClickCurrentIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld个banner", index+1);
}
@end
