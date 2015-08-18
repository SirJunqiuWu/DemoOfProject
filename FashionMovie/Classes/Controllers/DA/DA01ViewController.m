//
//  DA01ViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "DA01ViewController.h"
#import "BuyTicketViewController.h"
#import "CategoryViewController.h"
#import "ActivityViewController.h"

@interface DA01ViewController ()

@end

@implementation DA01ViewController
@synthesize bgView,baseSV;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.navigationController setNavigationBarHidden:NO animated:YES];

    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 178/4, 178/4)];
    [leftBtn setImage:[UIImage imageNamed:@"da01_scan"] forState:UIControlStateNormal];
    leftBtn.tag = 1000;
    [leftBtn addTarget:self action:@selector(leftBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [App.mainVC.navigationController.navigationBar addSubview:leftBtn];
    

    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(AppWidth-178/4, 0, 178/4, 178/4)];
    [rightBtn setImage:[UIImage imageNamed:@"da01_msg"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 2000;
    [App.mainVC.navigationController.navigationBar addSubview:rightBtn];
    
    
    float width = 913/4;
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake((AppWidth-width)/2, 0, width, 178/4)];
    [searchBtn setImage:[UIImage imageNamed:@"da01_search"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.tag = 3000;
    [App.mainVC.navigationController.navigationBar addSubview:searchBtn];
    
     App.mainVC.navigationItem.backBarButtonItem = [CoreUtil setNavigationBackItem];
    
}

#pragma mark - 创建UI

- (void)setupUI {
    
    baseSV =[[UIScrollView alloc]init];
    baseSV.frame = AppFrame(0, -20, AppWidth,AppHeight-44);
    baseSV.backgroundColor= [UIColor whiteColor];
    baseSV.contentSize = CGSizeMake(AppWidth, AppHeight+20);
    baseSV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:baseSV];
    
    bgView = [[UIImageView alloc]init];
    bgView.frame = AppFrame(0,0, AppWidth,baseSV.frame.size.height);
    bgView.image = [UIImage imageNamed:@"da01_bg"];
    [baseSV addSubview:bgView];
    
    float btnWidth = 287/4;
    float btnheight = 290/4;
    float gap = (AppWidth - btnWidth*5)/6;
    
    for (int i = 0; i <5; i ++) {
        
        NSString *normalImgUrl = [NSString stringWithFormat:@"da01_icon%d_N",i+1];
        NSString *selectedImgUrl = [NSString stringWithFormat:@"da01_icon%d_S",i+1];
        
        UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        iconBtn.frame = AppFrame(gap*(i+1)+btnWidth*i, 148, btnWidth, btnheight);
        iconBtn.tag = i+ButtonBaseTag;
        iconBtn.selected = NO;
        [iconBtn setBackgroundImage:[UIImage imageNamed:normalImgUrl] forState:UIControlStateNormal];
        [iconBtn setBackgroundImage:[UIImage imageNamed:selectedImgUrl] forState:UIControlStateSelected];
        [iconBtn addTarget:self action:@selector(iconBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [baseSV addSubview:iconBtn];
    }
}

#pragma mark - 按钮点击事件

- (void)leftBtnPressed {
    NSLog(@"扫一扫");
}

- (void)rightBtnPressed {
    NSLog(@"消息");
}

- (void)searchBtnPressed {
    NSLog(@"搜索");
}

- (void)iconBtnPressed:(UIButton *)sender {
  
    NSInteger index = sender.tag;
    NSLog(@"%d",(int)index);
   
    
    sender.selected = YES;
    
    for (int i = 101; i < 106; i++) {
        if (i != index) {
            UIButton *iconBtn = (UIButton *)[baseSV viewWithTag:i];
            iconBtn.selected = NO;
        }
    }
    
    switch (index) {
        case 101:
        {
            [CoreUtil removeOnNavView:App.mainVC.navigationController];
            CategoryViewController *vc = [[CategoryViewController alloc]init];
            [App.mainVC.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 102:
        {
            break;
        }
        case 103:
        {
            
           [CoreUtil removeOnNavView:App.mainVC.navigationController];
            ActivityViewController *vc = [[ActivityViewController alloc]init];
            [App.mainVC.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 104:
        {
            [CoreUtil removeOnNavView:App.mainVC.navigationController];
            BuyTicketViewController *vc = [[BuyTicketViewController alloc]init];
            [App.mainVC.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 105:
        {
            break;
        }
            
        default:
            break;
    }
}



@end
