//
//  FunctionBtnsTableViewCell.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pageHeaderBtnDelegate <NSObject>

-(void)pageCurrentBtn:(NSInteger)current;

@end

typedef void(^HBHomepageBlock)(NSIndexPath* _Nullable index);

@interface FunctionBtnsTableViewCell : UITableViewCell

@property(nonatomic,weak)id<pageHeaderBtnDelegate>_Nullable delegate;

@property (nonatomic, copy) HBHomepageBlock _Nullable homepageBlock;
@property(nullable,nonatomic,strong)UIButton *currentBtn;
@property (strong, nonatomic,nullable) NSArray *buttons;
@property (nonatomic, strong,nullable) NSArray *names;
@property(nullable,nonatomic,strong)UIImageView *iconView;
+ ( NSString * _Nullable )identifier;
@end
