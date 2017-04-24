//
//  ViewController.m
//  摇一摇
//
//  Created by 张友波 on 17/2/9.
//  Copyright © 2017年 张友波. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"摇一摇";
    self.view.backgroundColor= [UIColor whiteColor];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 检测到摇动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event{
    NSLog(@"摇动开始!");
    // 解释：kSystemSoundID_Vibrate为系统提供的震动的ID。
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
// 摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event{
    if (event.subtype == UIEventSubtypeMotionShake) { // 判断是否是摇动结束
        NSLog(@"摇动结束!");
    }
}
// 摇动取消
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event{
    NSLog(@"摇动取消!");
}


@end














