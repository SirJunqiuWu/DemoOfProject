//
//  CoreUtil.m
//  Doctor
//
//  Created by 王东利 on 15/4/15.
//  Copyright (c) 2015年 DentiYun. All rights reserved.
//

#import "CoreUtil.h"
#import "CRNavigationController.h"

@implementation CoreUtil



+ (NSString *) getDateFormat:(NSString *)format date:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSDate *) getFormatDate:(NSString *)format date:(NSString *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *target = [formatter dateFromString:date];
    return target;
}




//获取UUID
+(NSString *)uuid
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef strref=CFUUIDCreateString(NULL, uuid_ref);
    NSString *string=[NSString stringWithFormat:@"%@",strref];
    return string;
}


+ (void) saveToKeychain:(NSString *)key data:(id)data {
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          (__bridge id)kSecClassGenericPassword,
                                          (__bridge id)kSecClass,
                                          key,
                                          (__bridge id)kSecAttrService,
                                          key,
                                          (__bridge id)kSecAttrAccount,
                                          (__bridge id)kSecAttrAccessibleAfterFirstUnlock,
                                          (__bridge id)kSecAttrAccessible,
                                          nil];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

+ (id)   loadFromKeychain:(NSString *)key {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          (__bridge id)kSecClassGenericPassword,
                                          (__bridge id)kSecClass,
                                          key,
                                          (__bridge id)kSecAttrService,
                                          key,
                                          (__bridge id)kSecAttrAccount,
                                          (__bridge id)kSecAttrAccessibleAfterFirstUnlock,
                                          (__bridge id)kSecAttrAccessible,
                                          nil];
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", key, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void) delFromKeychain:(NSString *)key {
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          (__bridge id)kSecClassGenericPassword,
                                          (__bridge id)kSecClass,
                                          key,
                                          (__bridge id)kSecAttrService,
                                          key,
                                          (__bridge id)kSecAttrAccount,
                                          (__bridge id)kSecAttrAccessibleAfterFirstUnlock,
                                          (__bridge id)kSecAttrAccessible,
                                          nil];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}



+(NSString*) transformMandarinToLatin:(NSString *)string {
    if ([string length]==0) return string;
    
    NSMutableString *preString = [string mutableCopy];
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformMandarinLatin,NO);
    CFStringTransform((CFMutableStringRef)preString, NULL,kCFStringTransformStripDiacritics, NO);
    if ([[(NSString *)string substringToIndex:1] compare:@"长"] ==NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 5)withString:@"chang"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"沈"] ==NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 4)withString:@"shen"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"厦"] ==NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 3)withString:@"xia"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"地"] ==NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 3)withString:@"di"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"重"] ==NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chong"];
    }
    return preString;
}


+ (BOOL)regexer: (NSString *)str rx_matchesPattern: (NSString *)regexerStr {
    
    NSError *error = NULL;
    //定义正则表达式
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexerStr
                                                                           options:0
                                                                             error:&error];
    //使用正则表达式匹配字符
    NSTextCheckingResult *isMatch = [regex firstMatchInString:str
                                                      options:0
                                                        range:NSMakeRange(0, [str length])];
    if (isMatch) {
        return YES;
    }else {
        return NO;
    }
}

+ (BOOL)isReturnOKWithString:(NSString *)result{
    return [result isEqualToString:@"OK"]?YES:NO;
}

+(NSString *)null2Empty:(NSString *)str {
    if ([str isKindOfClass:[NSNull class]]|| str == nil) {
        return @"";
    }else {
        return str;
    }
}

+(CGSize)sizeOfStr:(NSString *)str andFont:(UIFont *)font andMaxSize:(CGSize)size andLineBreakMode:(NSLineBreakMode)mode{
    CGSize s;
    
    if ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)
    {
        NSMutableDictionary  *mdic=[NSMutableDictionary dictionary];
        
        [mdic setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
        [mdic setObject:font forKey:NSFontAttributeName];
        
        s = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:mdic context:nil].size;
    }
    else
    {
        s=[str sizeWithFont:font constrainedToSize:size lineBreakMode:mode];
    }
    return s;
}


+(float)widthForCompanyAdress:(NSString *)jobName AndFont:(float)font{
    float Ypos;
    CGSize size = CGSizeMake(AppWidth,MAXFLOAT);
    CGRect rect;
    
    rect=[jobName boundingRectWithSize:size
                               options:NSStringDrawingUsesLineFragmentOrigin
                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                               context:nil];
    Ypos=rect.size.width;
    return Ypos;
}


+ (NSString *)getEditUserBirthday:(NSDate *)date{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    formatter.timeZone = [NSTimeZone defaultTimeZone];
    NSString *dateTime=[formatter stringFromDate:date];
    return dateTime;
}

