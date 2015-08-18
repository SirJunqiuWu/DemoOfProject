//
//  DB01ViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "DB01ViewController.h"

@interface DB01ViewController ()

@end

@implementation DB01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [CoreUtil removeOnNavView:App.mainVC.navigationController];
    [self.tabBarController.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - 创建UI

- (void)setupUI {
    
}

@end
