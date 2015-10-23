//
//  LoadRemoteWebViewController.m
//  WebViewInteraction
//
//  Created by 房懷安 on 2015/10/22.
//  Copyright © 2015年 房懷安. All rights reserved.
//

#import "LoadRemoteWebViewController.h"

@interface LoadRemoteWebViewController ()
{
    IBOutlet UIWebView *webView ;
}

@end

@implementation LoadRemoteWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.china-airlines.com/ch/index.html"]]];
    // Note : detect site's default
    //[webView setScalesPageToFit:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    
    return YES;
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"StartLoad") ;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"FinishLoad") ;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    
}

@end
