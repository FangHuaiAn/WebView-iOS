//
//  LoadLocalHTMLViewController.m
//  WebViewInteraction
//
//  Created by 房懷安 on 2015/10/22.
//  Copyright © 2015年 房懷安. All rights reserved.
//

#import "LoadLocalHTMLViewController.h"

@interface LoadLocalHTMLViewController ()
{
    IBOutlet UIWebView *webView ;
}

@end

@implementation LoadLocalHTMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [webView loadHTMLString:@"<html><head><title>Local String</title><style type='text/css'>p{font-family : Verdana; color : purple }</style><script language='JavaScript'> function msg(){alert('Hi !');}</script></head><body><p>Hello World!</p><br /><button type='button' onclick='msg()' text='Hi'>Hi</button></body></html>" baseURL:nil];
    
    /*
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlString baseURL:nil];
    */
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
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    
}

@end
