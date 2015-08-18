//
//  DC01ViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "DC01ViewController.h"
#import "InviateViewController.h"

@interface DC01ViewController ()

@end

@implementation DC01ViewController
@synthesize theMovie;

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopPlayMovie)
                                                 name:@"stopPlayMovie"
                                               object:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CoreUtil removeOnNavView:App.mainVC.navigationController];
    [App.mainVC.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self setupUI];
}

#pragma mark - 创建UI

- (void)setupUI {
    
    NSURL *theURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dc01" ofType:@"mp4"]];
    
    if (theMovie) {
        [theMovie.moviePlayer.view removeFromSuperview];
    }
    
    theMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:theURL];
    theMovie.moviePlayer.fullscreen = NO;
    theMovie.view.backgroundColor = [UIColor blackColor];
    theMovie.moviePlayer.controlStyle = MPMovieControlStyleNone;
    theMovie.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    theMovie.moviePlayer.view.center = self.view.center;
    [self.view addSubview:theMovie.moviePlayer.view];
    [theMovie.moviePlayer prepareToPlay];
    [theMovie.moviePlayer play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(theMoviePlayFinish)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];

}

- (void)theMoviePlayFinish {
    
    [theMovie.moviePlayer stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    
    NSArray *viewsArray = self.navigationController.viewControllers;
    
    for (UIViewController *vc in viewsArray) {
        if ([vc isKindOfClass:[InviateViewController class]]) {
            return;
        }
    }
    
    InviateViewController *vc = [[InviateViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)stopPlayMovie {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    [theMovie.moviePlayer stop];
    
}



@end
