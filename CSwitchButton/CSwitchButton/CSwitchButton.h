//
//  CSwitchButtom.h
//  CSwitchButton
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSwitchButton : UIControl

@property (assign, nonatomic) float touchTime;                  // 触摸时间
@property (copy, nonatomic) void(^pictureBlock)();              // 拍照
@property (copy, nonatomic) void(^startMovieBlock)();           // 开始摄像
@property (copy, nonatomic) void(^endMovieBlock)(float);        // 结束摄像
@property (copy, nonatomic) void(^cancelMovieBlock)();          // 取消摄像

@end
