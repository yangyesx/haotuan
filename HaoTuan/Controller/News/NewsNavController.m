//
//  NewsNavController.m
//  HaoTuan
//
//  Created by yangyunen on 16/8/29.
//  Copyright © 2016年 yangyunen. All rights reserved.
//

#import "NewsNavController.h"

@interface NewsNavController ()

@end

@implementation NewsNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.text = @"好团";
    
    [self.view addSubview:titleLabel];
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
