//
//  ViewController.m
//  CSwitchButton
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "ViewController.h"
#import "CSwitchButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CSwitchButton *bbb = [[CSwitchButton alloc] initWithFrame:CGRectMake(200, 300, 75, 75)];
    [self.view addSubview:bbb];
    
    bbb.pictureBlock = ^(){
        NSLog(@"拍照");
    };
    
    bbb.startMovieBlock = ^(){
        NSLog(@"摄像开始");
    };
    
    bbb.endMovieBlock = ^(float time){
        NSLog(@"摄像结束%f", time);
    };
    
    bbb.cancelMovieBlock = ^(){
        NSLog(@"取消摄像");
    };
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