+ (NSDate *)getDateWithTimeString:(NSString *)time{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [df dateFromString:time];
    return date;
}

+ (NSString *)getDetailTimeWithTime:(NSString *)time{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:time];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateTime=[formatter stringFromDate:date];
    return dateTime;
}


+ (UIToolbar *)setToolBar:(id)target RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector{
    
    UIToolbar *bar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, AppWidth, 44)];

    UIBarButtonItem *okBtn = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:target action:okSelector];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:target action:cancelSelector];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:target action:nil];//用于把btn挤到右侧
    NSArray *btarr = [NSArray arrayWithObjects:cancelBtn,space,okBtn,nil];
    bar.items =btarr;
   
    /**
     *  更换背景图
     */
//    [bar setBackgroundImage:[UIImage imageNamed:@"fujindeyake"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    bar.translucent = YES;
//    bar.barStyle = UIBarStyleDefault;
    bar.backgroundColor = [UIColor clearColor];
    
    /**
     *  bar上面的UIBarButtonItem的标题颜色
     */
    bar.tintColor = pikColor;
    return bar;
}

+ (UIView *)setInputViewWithPicker:(UIPickerView *)picker RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector Target:(id)target Color:(UIColor *)color  {
    
    UIView *inputView = [[UIView alloc]init];
    inputView.frame = AppFrame(0, AppHeight, AppWidth, 246);
    inputView.backgroundColor = pikBGColor;
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [cancelBtn setTitleColor:color forState:UIControlStateNormal];
    [cancelBtn addTarget:target action:cancelSelector forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:cancelBtn];
    
    UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(AppWidth-50, 0, 50, 30)];
    [completeBtn setTitle:@"确定" forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [completeBtn setTitleColor:color forState:UIControlStateNormal];
    [completeBtn addTarget:target action:okSelector forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:completeBtn];
   
    picker.frame = AppFrame(0, 30, AppWidth, 216);
    [inputView addSubview:picker];
    
    return inputView;
}

+ (UIView *)setInputViewWithDatePicker:(UIDatePicker *)picker RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector Target:(id)target  {
    
    UIView *inputView = [[UIView alloc]init];
    inputView.frame = AppFrame(0, 0, AppWidth, 260);
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [cancelBtn setTitleColor:pikColor forState:UIControlStateNormal];
    [cancelBtn addTarget:target action:cancelSelector forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:cancelBtn];
    
    UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(AppWidth-50, 0, 50, 44)];
    [completeBtn setTitle:@"确定" forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [completeBtn setTitleColor:pikColor forState:UIControlStateNormal];
    [completeBtn addTarget:target action:okSelector forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:completeBtn];
    
    picker.frame = AppFrame(0, 44, AppWidth, 216);
    [inputView addSubview:picker];
    
    return inputView;
}


+ (BOOL)saveImageToDocumentsWithImageName:(NSString *)imageName Image:(UIImage *)image Size:(CGSize)size Scale:(CGFloat)scale{
    
    //对图片大小进行压缩
    image = [self imageWithImage:image scaledToSize:size];
    NSData *imageData = UIImageJPEGRepresentation(image,scale);
    NSString *filePath = [[self getDocumentsOfPath:@"IMAGE"] stringByAppendingPathComponent:imageName];
    BOOL isSuccess = [imageData writeToFile:filePath atomically:YES];
    return isSuccess;
}


/**
 *  对图片尺寸进行压缩
 *
 *  @param image   UIImage
 *  @param newSize CGSize
 *
 *  @return UIImage
 */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

/**
 *  获取指定文件下的路径
 *
 *  @param fileDir 文件夹的名字
 *
 *  @return 指定文件夹的路径
 */
+ (NSString *)getDocumentsOfPath:(NSString *)fileDir {
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileDir];
    /**
     *  如果不存在，就创建该目录
     */
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        /**
         *  创建文件夹
         */
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}

/**
 *  获取已经下载好的图片
 *
 *  @param url 指定图片的url
 *
 *  @return 已经下载的图片
 */
+ (UIImage *)getExitImageWithImageUrl:(NSString *)url {
    
    UIImage *image = [UIImage imageNamed:@"doctorIcon"];
    
    if ([url rangeOfString:@"/"].length >0) {
        NSArray *array = [url componentsSeparatedByString:@"/"];
        NSString *imageName = [array lastObject];
        NSString *imagePath = [[CoreUtil getDocumentsOfPath:@"IMAGE"]stringByAppendingPathComponent:imageName];
        if ([UIImage imageWithContentsOfFile:imagePath]) {
            image = [UIImage imageWithContentsOfFile:imagePath];
        }
    }
    return image;
}


