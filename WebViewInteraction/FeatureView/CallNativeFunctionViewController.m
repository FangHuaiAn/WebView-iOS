//
//  CallNativeFunctionViewController.m
//  WebViewInteraction
//
//  Created by 房懷安 on 2015/10/22.
//  Copyright © 2015年 房懷安. All rights reserved.
//

#import "CallNativeFunctionViewController.h"

@interface CallNativeFunctionViewController ()
{
    IBOutlet UIWebView *webView ;
}

@end

@implementation CallNativeFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [webView loadHTMLString:@"<html><head><title>Local String</title><style type='text/css'>p{font-family : Verdana; color : purple }</style><script language='JavaScript'> function msg(){ window.location = 'callfrompage://Hi'  }</script></head><body><p>Hello World!</p><br /><button type='button' onclick='msg()' text='Hi'>Hi</button></body></html>" baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@"://"];
    
    if ([components count] > 1 &&  [(NSString *)[components objectAtIndex:0] isEqualToString:@"callfrompage"]) {
        
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"Hi"])
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hi Title" message:@"當然是世界好" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                NSLog(@"Click OK");
            }];
            
            [alert addAction:okAction];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                NSLog(@"Click Cancel");
            }];
            
            [alert addAction:cancelAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
        return NO;
    }
    
    return YES;

}

- (void)webViewDidStartLoad:(UIWebView *)webView{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{

}


@end
