//
//  BaseViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/5.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openSwipBackGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setIsHideNavBar:(BOOL)isHideNavBar {
    [self.navigationController setNavigationBarHidden:isHideNavBar animated:YES];
}

- (void)setIsNavBackOnlyArrow:(BOOL)isNavBackOnlyArrow {
    self.navigationItem.backBarButtonItem = [CoreUtil setNavigationBackItem];
}

- (void)setNavTitle:(NSString *)navTitle {
    self.navigationItem.titleView = [CoreUtil setTitleViewWithString:navTitle AndTitleColor:[UIColor whiteColor]];
}

- (void)openSwipBackGesture {
  
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)setNavgationItemBackBtnWithTitle:(NSString *)title Action:(SEL)action {
    
    CGFloat titleWidth = [CoreUtil widthForCompanyAdress:title AndFont:15];
    
    UIView *backView  = [[UIView alloc]init];
    backView.frame = AppFrame(0, 0,14+titleWidth, 44);
    
    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_back"]];
    backImage.frame = AppFrame(0,12, 10, 20);
    [backView addSubview:backImage];
    
    UILabel *backTitleLbl = [[UILabel alloc]init];
    backTitleLbl.frame = AppFrame(14, 0, titleWidth, 20);
    backTitleLbl.font = [UIFont systemFontOfSize:15];
    backTitleLbl.textColor = [UIColor whiteColor];
    backTitleLbl.text = title;
    [backView addSubview:backTitleLbl];
    
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame = backView.frame;
    [backbtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backbtn];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backView];
    [self.navigationItem setLeftBarButtonItem:backItem];
}

@end