/**
 *  手机号码验证
 *
 *  @param mobileNum 手机号码
 *
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 *  月份加减
 *
 *  @param momth 几个月 rDate 日期
 *
 */

+(NSString *) getDateByMonthWith:(NSInteger) momth withDate:(NSDate *) rDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:rDate];
    [comps setMonth:[comps month] + momth];
    NSDate *date = [calendar dateFromComponents:comps];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    return [dateFormatter stringFromDate:date];
    
}
+(NSDate *) getDateSubtractMonthWith:(NSInteger) momth withDate:(NSDate *) rDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:rDate];
    [comps setMonth:[comps month] - momth];
    NSDate *date = [calendar dateFromComponents:comps];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    return date;
    
}
/**
 *  日期截取 mm/dd
 *
 *  @param str   传入的日期字符串
 *
 *  @return 截图的字符
 */
+(NSString *) subStringDate:(NSString *)str{
    
    NSDateFormatter *datef = [[NSDateFormatter alloc]init];
    [datef setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [datef dateFromString:str];
    [datef setDateFormat:@"yyyy/MM/dd"];
    NSString *strDate = [datef stringFromDate:date];
    return [strDate substringWithRange:NSMakeRange(5,5)];
}
/**
 *  时间相加
 *
 *  @param str   传入的时间
 *
 *  @return 相加后的时间
 */
+(NSString *) AddTimeInterval:(NSTimeInterval)interval andDate:(NSString *)dateStr{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    NSString *endTimeString = [dateFormatter stringFromDate:[date initWithTimeInterval:interval sinceDate:date]];
    return endTimeString;
    
}

/**
 *  输入的日期得到星期
 *
 *  @param str   传入的日期
 *
 *  @return 星期几字符
 */
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

/**
 *  获取截取字符
 *
 *  @param str   传入的字符
 *  @param index 需要截取的长度
 *
 *  @return 截图的字符
 */
+ (NSString *) subStringTitle:(NSString *)str andIndex:(NSInteger)index{
    
    if (str.length>index) {
        return [str substringToIndex:index];
    }else{
        return str;
    }
    
}

+ (BOOL)isSelectRightDateWithDate:(NSString *)date {
    
    NSArray *timeArray = [date componentsSeparatedByString:@"-"];
    
    NSArray *temptimeArray = [[CoreUtil getEditUserBirthday:[NSDate date]]componentsSeparatedByString:@"-"];
    
    if (timeArray.count != 3) {
        return NO;
    }
    
    int year = [timeArray[0]intValue] ,tempYear = [temptimeArray[0]intValue];
    int momth = [timeArray[1]intValue], tempMonth = [temptimeArray[1]intValue];
    int day = [timeArray[2]intValue], tempDay = [temptimeArray[2]intValue];
    
    /**
     *  先比较年:若大肯定可以
     */
    if (year >tempYear) {
        return YES;
    }
    
    if (year <tempYear) {
        return NO;
    }
    
    /**
     * 年一样，比较月
     */
    if (momth <tempMonth) {
        return NO;
    }
    
    if (momth >tempMonth) {
        return YES;
    }
    
    /**
     *  月一样，比较天
     */
    if (day <tempDay) {
        return NO;
    }
    return YES;

}

+ (BOOL)isServiceMessageIsNetworkFailed:(NSString *)message
{
    if([message isEqualToString:keyNoNetWorkMsg])
    {
        return YES;
    }
    return NO;
}

+ (UIImage *)setImageByColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 2, 2);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


+ (UIColor *)setColorWithHexString:(NSString *)color {
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (UIView *)setTitleViewWithString:(NSString *)title AndTitleColor:(UIColor *)color{
    
    UIView* titleView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
    UILabel* titleLabel =[[UILabel alloc]initWithFrame:titleView.frame];
    titleLabel.text =title;
    titleLabel.textColor = color;
    titleLabel.font = [UIFont systemFontOfSize:18.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:titleLabel];
    return titleView;
}

+(UIImage *)setNavgationBarBackImageWithColor:(UIColor *)color {
    return [self setImageByColor:color];
}

+ (UIBarButtonItem *)setNavigationBackItem {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
    backItem.title = @"";
    backItem.tintColor = [UIColor whiteColor];
    return backItem;
}

+(void)removeOnNavView:(UINavigationController *)nav {
    
    if ([nav isKindOfClass:[UINavigationController class]]) {
        UIButton *leftBtn = (UIButton *)[nav.navigationBar viewWithTag:1000];
        UIButton *rightBtn = (UIButton *)[nav.navigationBar viewWithTag:2000];
        UIButton *searchBtn = (UIButton *)[nav.navigationBar viewWithTag:3000];
        [leftBtn removeFromSuperview];[rightBtn removeFromSuperview];[searchBtn removeFromSuperview];
    }
    

}

@end
