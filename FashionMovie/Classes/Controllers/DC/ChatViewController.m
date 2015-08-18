//
//  ChatViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController
@synthesize inputField;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 创建UI

- (void)setupUI {
    
    inputField = [[UITextField alloc]initWithFrame:AppFrame(0, 0, 20, 20)];
    inputField.hidden = YES;
    inputField.delegate = self;
//    [self.view addSubview:inputField];
    
    UIView *statusBg = [[UIView alloc]init];
    statusBg.frame = AppFrame(0,0, AppWidth,20);
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
 
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,20, AppWidth,AppHeight);
    bgView.image = [UIImage imageNamed:@"chatBg"];
    bgView.userInteractionEnabled = YES;
    [self.view addSubview:bgView];
    
    UIImageView *inputBg = [[UIImageView alloc]init];
    inputBg.frame = AppFrame(0,AppHeight-44, AppWidth,44);
    inputBg.image = [UIImage imageNamed:@"chatInput"];
    inputBg.userInteractionEnabled = YES;
    [self.view addSubview:inputBg];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = AppFrame(0, 0, AppWidth, 60);
    [backBtn addTarget:self action:@selector(backBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton *resignBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    resignBtn.frame = AppFrame(0, 60, AppWidth, 300);
    [resignBtn addTarget:self action:@selector(resignBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resignBtn];
    
    [inputField becomeFirstResponder];
}

- (void)backBtnPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)resignBtnPressed {
    [inputField resignFirstResponder];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [inputField resignFirstResponder];
    return YES;
}

@end
