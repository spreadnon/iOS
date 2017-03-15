//
//  HBDefine.h
//  hotbody
//
//  Created by Belle on 16/5/11.
//  Copyright © 2016年 Beijing Fitcare inc. All rights reserved.
//

#ifndef HBDefine_h
#define HBDefine_h

// 判断系统
#define kLessThanIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] < 8)
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9)
#define IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0f)
#define IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)
#define IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f)

// 判断机型
#define HBIsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

// 屏幕适配
#ifndef kScreenWidth
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#endif

#ifndef kScreenHeight
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#endif

#ifndef kScreenScale
#define kScreenScale    [UIScreen mainScreen].scale
#endif

#define kWidthScale ([UIScreen mainScreen].bounds.size.width/375.0)
#define kHeightScale ([UIScreen mainScreen].bounds.size.height/667.0)
#define kHBAdjustSize(value) (value * kWidthScale)

#define kDividerHeight (1 / [UIScreen mainScreen].scale)

// 颜色
// 获得RGB颜色
#define HBColorA(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define HBColor(r, g, b) HBColorA(r, g, b ,1.0f)
#define UIColorFromHEXA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#ifndef UIColorFromHEX
#define UIColorFromHEX(rgbValue) UIColorFromHEXA(rgbValue, 1.0f)
#endif

#define nilOrJSONObjectForKey(JSON_, KEY_) [[JSON_ objectForKey:KEY_] isKindOfClass:[NSNull class]] ? nil : [JSON_ objectForKey:KEY_]

// break-if 宏
#ifndef BREAK_IF
#define BREAK_IF(cond) if(cond) break
#endif

#ifdef DEBUG
#define HBLog(format, ...) \
do { \
NSLog(@"<%@ : %d : %s>-: %@", \
[[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
__LINE__, \
__FUNCTION__, \
[NSString stringWithFormat:format, ##__VA_ARGS__]); \
} while(0)
#else
#define HBLog(...)
#endif

#define DebugLog(fmt, ...) NSLog((@"debug: \n ------------- \n[文件名:%s]\n""[函数名:%s]\n""[行号:%d]\n[标记语句:%@]\n -------------"), __FILE__, __FUNCTION__, __LINE__, fmt,##__VA_ARGS__);

// 强、弱指针转换
#define WeakObj(obj) autoreleasepool{} __weak typeof(obj) obj##Weak = obj;
#define StrongObj(obj) autoreleasepool{} __strong typeof(obj) obj = obj##Weak;
//#define WS __weak __typeof(&*self)weakSelf = self;

// 导航条上按钮距离屏幕边缘的间距适配
#define HBFixNavigationMargin(margin) (iPhone6Plus ? (margin) - 4 : (margin))
#define kHBNavigationBarMargin  HBFixNavigationMargin(-6.0f);
#define kHBTextNavigationBarMargin  HBFixNavigationMargin(-4.0f);

#define kBigTitleViewHeight     65

#pragma mark - 常用色值
/********************************************常用色值********************************************/

//#define kHBGreyColorOne                                 0x333333
//#define kHBRedColorNormal                               HBColor(221, 75, 57)
//#define kHBMainBlueColorBinary                          UIColorHex(1e8cbe)




#define KFBlueColor                                     UIColorFromHEX(0x0932FF)  //主色 蓝
#define KFBlueColor_1                                   UIColorFromHEX(0x8BB8FA)  //副色 副蓝
#define KFBlueColor_2                                   UIColorFromHEX(0xCAD1D9)  //副色 副蓝


#define KFGreenColor                                    UIColorFromHEX(0x00EAFD)  //主色 绿
#define KFGreenColor_1                                  UIColorFromHEX(0x01A599)  //副色 副绿

#define KFRedColor                                      UIColorFromHEX(0xFF5A5F) //主色 红

#define KFTextColorOne_h                                UIColorFromHEX(0x474747)  //文字:大标题 选中
#define KFTextColorOne_n                                UIColorFromHEX(0xCAD1D9)  //文字:大标题 未选中

#define KFTextColorTwo                                  UIColorFromHEX(0x757575)  //文字: detail文本
#define KFTextColorThree                                UIColorFromHEX(0x989EAB)   //文字: 时间·副标题

#define KFLineColorThree                                UIColorFromHEX(0xF4F4F4)   //line






#pragma mark - 常用字体字号
/********************************************常用字体字号********************************************/
/*
PingFangSC-Ultralight   超超细
PingFangSC-Thin         超细
PingFangSC-Light        细
PingFangSC-Regular      常规
PingFangSC-Medium       粗
PingFangSC-Semibold     超粗
 */


#define kHBFontOneBold                                  [UIFont fontWithName:@"PingFangSC-Semibold" size:30]
#define kHBFontTwoBold                                  [UIFont fontWithName:@"PingFangSC-Semibold" size:20]
#define kHBFontThreeBold                                [UIFont fontWithName:@"PingFangSC-Semibold" size:18]
#define kHBFontFour                                     [UIFont fontWithName:@"PingFangSC-Regular" size:16]
#define kHBFontFourBold                                     [UIFont fontWithName:@"PingFangSC-Regular" size:16]
#define kHBFontFourMedium                                     [UIFont fontWithName:@"PingFangSC-Medium" size:16]
#define kHBFontFive                                     [UIFont fontWithName:@"PingFangSC-Regular" size:15]
#define kHBFontFiveBold                                [UIFont fontWithName:@"PingFangSC-Semibold" size:15]
#define kHBFontSix                                      [UIFont fontWithName:@"PingFangSC-Regular" size:14]
#define kHBFontSeven                                    [UIFont fontWithName:@"PingFangSC-Regular" size:13]
#define kHBFontEight                                    [UIFont fontWithName:@"PingFangSC-Regular" size:12]
#define kHBFontNine                                     [UIFont fontWithName:@"PingFangSC-Regular" size:11]

#define kHBFontFiveLight                                     [UIFont fontWithName:@"PingFangSC-Light" size:15]
#define kHBFontSixLight                                      [UIFont fontWithName:@"PingFangSC-Light" size:14]
#define kHBFontSevenLight                                    [UIFont fontWithName:@"PingFangSC-Light" size:13]
#define kHBFontEightLight                                    [UIFont fontWithName:@"PingFangSC-Light" size:12]
#define kHBFontNineLight                                     [UIFont fontWithName:@"PingFangSC-Light" size:11]
#define kHBFontTenLight                                     [UIFont fontWithName:@"PingFangSC-Light" size:10]
#define kHBFontElevenLight                                     [UIFont fontWithName:@"PingFangSC-Light" size:9]



#define kFontLightWithSize(s)                            [UIFont fontWithName:@"PingFangSC-Light" size:s]
#define kFontThinWithSize(s)                             [UIFont fontWithName:@"PingFangSC-Thin" size:s]
#define kFontRegularWithSize(s)                          [UIFont fontWithName:@"PingFangSC-Regular" size:s]
#define kFontUltralightWithSize(s)                       [UIFont fontWithName:@"PingFangSC-Ultralight" size:s]
#define kFontBoldWithSize(s)                             [UIFont fontWithName:@"PingFangSC-Semibold" size:s]
#define kFontMediumWithSize(s)                           [UIFont fontWithName:@"PingFangSC-Medium" size:s]

#define kFontWithCustom(name,s)                          [UIFont fontWithName:name size:s]

#define kHBFontBoldSize(s)                              [UIFont boldSystemFontOfSize:s]
#define kHBFontSystemSize(s)                            [UIFont systemFontOfSize:s]
#endif /* HBDefine_h */
