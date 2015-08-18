//
//  CategoryViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "CategoryViewController.h"
#import "DetailViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.isHideNavBar = NO;
    self.isNavBackOnlyArrow = YES;
    self.navigationItem.title = @"商品";
    [CoreUtil removeOnNavView:self.navigationController];
}

#pragma mark - 创建UI

- (void)setupUI {
    
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,20, AppWidth,AppHeight);
    bgView.image = [UIImage imageNamed:@"da01_category"];
    [self.view addSubview:bgView];
    
    UIButton *goDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goDetailBtn.frame = AppFrame(0, 100, AppWidth, 400);
    [goDetailBtn addTarget:self action:@selector(goDetailBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goDetailBtn];
}

- (void)goDetailBtnPressed {
    DetailViewController *vc = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
