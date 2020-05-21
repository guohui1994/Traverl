//
//  BaseWebView.m
//  zhichengEducation
//
//  Created by ZhiYuan on 2019/11/12.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "BaseWebView.h"
#import <WebKit/WebKit.h>

@interface BaseWebView ()
@property (nonatomic, strong)WKWebViewConfiguration * config ;
@property (nonatomic, strong)WKWebView * webView;
@property (nonatomic, strong)WKUserContentController* wKUserContentController;
@end

@implementation BaseWebView
- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = self.title;
    self.backText = @"";
    [self creatWKWebView];
    [self getData];
}


- (void)getData{
    WeakSelf;
    
    NSString *url = [NSString stringWithFormat:@"%@%@", @"http://zck12.oss-cn-hangzhou.aliyuncs.com/", self.url];
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    managers.requestSerializer = [AFHTTPRequestSerializer serializer];
    managers.responseSerializer = [AFHTTPResponseSerializer serializer];
    managers.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [managers GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString * urlString  =[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            [weakSelf.webView loadHTMLString:urlString baseURL:nil];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    });
    
}

#pragma mark --- 创建WKWebview
- (void )creatWKWebView{
    self.config = [[WKWebViewConfiguration alloc]init];
    self.config.preferences = [WKPreferences new];
    self.config.preferences.javaScriptEnabled = YES;
    self.config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
    self.config.userContentController = [[WKUserContentController alloc]init];
    self. webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, Height_NavBar, screenWidth, screenHeight -Height_NavBar ) configuration:self.config];
    self. wKUserContentController = _webView.configuration.userContentController;
    self.config.userContentController = self.wKUserContentController;
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;

    [self.webView.scrollView setShowsVerticalScrollIndicator:NO];
    [self.webView.scrollView setShowsHorizontalScrollIndicator:NO];
    [_webView setAllowsBackForwardNavigationGestures:YES];

    [_webView.scrollView setAlwaysBounceVertical:YES];
    [self.view addSubview:_webView];
  
}

@end
