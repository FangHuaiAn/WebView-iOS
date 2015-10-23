//
//  CallPageFunctonViewController.m
//  WebViewInteraction
//
//  Created by 房懷安 on 2015/10/22.
//  Copyright © 2015年 房懷安. All rights reserved.
//

#import "CallPageFunctonViewController.h"

@interface CallPageFunctonViewController ()
{
    IBOutlet UIWebView *webView ;
    IBOutlet UITextField *txtMessage ;
    
    NSMutableString *message ;
}

- (IBAction) btnMessageClicked :(id)sender ;

@end

@implementation CallPageFunctonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [webView loadHTMLString:@"<html><head><title>Local String</title><style type='text/css'>p{font-family : Verdana; color : purple }</style><script language='JavaScript'> function msg( text ){alert( text );}</script></head><body><p>Hello World!</p><br /><button type='button' onclick='msg()' text='Hi'>Hi</button></body></html>" baseURL:nil];
    
    message = [[NSMutableString alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) btnMessageClicked :(id)sender {
    
    [message setString:@"msg('"];
    [message appendString:[txtMessage text]];
    [message appendString:@"')"];
    
    [webView stringByEvaluatingJavaScriptFromString:message];
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
