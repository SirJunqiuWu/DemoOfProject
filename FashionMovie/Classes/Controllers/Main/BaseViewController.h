//
//  BaseViewController.h
//  FashionMovie
//
//  Created by Jack Wu on 15/8/5.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/*
 * 是否隐藏导航栏
 */
@property (nonatomic,assign)BOOL isHideNavBar;

/*
 * 导航返回按钮是否只显示箭头
 */
@property (nonatomic,assign)BOOL isNavBackOnlyArrow;


/*
 * 导航栏标题
 */
@property (nonatomic,strong)NSString *navTitle;


/*
 *  自定义导航返回按钮
 *  title：标题
 *  action：点击事件
 */
- (void)setNavgationItemBackBtnWithTitle:(NSString *)title Action:(SEL)action;


/*
 * 开启页面手势滑动返回
 */
- (void)openSwipBackGesture;

@end
