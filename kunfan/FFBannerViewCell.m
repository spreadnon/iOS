//
//  FFBannerViewCell.m
//  FFBannerView
//
//  Created by Fan on 16/10/10.
//  Copyright © 2016年 Fan. All rights reserved.
//

#import "FFBannerViewCell.h"

@implementation FFBannerViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
//    self.imageView.layer.cornerRadius = 40;
//    self.imageView.layer.masksToBounds = YES;
//    self.imageView.frame = self.bounds;
}
@end
