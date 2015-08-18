//
//  NearFriendsViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "NearFriendsViewController.h"
#import "ChatViewController.h"

@interface NearFriendsViewController ()

@end

@implementation NearFriendsViewController
@synthesize baseSV,friendsView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 创建UI

- (void)setupUI {
    
    float topHeight = 219/3;
    
    UIView *statusBg = [[UIView alloc]init];
    statusBg.backgroundColor = [UIColor blackColor];
    statusBg.frame =AppFrame(0, 0, AppWidth, 20);
    [self.view addSubview:statusBg];
    
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,20, AppWidth,AppHeight);
    bgView.image = [UIImage imageNamed:@"inviateBg"];
    [self.view addSubview:bgView];
    
    UIImageView *topBg = [[UIImageView alloc]init];
    topBg.frame = AppFrame(0,20, AppWidth,topHeight);
    topBg.image = [UIImage imageNamed:@"inviate_top"];
    [self.view addSubview:topBg];
    

    
    float friendsHeight = 1704/3;
    
    baseSV =[[UIScrollView alloc]init];
    baseSV.frame = AppFrame(0, 100, AppWidth,friendsHeight);
    baseSV.backgroundColor= [UIColor clearColor];
    baseSV.contentSize = CGSizeMake(AppWidth, AppHeight+200);
    baseSV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:baseSV];
    
    
    friendsView = [[UIImageView alloc]init];
    friendsView.frame = AppFrame(0,0, AppWidth,friendsHeight);
    friendsView.image = [UIImage imageNamed:@"dc01_friendsBg"];
    [baseSV addSubview:friendsView];
    
    UIButton *goChatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goChatBtn.frame = AppFrame(0,0, AppWidth, 100);
    [goChatBtn addTarget:self action:@selector(goChatBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goChatBtn];
    
    float height = 254/3;
    UIImageView *bottomBg = [[UIImageView alloc]init];
    bottomBg.frame = AppFrame(0,AppHeight-height, AppWidth,height);
    bottomBg.image = [UIImage imageNamed:@"inviate_bottom"];
    [self.view addSubview:bottomBg];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = AppFrame(0, AppHeight-80, AppWidth, 80);
    [backBtn addTarget:self action:@selector(backBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)backBtnPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goChatBtnPressed {
    ChatViewController *vc = [[ChatViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
