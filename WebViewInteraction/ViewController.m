//
//  ViewController.m
//  WebViewInteraction
//
//  Created by 房懷安 on 2015/10/19.
//  Copyright © 2015年 房懷安. All rights reserved.
//

#import "ViewController.h"
#import "FeatureCellView.h"

#import "LoadRemoteWebViewController.h"
#import "LoadLocalHTMLViewController.h"
#import "CallPageFunctonViewController.h"
#import "CallNativeFunctionViewController.h"

@interface ViewController ()
{
    IBOutlet UITableView *featuresTable ;

    NSArray *features ;
    NSArray *segues;
}

@end

@implementation ViewController

static NSString *FeatureCellViewIdentifier = @"FeatureCellView";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    features = @[@"Load HTML from Web", @"Load HTML from Local", @"Call WebPage's function", @"Call Native function"];
    segues = @[@"moveToLoadRemoteWebViewSegue", @"moveToLoadLocalHTMLViewSegue", @"moveToCallPageFunctonViewSegue", @"moveToCallNativeFunctionViewSegue"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate and DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [features count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FeatureCellView *cell = (FeatureCellView *) [tableView dequeueReusableCellWithIdentifier:FeatureCellViewIdentifier];
    
    if (nil == cell) {
        cell = [[FeatureCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FeatureCellViewIdentifier];
    }
    
    [cell updateContentWithName:[features objectAtIndex:[indexPath row]]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *segueIdentifier = [segues objectAtIndex:[indexPath row]];

    [self performSegueWithIdentifier:segueIdentifier sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:[segues objectAtIndex:0]]) {
        LoadRemoteWebViewController *destViewController = (LoadRemoteWebViewController *)[segue destinationViewController];
        
        [destViewController setTitle:[features objectAtIndex:0]];
        
    }
    else if ([[segue identifier] isEqualToString:[segues objectAtIndex:1]]) {
        LoadLocalHTMLViewController *destViewController = (LoadLocalHTMLViewController *)[segue destinationViewController];
        
        [destViewController setTitle:[features objectAtIndex:1]];
    }
    else if ([[segue identifier] isEqualToString:[segues objectAtIndex:2]]) {
        CallPageFunctonViewController *destViewController = (CallPageFunctonViewController *)[segue destinationViewController];
    
        [destViewController setTitle:[features objectAtIndex:2]];
    }
    else if ([[segue identifier] isEqualToString:[segues objectAtIndex:3]]) {
        CallNativeFunctionViewController *destViewController = (CallNativeFunctionViewController *)[segue destinationViewController];
        
        [destViewController setTitle:[features objectAtIndex:3]];
    }

}


@end
