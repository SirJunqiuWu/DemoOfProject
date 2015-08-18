//
//  MainViewController.h
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DA01ViewController.h"
#import "DB01ViewController.h"
#import "DC01ViewController.h"
#import "DD01ViewController.h"
#import "DE01ViewController.h"

#import "RootView.h"

@interface MainViewController : UITabBarController

@property (nonatomic,strong)DA01ViewController *da01;
@property (nonatomic,strong)DB01ViewController *db01;
@property (nonatomic,strong)DC01ViewController *dc01;
@property (nonatomic,strong)DD01ViewController *dd01;
@property (nonatomic,strong)DE01ViewController *de01;

@property (nonatomic,strong)RootView *rootViewOne;
@property (nonatomic,strong)RootView *rootViewTwo;
@property (nonatomic,strong)RootView *rootViewThree;
@property (nonatomic,strong)RootView *rootViewFour;
@property (nonatomic,strong)RootView *rootViewFive;


@end
