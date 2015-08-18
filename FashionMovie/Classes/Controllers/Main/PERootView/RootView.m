//
//  RootView.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/6.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "RootView.h"

@implementation RootView
@synthesize barBtn,barImageView,bageIcon,bageLbl;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

- (void)initView {

    float width = self.frame.size.width;
    float height = self.frame.size.height;
    
    barImageView = [[UIImageView alloc]init];
    barImageView.frame = AppFrame(0, 0, width, height);
    [self addSubview:barImageView];
    
    bageIcon = [[UIImageView alloc]init];
    bageIcon.frame = AppFrame(38,28, 17, 17);
    bageIcon.image = [UIImage imageNamed:@"bageIcon"];
    bageIcon.layer.cornerRadius = 8.5;
    bageIcon.layer.masksToBounds = YES;
    bageIcon.hidden = YES;
    [self addSubview:bageIcon];
    
    bageLbl = [[UILabel alloc]initWithFrame:AppFrame(0, 0, 17, 17)];
    bageLbl.textColor = [UIColor whiteColor];
    bageLbl.font = [UIFont systemFontOfSize:13];
    bageLbl.textAlignment = NSTextAlignmentCenter;
    [bageIcon addSubview:bageLbl];
    
    barBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    barBtn.frame = AppFrame(0, 0, width, height);
    [self addSubview:barBtn];
}

- (void)setBageValue:(NSString *)bageValue {

    bageIcon.hidden = bageValue.intValue == 0 ?YES:NO;
    bageLbl.text = bageValue;
}


@end
