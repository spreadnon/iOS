//
//  FFPageControl.h
//  FFBannerView
//  
//  Created by Fan on 16/10/10.
//  Copyright © 2016年 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFPageControl : UIControl

@property(nonatomic, strong) Class dotViewClass;

/**
 *  UIImage to represent a dot, if custom dot view not extends FFAbstracDotView and has set dotImage.
 */
@property(nonatomic, strong) UIImage *dotImage;

/**
 *  UIImage to represent a dot as current page, if custom dot view not extends FFAbstracDotView and has set currentDotImage.
 */
@property(nonatomic, strong) UIImage *currentDotImage;

/**
 *  Set dot view Color. Default is WhiteColor.
 */
@property(nonatomic, strong) UIColor *dotColor;

/**
 *  Set current dot view Color. Default is GrayColor.
 */
@property(nonatomic, strong) UIColor *currentDotColor;

/**
 *  Set dot size. Default is (8, 8).
 */
@property(nonatomic) CGSize dotSize;

/**
 *  Set gap between dot and dot. Default is 8.
 */
@property(nonatomic) double gapBetweenDots;

/**
 *  Number of pages for control. Default is 0.
 */
@property (nonatomic) NSInteger numberOfPages;

/**
 *  Current page on which control is active. Default is 0.
 */
@property (nonatomic) NSInteger currentPage;

/**
 *  When only one page set whether to hide. Default is NO.
 */
@property(nonatomic) BOOL hidesForSinglePage;

/**
 *  Return the minimum size with total page count
 *  
 *  @param pageCount   numbers of dots that will display.
 *
 *  @return CGSize  the minimum size
 */
- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;
@end
