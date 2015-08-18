//
//  CoreUtil.h
//  Doctor
//
//  Created by 王东利 on 15/4/15.
//  Copyright (c) 2015年 DentiYun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <Security/Security.h>
#import <CommonCrypto/CommonCryptor.h>
#import <AdSupport/AdSupport.h>

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AudioToolbox/AudioToolbox.h>

#import <CommonCrypto/CommonDigest.h>

typedef enum {
    NetWorkNotReachable,
    NetWorkIsWIFI,
    NetWorkIs3G,
} NetWorkStatus;


@interface CoreUtil : NSObject


+ (NSString *) getUDID;


+ (void) saveToKeychain:(NSString *)key data:(id)data;
+ (id) loadFromKeychain:(NSString *)key;
+ (void) delFromKeychain:(NSString *)key;


+(void) showProgressHUD:(NSString *)title;
+(void) showSuccessHUD:(NSString *)title detail:(NSString *)detail interval:(int)interval;
+(void) showFailedHUD:(NSString *)title detail:(NSString *)detail interval:(int)interval;
+(void) showWarningHUD:(NSString *)title detail:(NSString *)detail interval:(int)interval;
+(void) hideHUD;



+ (NSString *) getDateFormat:(NSString *)format date:(NSDate *)date;
+ (NSDate *) getFormatDate:(NSString *)format date:(NSString *)date;



/*
 * 将汉字转换为不带音调的拼音
 * string是要转换的字符串
 */
+(NSString*)transformMandarinToLatin:(NSString *)string;


/*
 *正则判断
 *
 */
+ (BOOL)regexer: (NSString *)str rx_matchesPattern: (NSString *)regexerStr;


/*
 *判断返回值是不是OK
 *
 */
+ (BOOL)isReturnOKWithString:(NSString *)result;


/**
 *  将null转换为@""
 *
 */
+(NSString *)null2Empty:(NSString *)str;


/**
 *  计算字体占据空间的大小
 *  不同的ios版本,调用不同的方法,实现相同的功能
 *
 */
+(CGSize)sizeOfStr:(NSString *)str andFont:(UIFont *)font andMaxSize:(CGSize)size andLineBreakMode:(NSLineBreakMode)mode;


/*
 *检测网络连接情况
 *
 */
+(NetWorkStatus) isConnectionAvailable;


/**
 *  根据文本获取宽度
 */
+(float)widthForCompanyAdress:(NSString *)jobName AndFont:(float)font;


/**
 *  获取图片的完整url
 *
 */
+ (NSURL *)getCompleteUrlWithString:(NSString *)string;

/**
 *   查看网络是否连接
 *
 *  @return YES 网络有连接  NO 网路断开
 */
+ (BOOL)isNetwork;


/**
 *  获取格式化后的时间
 *
 *  @param date NSDate
 *
 *  @return 2015-05-20
 */
+ (NSString *)getEditUserBirthday:(NSDate *)date;

/**
 *  根据时间，返回格式化后的NSDate
 *
 *  @param time NSString
 *
 *  @return NSDate
 */
+ (NSDate *)getDateWithTimeString:(NSString *)time;

/**
 *  根据时间，返回格式化后的NSDate
 *
 *  @param time NSString
 *
 *  @return NSDate
 */
+ (NSString *)getDetailTimeWithTime:(NSString *)time;

//转换音频amr文件为wav文件
+ (BOOL) amrToWav:(NSString*)_amrPath wavSavePath:(NSString*)_savePath;

//转换音频wav文件为amr文件
+ (BOOL) wavToAmr:(NSString*)_wavPath amrSavePath:(NSString*)_savePath;



/**
 *  设置ToolBar
 */
+ (UIToolbar *)setToolBar:(id)target RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelecto;


/*
 * 设置背景色相同的inputView (UIPickerView  && UIDatePicker)
 */
+ (UIView *)setInputViewWithPicker:(UIPickerView *)picker RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector Target:(id)target Color:(UIColor *)color;
+ (UIView *)setInputViewWithDatePicker:(UIDatePicker *)picker RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector Target:(id)target;

+(NSString *)uuid;

/**
 * 保存图片到本地沙盒
 */
+ (BOOL)saveImageToDocumentsWithImageName:(NSString *)imageName Image:(UIImage *)image Size:(CGSize)size Scale:(CGFloat)scale;

+ (NSString *)getDocumentsOfPath:(NSString *)fileDir;

/**
 *  获取已经下载好的图片
 *
 *  @param url 指定图片的url
 *
 *  @return 已经下载的图片
 */
+ (UIImage *)getExitImageWithImageUrl:(NSString *)url;


+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;


/**
 *  手机号码验证
 *
 *  @param mobileNum 手机号码
 *
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;


/**
 *  根据字符长度截取指定长度的字符
 */
+ (NSString *) subStringTitle:(NSString *)str andIndex:(NSInteger)index;

/**
 *  月份加减
 *
 *  @param momth 几个月 rDate 日期
 *
 */

+(NSString *) getDateByMonthWith:(NSInteger) momth withDate:(NSDate *) rDate;
+(NSDate *) getDateSubtractMonthWith:(NSInteger) momth withDate:(NSDate *) rDate;

/**
 *  时间相加
 *
 *  @param str   传入的时间
 *
 *  @return 相加后的时间
 */
+(NSString *) AddTimeInterval:(NSTimeInterval)interval andDate:(NSString *)dateStr;

/**
 *  日期截取 mm/dd
 *
 *  @param str   传入的日期字符串
 *
 *  @return 截图的字符
 */
+(NSString *) subStringDate:(NSString *)str;

/**
 *  输入的日期得到星期
 *
 *  @param str   传入的日期
 *
 *  @return 星期几字符
 */
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;


/**
 *  比较当前选择的时间是不是合乎实际
 *
 *  @param date 当前选择的时间
 */
+ (BOOL)isSelectRightDateWithDate:(NSString *)date;


/**
 *  判断服务层的message是不是网络异常消息
 *
 *  @param message 服务层的message
 *
 *  @return YES 是网络异常消息 NO不是
 */
+ (BOOL)isServiceMessageIsNetworkFailed:(NSString *)message;

/**
 *  根据颜色值画图片
 *
 *  @param color UIColor
 *
 *  @return 图片 UIImage
 */
+ (UIImage *)setImageByColor:(UIColor *)color;

/**
 *  根据宏值，获取UIColor
 *
 *  @param color 宏颜色值
 *
 *  @return UIColor
 */
+ (UIColor *)setColorWithHexString: (NSString *)color;

+ (UIImage *)imageName:(NSString *)imageName;

+ (UIView *)setTitleViewWithString:(NSString *)title AndTitleColor:(UIColor *)color;

+(UIImage *)setNavgationBarBackImageWithColor:(UIColor *)color;

+ (UIBarButtonItem *)setNavigationBackItem;

+(void)removeOnNavView:(UINavigationController *)nav;

@end
