//
//  DD01ViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "DD01ViewController.h"

@interface DD01ViewController ()

@end

@implementation DD01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CoreUtil removeOnNavView:App.mainVC.navigationController];
    [App.mainVC.navigationController setNavigationBarHidden:YES animated:YES];
}


@end
