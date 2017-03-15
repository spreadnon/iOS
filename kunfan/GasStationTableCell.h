//
//  GasStationTableCell.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HBHomepageBlock)(NSIndexPath* index);


@interface GasStationTableCell : UITableViewCell
@property (nonatomic, copy) HBHomepageBlock homepageBlock;
+ (NSString *)identifier;
@end
