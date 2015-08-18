//
//  Constants.h
//  Doctor
//
//  Created by JackWu on 15/4/15.
//  Copyright (c) 2015年 DentiYun. All rights reserved.
//

#import "AppDelegate.h"

//切换发布环境请修改该参数 0 开发 1 生产 2 测试
#define TARGET_RELEASE_ENVIRONMENT 2


#pragma mark - 服务器地址

#define BASE_URL                         @"http://192.168.1.3/xampp/liche/"


#pragma mark - 常用的key

#define kOKKey                           @"OK"
#define kFAILEDKey                       @"FAILED"
#define keyNoNetWorkMsg                  @"无法连接到服务器,请检查网络"
#define keyBaiduMap                      @"YS6AdrZmgXmVqbYDLfdPA3ge"
#define GPS_LONGITUDE                    @"long"
#define GPS_LATITUDE                     @"lat"
#define MOBILE_INFO_UUID                 @"UUID"
#define MOBILE_INFO_TYPE                 @"phoneType"
#define MOBILE_INFO_DEVICEID             @"deviceID"
#define MOBILE_INFO_PHONE                @"mobilePhone"

#define HAS_USED                         @"hasUsed"
#define IS_LOGINED                       @"isLogined"



#pragma mark - 设备信息

#define App                               ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define File                              [NSUserDefaults standardUserDefaults]
#define APPFileManager                    [NSFileManager defaultManager]
#define AppHeight                         [UIScreen mainScreen].bounds.size.height
#define AppWidth                          [UIScreen mainScreen].bounds.size.width
#define AppFrame(x,y,width,height)        CGRectMake((x),(y),(width),(height))
#define AppColor(r,g,b,a)                 [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define SCREEN_MAX_LENGTH                 (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH                 (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPAD                           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE                         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA                         ([[UIScreen mainScreen] scale] >= 2.0)
#define IS_IOS_8                          ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)
#define IS_IPHONE_4_OR_LESS               (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5                       (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6                       (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P                      (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)



#pragma mark - 正则式

#define MOBILE_REGEX                       [NSString stringWithFormat:@"^(1(([35][0-9])|(47)|[8][0-9]))\\d{8}$"]
#define MOBILE                             @"^[1][1,2,3,4,5,6,7,8,9][0-9]{9}$"
/******************************密码输入限制******************************/
#define ALPHANUM                           @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"


#pragma mark - 常用字体

#define FONT11                             [UIFont systemFontOfSize:11]
#define FONT12                             [UIFont systemFontOfSize:12]
#define FONT13                             [UIFont systemFontOfSize:13]
#define FONT14                             [UIFont systemFontOfSize:14]
#define FONT15                             [UIFont systemFontOfSize:15]
#define FONT16                             [UIFont systemFontOfSize:16]
#define FONT17                             [UIFont systemFontOfSize:17]
#define FONT18                             [UIFont systemFontOfSize:18]
#define FONT19                             [UIFont systemFontOfSize:19]
#define FONT20                             [UIFont systemFontOfSize:20]
#define FONT24                             [UIFont systemFontOfSize:24]
#define FONT25                             [UIFont systemFontOfSize:25]
#define FONT26                             [UIFont systemFontOfSize:26]
#define FONT27                             [UIFont systemFontOfSize:27]
#define FONT28                             [UIFont systemFontOfSize:28]
#define FONT29                             [UIFont systemFontOfSize:29]
#define FONT30                             [UIFont systemFontOfSize:30]

#pragma mark - 控件基本背景色

#define  AttentionColor                    [UIColor colorWithRed:72/255.0 green:174/255.0 blue:255/255.0 alpha:1]
#define  AttentionBtnColor                 [UIColor colorWithRed:255/255.0 green:163/255.0 blue:33/255.0 alpha:1]
#define  commonBtnColor                    [UIColor colorWithRed:72/255.0 green:174/255.0 blue:255/255.0 alpha:1]
#define  backColor                         [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1]
#define  greenColor                        [UIColor colorWithRed:148/255.0 green:205/255.0 blue:106/255.0 alpha:1]
#define  lineBGColor                       [UIColor colorWithRed:227/255.0 green:227/255.0 blue:229/255.0 alpha:1]
#define  fFontColor                        [UIColor colorWithRed:125/255.0 green:125/255.0 blue:125/255.0 alpha:1]
#define  tFontColor                        [UIColor colorWithRed:125/255.0 green:125/255.0 blue:125/255.0 alpha:1]
#define  tSMsgColor                        [UIColor colorWithRed:233/255.0 green:147/255.0 blue:63/255.0 alpha:1]
#define  pikColor                          [UIColor colorWithRed:148/255.0 green:205/255.0 blue:106/255.0 alpha:1]
#define  tbHeaderColor                     [UIColor colorWithRed:253/255.0 green:218/255.0 blue:214/255.0 alpha:1]
#define  getCodeColor                      [UIColor colorWithRed:140/255.0 green:193/255.0 blue:82/255.0 alpha:1]
#define  comBtnColor                       [UIColor colorWithRed:249/255.0 green:117/255.0 blue:97/255.0 alpha:1]
#define  pikBGColor                        [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]
#define  deleteBtnColor                    [UIColor colorWithRed:255/255.0 green:163/255.0 blue:33/255.0 alpha:1]
#define  swithColor                        [UIColor colorWithRed:255/255.0 green:92/255.0  blue:128/255.0 alpha:1]
#define  darkgrayColor                     [UIColor colorWithRed:82/255.0 green:82/255.0   blue:82/255.0 alpha:1]
#define  swithColor                        [UIColor colorWithRed:255/255.0 green:92/255.0  blue:128/255.0 alpha:1]
#define  HeaderColor                       [UIColor colorWithRed:253/255.0 green:218/255.0 blue:214/255.0 alpha:1]


#define ButtonBaseTag                 101;
