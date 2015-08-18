//
//  CRNavigationController.m
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//

#import "CRNavigationController.h"
#import "CRNavigationBar.h"


#define IOS7_SDK_AVAILABLE ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)
@interface CRNavigationController ()

@end

@implementation CRNavigationController

- (id)init {
    if (IOS7_SDK_AVAILABLE) {
        self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    }
    else
    {
        self=[super init];
    }
    if(self) {
        // Custom initialization here, if needed.
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (IOS7_SDK_AVAILABLE) {
        self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    }
    else
    {
        self=[super initWithRootViewController:rootViewController];
    }

    if(self) {
        self.viewControllers = @[rootViewController];
    }
    
    UIImage *img = [CoreUtil setImageByColor:[CoreUtil setColorWithHexString:@"#3c4044"]];
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = [CoreUtil setNavigationBackItem];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    return self;
    
    //Info.plist文件里配置
    //View controller-based status bar appearance  ＝ NO
    //View Controller 不对status Bar 显示进行操作
}

@end
