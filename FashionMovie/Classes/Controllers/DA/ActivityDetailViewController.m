//
//  ActivityDetailViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/5.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "DA02Controller.h"

@interface ActivityDetailViewController ()

@end

@implementation ActivityDetailViewController

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
    self.isNavBackOnlyArrow = YES;
    
}

#pragma mark - 创建UI

- (void)setupUI {
    
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,0, AppWidth,AppHeight);
    bgView.image = [UIImage imageNamed:@"da01_actiyityDetail"];
    [self.view addSubview:bgView];
    
    UIView *statusBg = [[UIView alloc]init];
    statusBg.frame = AppFrame(0,0, AppWidth,20);
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIImageView *backView = [[UIImageView alloc]init];
    backView.frame = AppFrame(20,32, 10,20);
    backView.image = [UIImage imageNamed:@"icon_back"];
    [self.view addSubview:backView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = AppFrame(0, 0, AppWidth, 100);
    [backBtn addTarget:self action:@selector(backBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton *goDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goDetailBtn.frame = AppFrame(0, 100, AppWidth, 400);
    [goDetailBtn addTarget:self action:@selector(goDetailBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goDetailBtn];

}

- (void)backBtnPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goDetailBtnPressed {
    
    DA02Controller *vc = [[DA02Controller alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
