//
//  BottomLayer.m
//  CSwitchButton
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "BottomLayer.h"

@implementation BottomLayer

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self != nil) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;

}

- (void)setEndAngle:(float)endAngle {

    _endAngle = endAngle;
    
    [self setNeedsDisplay];

}


- (void)drawRect:(CGRect)rect {

    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(self.bounds.size.height/2.0, self.bounds.size.height/2.0);
    float radius = self.bounds.size.height/2.0-2;
    float startAngle = -M_PI_2;
    float endAngle = _endAngle - M_PI_2;
    //创建圆形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:startAngle
                                                      endAngle:endAngle
                                                     clockwise:YES];
    CGContextSetLineWidth(contextRef, 4);
    [[UIColor colorWithRed:29/255.0 green:161/255.0 blue:243/255.0 alpha:1] setStroke];
    CGContextAddPath(contextRef, path.CGPath);
    CGContextStrokePath(contextRef);

}


@end
