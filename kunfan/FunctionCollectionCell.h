//
//  FunctionCollectionCell.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionCollectionCell : UICollectionViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSString *nameStr;
@property (nonatomic, strong) NSArray *datas;

+ (NSString *)identifier;
- (void)showMaskView;
- (void)hideMaskView;
@end
