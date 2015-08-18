//
//  InviateViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "InviateViewController.h"
#import "NearFriendsViewController.h"

@interface InviateViewController ()

@end

@implementation InviateViewController

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
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

#pragma mark - 创建UI

- (void)setupUI {
    
    UIView *statusBg = [[UIView alloc]init];
    statusBg.backgroundColor = [UIColor blackColor];
    statusBg.frame =AppFrame(0, 0, AppWidth, 20);
    [self.view addSubview:statusBg];

    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,20, AppWidth,AppHeight-20);
    bgView.image = [UIImage imageNamed:@"dc01_search"];
    [self.view addSubview:bgView];
    
    UIButton *goNearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goNearBtn.frame = AppFrame(0, 150, AppWidth, 300);
    [goNearBtn addTarget:self action:@selector(goNearBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goNearBtn];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = AppFrame(0, AppHeight-50, AppWidth, 50);
    [backBtn addTarget:self action:@selector(backBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

- (void)goNearBtnPressed {
    
    NearFriendsViewController *vc = [[NearFriendsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)backBtnPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
