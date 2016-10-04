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

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 1.1);
    self.scrollView.delegate = self;
    
    [self.view addSubview:self.scrollView];
    
    self.photoImgV = [UIImageView new];
    self.photoImgV.backgroundColor = [UIColor redColor];
    self.photoImgV.layer.cornerRadius = 40;
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
