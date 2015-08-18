//
//  BuyTicketViewController.m
//  FashionMovie
//
//  Created by Jack Wu on 15/8/4.
//  Copyright (c) 2015年 Jack Wu. All rights reserved.
//

#import "BuyTicketViewController.h"
#import "OrderTicketViewController.h"

@interface BuyTicketViewController ()
{
    NSMutableArray *imagesArray;
}

@end

@implementation BuyTicketViewController
@synthesize infoTableView,displayView;
@synthesize nameLbl,priceLbl,recentLbl,infoLbl,directorLbl,categoryLbl,buyBtn;

- (id)init {
    self = [super init];
    if (self) {
        imagesArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.isHideNavBar = YES;
    self.isNavBackOnlyArrow = YES;
    
}
    
#pragma mark - 创建UI

- (void)setupUI {
    
    for (int i = 0; i <6; i++) {
        NSString *url = [NSString stringWithFormat:@"cell%d",i+1];
        [imagesArray addObject:url];
    }
    
    UIImageView *backImage = [[UIImageView alloc]init];
    backImage.frame = AppFrame(0, 0, AppWidth, AppHeight);
    backImage.image = [UIImage imageNamed:@"buyTicket_bg"];
    [self.view addSubview:backImage];
    
    displayView = [[UIImageView alloc]init];
    displayView.frame = AppFrame(10, 30, 155, 250);
    displayView.image = [UIImage imageNamed:@"cell1"];
    [self.view addSubview:displayView];
    
    infoTableView = [[UITableView alloc] initWithFrame:AppFrame(AppWidth-145, 20, 145, AppHeight-20-50) style:UITableViewStylePlain];
    infoTableView.delegate = self;
    infoTableView.dataSource = self;
    infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    infoTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:infoTableView];
    
    UIView *infoView = [[UIView alloc]init];
    infoView.frame = AppFrame(10, 280, 155, AppHeight-250-50);
    [self.view addSubview:infoView];
    
    nameLbl = [[UILabel alloc]init];
    nameLbl.frame = AppFrame(0, 10, 145, 14);
    nameLbl.textColor = [UIColor blackColor];
    nameLbl.font = [UIFont systemFontOfSize:14];
    nameLbl.text = @"大圣归来";
    [infoView addSubview:nameLbl];
    

    
    priceLbl = [[UILabel alloc]init];
    priceLbl.frame = AppFrame(0, 35, 145, 16);
    priceLbl.textColor = [UIColor redColor];
    priceLbl.font = [UIFont systemFontOfSize:16];
    priceLbl.text = @"票价:￥45-75";
    [infoView addSubview:priceLbl];

    
    recentLbl = [[UILabel alloc]init];
    recentLbl.frame = AppFrame(0, 60, 145, 14);
    recentLbl.textColor = [UIColor redColor];
    recentLbl.font = [UIFont systemFontOfSize:13];
    recentLbl.text = @"最近11990人购票";
    [infoView addSubview:recentLbl];
    
    infoLbl = [[UILabel alloc]init];
    infoLbl.frame = AppFrame(0, 80, 160, 14);
    infoLbl.textColor = [UIColor blackColor];
    infoLbl.font = [UIFont systemFontOfSize:12];
    infoLbl.text = @"信息:中国|90分钟|2015.07.10";
    [infoView addSubview:infoLbl];
    
    directorLbl = [[UILabel alloc]init];
    directorLbl.frame = AppFrame(0, 100, 145, 14);
    directorLbl.textColor = [UIColor blackColor];
    directorLbl.font = [UIFont systemFontOfSize:12];
    directorLbl.text = @"导演:田晓鹏";
    [infoView addSubview:directorLbl];
    
    categoryLbl = [[UILabel alloc]init];
    categoryLbl.frame = AppFrame(0, 120, 145, 14);
    categoryLbl.textColor = [UIColor blackColor];
    categoryLbl.font = [UIFont systemFontOfSize:12];
    categoryLbl.text = @"类型:神话;动画";
    [infoView addSubview:categoryLbl];
    
    buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame = AppFrame(0, 150, 155, 46);
    [buyBtn addTarget:self action:@selector(buyBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    buyBtn.backgroundColor = AppColor(249, 117, 97, 1);
    buyBtn.layer.cornerRadius = 4;
    buyBtn.layer.masksToBounds = YES;
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    [infoView addSubview:buyBtn];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = AppFrame(0, AppHeight-50, AppWidth, 50);
    [backBtn addTarget:self action:@selector(backBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)buyBtnPressed {
    NSLog(@"购买");
    OrderTicketViewController *orderVc = [[OrderTicketViewController alloc]init];
    [self.navigationController pushViewController:orderVc animated:YES];
}

- (void)backBtnPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return imagesArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID =@"myCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    UIImageView *icon = (UIImageView *) [cell.contentView viewWithTag:1000];
    UIImageView *bg = (UIImageView *) [cell.contentView viewWithTag:2000];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    if (bg == nil) {
        bg = [[UIImageView alloc]init];
        bg.frame = AppFrame(0, 0, 145, 190);
        bg.tag = 2000;
        bg.backgroundColor = [CoreUtil setColorWithHexString:@"#3c4044"];
        [cell.contentView addSubview:bg];
    }
    
    if (icon == nil) {
        icon = [[UIImageView alloc]init];
        icon.frame = AppFrame(15, 5, 115, 175);
        icon.tag = 1000;
        icon.layer.cornerRadius = 8;
        icon.layer.masksToBounds = YES;
        [cell.contentView addSubview:icon];
    }
    
    icon.image = [UIImage imageNamed:imagesArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imgUrl = imagesArray[indexPath.row];
    displayView.image = [UIImage imageNamed:imgUrl];
}


@end
