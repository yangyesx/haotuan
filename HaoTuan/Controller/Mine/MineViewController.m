//
//  MineViewController.m
//  HaoTuan
//
//  Created by yangyunen on 16/8/28.
//  Copyright © 2016年 yangyunen. All rights reserved.
//

#import "MineViewController.h"
#import <Masonry.h>

@interface MineViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *photoImgV;
@property (nonatomic, strong) UILabel *nickLabel;
@property (nonatomic, strong) UIButton *edit;

@property (nonatomic, strong) UIButton *trades;
@property (nonatomic, strong) UIButton *shops;
@property (nonatomic, strong) UIButton *acts;
@property (nonatomic, strong) UIButton *news;

@property (nonatomic, strong) UILabel *info;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.scrollView.delegate = self;
    
    [self.view addSubview:self.scrollView];
    
    self.photoImgV = [UIImageView new];
    self.photoImgV.backgroundColor = [UIColor redColor];
    self.photoImgV.image = [UIImage imageNamed:@"photo.jpg"];
    [self.scrollView addSubview:self.photoImgV];
    [self.photoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(60);
    }];
    
    self.nickLabel = [UILabel new];
    self.nickLabel.text = @"杨允恩";
    [self.scrollView addSubview:self.nickLabel];
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.photoImgV.mas_right).multipliedBy(1.2);
        make.centerY.mas_equalTo(self.photoImgV);
    }];
    
    self.edit = [UIButton new];
    [self.view addSubview:self.edit];
    [self.edit setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
    [self.edit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(17, 17));
        make.centerY.mas_equalTo(self.nickLabel);
        make.left.mas_equalTo(self.nickLabel.mas_right).multipliedBy(1.1);
    }];
    
    self.trades = [UIButton new];
    [self.trades setTitle:@"我的订单" forState:UIControlStateNormal];
    self.trades.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.trades];
    [self.trades mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.photoImgV.mas_bottom).multipliedBy(1.2);
        make.width.mas_equalTo(self.view).multipliedBy(0.48);
        make.height.mas_equalTo(self.trades.mas_width).multipliedBy(0.6);
    }];
    
    self.shops = [UIButton new];
    [self.shops setTitle:@"店铺收藏" forState:UIControlStateNormal];
    self.shops.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.shops];
    [self.shops mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.trades);
        make.centerY.mas_equalTo(self.trades);
        make.right.mas_equalTo(self.view);
    }];
    
    self.acts = [UIButton new];
    [self.acts setTitle:@"活动收藏" forState:UIControlStateNormal];
    self.acts.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.acts];
    [self.acts mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.size.mas_equalTo(self.trades);
        make.top.mas_equalTo(self.trades.mas_bottom).multipliedBy(1.04);
    }];
    
    self.news = [UIButton new];
    [self.news setTitle:@"资讯收藏" forState:UIControlStateNormal];
    self.news.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.news];
    [self.news mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view);
        make.size.mas_equalTo(self.trades);
        make.top.mas_equalTo(self.trades.mas_bottom).multipliedBy(1.04);
    }];
    
    self.info = [UILabel new];
    self.info.text = @"好团\n2016";
    self.info.textAlignment = NSTextAlignmentCenter;
    self.info.textColor = [UIColor lightGrayColor];
    self.info.font = [UIFont systemFontOfSize:12];
    self.info.numberOfLines = 2;
    self.info.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:self.info];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).multipliedBy(0.9);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
