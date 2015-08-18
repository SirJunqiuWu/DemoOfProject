//
//  OrderTicketViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "OrderTicketViewController.h"
#import "SpeedBuyViewController.h"

@interface OrderTicketViewController ()

@end

@implementation OrderTicketViewController

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.isHideNavBar = NO;
    self.isNavBackOnlyArrow = YES;
    self.navigationItem.title = @"订票";
    [CoreUtil removeOnNavView:self.navigationController];
}


- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 创建UI

- (void)setupUI {
    
    UIImageView *backImage = [[UIImageView alloc]init];
    backImage.frame = AppFrame(0,64, AppWidth, AppHeight-64);
    backImage.image = [UIImage imageNamed:@"orderTicket"];
    [self.view addSubview:backImage];
    
    UIButton *goDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goDetailBtn.frame = AppFrame(0, 64, AppWidth, AppHeight-64);
    [goDetailBtn addTarget:self action:@selector(goDetailBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goDetailBtn];

}

- (void)goDetailBtnPressed {
    
    SpeedBuyViewController *vc = [[SpeedBuyViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
