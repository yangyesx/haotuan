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

    self.viewControllers = @[nvc, avc, svc, mvc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
