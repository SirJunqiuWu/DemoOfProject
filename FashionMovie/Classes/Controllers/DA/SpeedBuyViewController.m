//
//  SpeedBuyViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/5.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "SpeedBuyViewController.h"

@interface SpeedBuyViewController ()

@end

@implementation SpeedBuyViewController

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
    self.navigationItem.title = @"爱尚云影";
    [CoreUtil removeOnNavView:self.navigationController];
    
}

#pragma mark - 创建UI

- (void)setupUI {
    
    CGFloat height = 2304/3;
    
    UIScrollView * baseSV =[[UIScrollView alloc]init];
    baseSV.frame = AppFrame(0, 0, AppWidth,height);
    baseSV.backgroundColor= [UIColor whiteColor];
    
    if (height >AppHeight) {
        baseSV.contentSize = CGSizeMake(AppWidth, height+200);
    }else{
        baseSV.contentSize = CGSizeMake(AppWidth, AppHeight);
    }
    
    baseSV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:baseSV];
    
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,0, AppWidth,height);
    bgView.image = [UIImage imageNamed:@"da01_speedBuy"];
    [baseSV addSubview:bgView];
}


@end
