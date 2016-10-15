//
//  RootViewController.m
//  HaoTuan
//
//  Created by yangyunen on 16/8/28.
//  Copyright © 2016年 yangyunen. All rights reserved.
//

#import "RootViewController.h"
#import "NewsViewController.h"
#import "NewsNavController.h"
#import "ActivityViewController.h"
#import "ShopsViewController.h"
#import "MineViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NewsNavController *nvc = [[NewsNavController alloc]initWithRootViewController:[NewsViewController new]];
    ActivityViewController *avc = [[ActivityViewController alloc]init];
    ShopsViewController *svc = [[ShopsViewController alloc]init];
    MineViewController *mvc = [[MineViewController alloc]init];
    
    nvc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_home_button_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc.tabBarItem.image = [UIImage imageNamed:@"tab_home_button"];
    nvc.tabBarItem.title = @"资讯";
    nvc.tabBarItem.badgeValue = @"new";
    avc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_mall_button_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    avc.tabBarItem.image = [UIImage imageNamed:@"tab_mall_button"];
    avc.tabBarItem.title = @"商家";
    svc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_activity_button_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    svc.tabBarItem.image = [UIImage imageNamed:@"tab_activity_button"];
    svc.tabBarItem.title = @"活动";
    mvc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_mine_button_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mvc.tabBarItem.image = [UIImage imageNamed:@"tab_mine_button"];
    mvc.tabBarItem.title = @"我";
    
    self.tabBar.tintColor = [UIColor redColor];
    self.tabBar.tag = 100;

    self.viewControllers = @[nvc, avc, svc, mvc];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabbar) name:@"hideTabbar" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabbar) name:@"showTabbar" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showTabbar
{
    if (self.tabBar.tag == 100) {
        return;
    }
    self.tabBar.tag = 100;
    [UIView animateWithDuration:.2 animations:^{
        self.tabBar.frame = CGRectMake(0, self.tabBar.frame.origin.y - self.tabBar.frame.size.height, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    }];
}

- (void)hideTabbar
{
    if (self.tabBar.tag == 200) {
        return;
    }
    self.tabBar.tag = 200;
    [UIView animateWithDuration:.2 animations:^{
        self.tabBar.frame = CGRectMake(0, self.tabBar.frame.origin.y + self.tabBar.frame.size.height, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    }];
}

@end
