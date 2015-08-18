//
//  MainViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize da01,db01,dc01,dd01,de01;
@synthesize rootViewOne,rootViewTwo,rootViewThree,rootViewFour,rootViewFive;

- (id)init {
    self =[super init];
    if (self) {
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabBarVC];
    [self initTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:1 animated:YES];
}

#pragma mark - 创建 TabBarController

- (void)initTabBarVC {
    
    da01 = [[DA01ViewController alloc]init];
    db01 = [[DB01ViewController alloc]init];
    dc01 = [[DC01ViewController alloc]init];
    dd01 = [[DD01ViewController alloc]init];
    de01 = [[DE01ViewController alloc]init];
    
    NSArray *viewArray = @[da01,db01,dc01,dd01,de01];
    self.viewControllers = viewArray;
}

#pragma mark - 创建UI

- (void)initTabBar {
    
    float btnWidth = 60;
    float btnheight = 208/3;
    float btnThreeWidth = AppWidth-240;
    
    UIView *tabbarView = [[UIView alloc] initWithFrame:AppFrame(0, AppHeight-btnheight, AppWidth, btnheight)];
    tabbarView.userInteractionEnabled = YES;
    [self.view addSubview:tabbarView];
    
    rootViewThree = [[RootView alloc]initWithFrame:AppFrame(0, 0, AppWidth, btnheight)];
    rootViewThree.barBtn.tag = 2+ButtonBaseTag;
    rootViewThree.barBtn.selected = NO;
    rootViewThree.barBtn.frame = AppFrame(btnWidth*2, 0, btnThreeWidth, btnheight);
    [rootViewThree.barBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarView addSubview:rootViewThree];
    
    rootViewOne = [[RootView alloc]initWithFrame:AppFrame(0, 0, btnWidth, btnheight)];
    rootViewOne.bageValue = @"0";
    rootViewOne.barBtn.tag = 0+ButtonBaseTag;
    rootViewOne.barBtn.selected = YES;
    [rootViewOne.barBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarView addSubview:rootViewOne];
    
    rootViewTwo = [[RootView alloc]initWithFrame:AppFrame(btnWidth, 0, btnWidth, btnheight)];
    rootViewTwo.bageValue = @"0";
    rootViewTwo.barBtn.tag = 1+ButtonBaseTag;
    rootViewTwo.barBtn.selected = NO;
    [rootViewTwo.barBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarView addSubview:rootViewTwo];
    
    
    rootViewFour = [[RootView alloc]initWithFrame:AppFrame(btnWidth*2+btnThreeWidth, 0, btnWidth, btnheight)];
    rootViewFour.bageValue = @"0";
    rootViewFour.barBtn.tag = 3+ButtonBaseTag;
    rootViewFour.barBtn.selected = YES;
    [rootViewFour.barBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarView addSubview:rootViewFour];
    
    rootViewFive = [[RootView alloc]initWithFrame:AppFrame(btnWidth*3+btnThreeWidth, 0, btnWidth, btnheight)];
    rootViewFive.bageValue = @"0";
    rootViewFive.barBtn.tag = 4+ButtonBaseTag;
    rootViewFive.barBtn.selected = YES;
    [rootViewFive.barBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarView addSubview:rootViewFive];
    
    int lastIndex = [[File objectForKey:@"LAST_SELECTED_TAB_INDEX"] intValue];
    if (lastIndex == 0) {
        [self btnPressed:rootViewOne.barBtn];
    }else if (lastIndex == 1){
        [self btnPressed:rootViewTwo.barBtn];
    }else if (lastIndex == 2){
        [self btnPressed:rootViewThree.barBtn];
    }else if (lastIndex == 3){
        [self btnPressed:rootViewFour.barBtn];
    }else if (lastIndex == 4){
        [self btnPressed:rootViewFive.barBtn];
    }
}

#pragma mark - 按钮点击事件

- (void)btnPressed:(UIButton *)sender {
    
    NSInteger index = sender.tag;
    NSLog(@"%d",(int)index);
    
    if (index !=103) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"stopPlayMovie" object:nil];
    }
    
    switch (index) {
        case 101:
            self.selectedIndex = 0;[File setValue:@"0" forKey:@"LAST_SELECTED_TAB_INDEX"];[File synchronize];
            rootViewOne.barBtn.selected = YES;
            rootViewTwo.barBtn.selected = NO;
            rootViewThree.barBtn.selected = NO;
            rootViewFour.barBtn.selected = NO;
            rootViewFive.barBtn.selected = NO;
            break;
        case 102:
            self.selectedIndex = 1;[File setValue:@"1" forKey:@"LAST_SELECTED_TAB_INDEX"];[File synchronize];
            rootViewOne.barBtn.selected = NO;
            rootViewTwo.barBtn.selected = YES;
            rootViewThree.barBtn.selected = NO;
            rootViewFour.barBtn.selected = NO;
            rootViewFive.barBtn.selected = NO;
            break;
        case 103:
            self.selectedIndex = 2;[File setValue:@"2" forKey:@"LAST_SELECTED_TAB_INDEX"];[File synchronize];
            rootViewOne.barBtn.selected = NO;
            rootViewTwo.barBtn.selected = NO;
            rootViewThree.barBtn.selected = YES;
            rootViewFour.barBtn.selected = NO;
            rootViewFive.barBtn.selected = NO;
            break;
        case 104:
            self.selectedIndex = 3;[File setValue:@"3" forKey:@"LAST_SELECTED_TAB_INDEX"];[File synchronize];
            rootViewOne.barBtn.selected = NO;
            rootViewTwo.barBtn.selected = NO;
            rootViewThree.barBtn.selected = NO;
            rootViewFour.barBtn.selected = YES;
            rootViewFive.barBtn.selected = NO;
            break;
        case 105:
            self.selectedIndex = 4;[File setValue:@"4" forKey:@"LAST_SELECTED_TAB_INDEX"];[File synchronize];
            rootViewOne.barBtn.selected = NO;
            rootViewTwo.barBtn.selected = NO;
            rootViewThree.barBtn.selected = NO;
            rootViewFour.barBtn.selected = NO;
            rootViewFive.barBtn.selected = YES;
            break;
            
        default:
            break;
    }
    
    rootViewOne.barImageView.image =  rootViewOne.barBtn.selected ?[UIImage imageNamed:@"da01_tab_S"]:[UIImage imageNamed:@"da01_tab_N"];
    rootViewTwo.barImageView.image = rootViewTwo.barBtn.selected ?[UIImage imageNamed:@"db01_tab_S"]:[UIImage imageNamed:@"db01_tab_N"];
    rootViewThree.barImageView.image = rootViewThree.barBtn.selected ?[UIImage imageNamed:@"tabBar_S"]:[UIImage imageNamed:@"tabBar_N"];
    rootViewFour.barImageView.image = rootViewFour.barBtn.selected ?[UIImage imageNamed:@"dd01_tab_S"]:[UIImage imageNamed:@"dd01_tab_N"];
    rootViewFive.barImageView.image = rootViewFive.barBtn.selected ?[UIImage imageNamed:@"de01_tab_S"]:[UIImage imageNamed:@"de01_tab_N"];

}

@end
