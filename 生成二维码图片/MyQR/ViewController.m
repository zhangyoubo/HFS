//
//  ViewController.m
//  MyQR
//
//  Created by Apple on 16/1/12.
//  Copyright (c) 2016年 zf. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeGenerator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    UIImage *image=[QRCodeGenerator qrImageForString:@"http://www.baidu.com" imageSize:300];
    
    imageView.image=image;
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
