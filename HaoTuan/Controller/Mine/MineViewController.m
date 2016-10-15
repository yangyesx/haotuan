//
//  MineViewController.m
//  HaoTuan
//
//  Created by yangyunen on 16/8/28.
//  Copyright © 2016年 yangyunen. All rights reserved.
//

#import "MineViewController.h"
#import <Masonry.h>
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import <UIImageView+WebCache.h>

#define server @"http://119.29.202.196:8080/haotuan2/connect"

@interface MineViewController ()<UIScrollViewDelegate, NSURLConnectionDataDelegate>

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
    [self.edit addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
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
    [self.trades addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)edit:(id)sender
{
//    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
//    [securityPolicy setAllowInvalidCertificates:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager setSecurityPolicy:securityPolicy];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"text/plain",nil];
    [manager.responseSerializer setStringEncoding:NSUTF8StringEncoding];
    manager.requestSerializer.timeoutInterval = 5;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"testmethod" forKey:@"method"];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"Loading";
    
    [manager POST:server parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = responseObject;
        NSLog(@"responseValue:%@", [dict valueForKey:@"type"]);
        NSLog(@"success..............");
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"success..............";
        hud.detailsLabelText = [dict objectForKey:@"type"];
        self.nickLabel.text = [dict objectForKey:@"type"];
        [self.photoImgV sd_setImageWithURL:[dict objectForKey:@"name"] placeholderImage:[UIImage imageNamed:@"photo.jpg"]];
        [hud hide:YES afterDelay:4];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure..............: %@", error);
        hud.labelText = @"failure..............";
        hud.detailsLabelText = [NSString stringWithFormat:@"%@", error];
        hud.mode = MBProgressHUDModeText;
        [hud hide:YES afterDelay:8];
    }];
    
    //同步get
    // 1.将网址初始化成一个OC字符串对象
//    NSString *urlStr1 = [NSString stringWithFormat:@"%@", server];
//    // 如果网址中存在中文,进行URLEncode
//    NSString *newUrlStr = [urlStr1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    // 2.构建网络URL对象, NSURL
//    NSURL *url = [NSURL URLWithString:newUrlStr];
//    // 3.创建网络请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:1];
//    // 创建同步链接
//    NSURLResponse *response = nil;
//    NSError *error = nil;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //同步post
//    NSString *urlStr2 = [NSString stringWithFormat:@"%@", server];
//    NSURL *url2 = [NSURL URLWithString:urlStr2];
//    NSMutableURLRequest *request2 = [NSMutableURLRequest requestWithURL:url2];
//    NSString *parmStr = @"method=album.channel.get&appKey=myKey&format=json&channel=t&pageNo=1&pageSize=10";
//
//    NSData *paramData = [parmStr dataUsingEncoding:NSUTF8StringEncoding];
//    [request2 setHTTPBody:paramData];
//    [request2 setHTTPMethod:@"POST"];
//    NSData *data2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:nil error:nil];
}

//#pragma mark - NSURLConnectionDataDelegate
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    NSLog(@"didReceiveData................");
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"didReceiveResponse.................");
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"didFailWithError.................");
//}

@end
