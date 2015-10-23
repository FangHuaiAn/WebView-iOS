//
//  FeatureCellView.m
//  WebViewInteraction
//
//  Created by 房懷安 on 2015/10/22.
//  Copyright © 2015年 房懷安. All rights reserved.
//

#import "FeatureCellView.h"

@implementation FeatureCellView

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) updateContentWithName :( NSString *) name {

    [lbName setText:name];
}

@end
