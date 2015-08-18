//
//  BuyTicketViewController.h
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyTicketViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *infoTableView;
@property (nonatomic,strong)UIImageView *displayView;

@property (nonatomic,strong)UILabel     *nameLbl;
@property (nonatomic,strong)UILabel *priceLbl;
@property (nonatomic,strong)UILabel *recentLbl;
@property (nonatomic,strong)UILabel *infoLbl;
@property (nonatomic,strong)UILabel *directorLbl;
@property (nonatomic,strong)UILabel *categoryLbl;
@property (nonatomic,strong)UIButton *buyBtn;

@end
