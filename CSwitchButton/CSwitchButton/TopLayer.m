//
//  TopLayer.m
//  CSwitchButton
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "TopLayer.h"

@implementation TopLayer

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self != nil) {
        self.userInteractionEnabled = NO;
        self.layer.cornerRadius = frame.size.height/2.0;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;

}

@end
