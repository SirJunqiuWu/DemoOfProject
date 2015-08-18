//
//  DA02Controller.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/7.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "DA02Controller.h"

@implementation DA02Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.isHideNavBar = YES;
    
}

#pragma mark - 创建UI

- (void)setupUI {
    
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,20, AppWidth,AppHeight);
    bgView.image = [UIImage imageNamed:@"da01_activityRed"];
    [self.view addSubview:bgView];
    
    UIView *statusBg = [[UIView alloc]init];
    statusBg.frame = AppFrame(0,0, AppWidth,20);
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = AppFrame(0, 0, AppWidth, AppHeight);
    [backBtn addTarget:self action:@selector(backBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)backBtnPressed {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
