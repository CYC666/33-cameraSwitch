//
//  CSwitchButtom.m
//  CSwitchButton
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "CSwitchButton.h"
#import "BottomLayer.h"
#import "TopLayer.h"

@interface CSwitchButton () {
    
    NSTimer *_timer;
    BOOL _isMovie;
    float _endAngle;
    
    BottomLayer *_bottomLayer;  // 底部
    TopLayer *_topLayer;     // 顶部
    
    
}

@end

@implementation CSwitchButton

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self != nil) {
        self.backgroundColor = [UIColor colorWithRed:207/255.0 green:206/255.0 blue:200/255.0 alpha:.8];
        self.layer.cornerRadius = self.frame.size.height/2.0;
        _bottomLayer = [[BottomLayer alloc] initWithFrame:self.bounds];
        [self addSubview:_bottomLayer];
        _topLayer = [[TopLayer alloc] initWithFrame:self.bounds];
        _topLayer.transform = CGAffineTransformMakeScale(0.75, 0.75);
        [self addSubview:_topLayer];
        
    }
    return self;

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    _touchTime = 0;
    _startMovieBlock();
    _timer = [NSTimer scheduledTimerWithTimeInterval:.02
                                             repeats:YES
                                               block:^(NSTimer * _Nonnull timer) {
                                                   _touchTime += 0.02;
                                                   
                                                   // 正在摄像
                                                   if (_touchTime > 0.5) {
                                                       [UIView animateWithDuration:.35
                                                                        animations:^{
                                                                            self.transform = CGAffineTransformMakeScale(1.3, 1.3);
                                                                            _topLayer.transform = CGAffineTransformMakeScale(0.3, 0.3);
                                                                        }];
                                                       _bottomLayer.endAngle = M_PI * 2 * ((_touchTime - 0.5)/10);
                                                   }
                                                   
                                                   if (_touchTime > 10.5) {
                                                       // 结束
                                                       [_timer invalidate];
                                                       
                                                   }
                                               }];
    
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (_touchTime < 0.5) {
        // 触发拍照
        _pictureBlock();
        _cancelMovieBlock();
    } else {
        // 结束摄像
        __block float time = _touchTime;
        _endMovieBlock(time);
    }
    
    [_timer invalidate];
    _timer = nil;
    
    _bottomLayer.endAngle = 0;
    
    [UIView animateWithDuration:.35
                     animations:^{
                         self.transform = CGAffineTransformIdentity;
                         _topLayer.transform = CGAffineTransformMakeScale(0.8, 0.8);
                     }];
    
}



@end
