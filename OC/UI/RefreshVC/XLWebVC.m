//
//  XLWebVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/31.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XLWebVC.h"
#import "XLRefresh.h"

@interface XLWebVC ()<UIWebViewDelegate>
{
    UIWebView *_webView;
}

@end

@implementation XLWebVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_webView stopLoading];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[UIView new]];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    _webView.scrollView.xl_header = [XLRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshMethod)];
}

-(void)refreshMethod{
    [_webView reload];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView.scrollView.xl_header endRefreshing];
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    self.title = @"加载中...";
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
