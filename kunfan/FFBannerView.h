//
//  FFBannerView.h
//  FFBannerView
//
//  Created by Fan on 16/10/10.
//  Copyright © 2016年 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class FFBannerView;

typedef enum {
    FFPageControlStyleRight,
    FFPageControlStyleLeft,
    FFPageControlStyleMiddle
}FFPageControlStyle;

@protocol FFBannerViewDelegate <NSObject>
/*
 *  FFBannerView通过代理实现点击事件
 *  
 *  @param  index   点击当前banner位置
 */
- (void)ffBannerViewClickCurrentIndex:(NSInteger)index;

@end


@interface FFBannerView : UIView
/*
 *  FFPageControl对齐方式：左、中、右
 */
@property(nonatomic, assign) FFPageControlStyle pageControlStyle;

/*
 *  默认banner图片,当图片加载不出来时显示
 */
@property(nonatomic, strong) UIImage *placeHolder;

/*
 *  加载本地图片数组
 */
@property(nonatomic, strong) NSMutableArray *locationImageArr;

/*
 *  加载网络图片数组
 */
@property(nonatomic, strong) NSMutableArray *netWorkImageArr;

/*
 *  Banner循环时间
 */
@property(nonatomic, assign) NSTimeInterval timeInterval;

/*
 *  FFBannerViewDelegate
 */
@property(nonatomic, weak) id <FFBannerViewDelegate> delegate;

/**
 *  加载本地banner图片资源
 *
 *  @param  frame   设置banner的frame
 *  @param  locationImageArray  本地图片资源数组
 *
 *  @return FFBannerView对象
 */
+ (instancetype)bannerViewWithFrame:(CGRect)frame locationImageArray:(NSArray *)locationImageArray;

/**
 *  加载网络banner图片资源
 *
 *  @param  frame   设置banner的frame
 *  @param  netWorkImageArray  网络图片资源链接数组
 *
 *  @return FFBannerView对象
 */
+ (instancetype)bannerViewWithFrame:(CGRect)frame netWorkImageArray:(NSArray *)netWorkImageArray placeHolderImage:(UIImage *)placeHolderImage;
@end
