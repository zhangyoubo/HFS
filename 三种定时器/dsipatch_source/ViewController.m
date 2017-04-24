//
//  ViewController.m
//  dsipatch_source
//
//  Created by 张友波 on 17/4/13.
//  Copyright © 2017年 张友波. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    dispatch_source_t _timer;
    dispatch_queue_t _queue;
    BOOL isResume;
    
    NSTimer *timer;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self creatDisplayLink];
//    [self creatTimer];
    //[self setSourceTimer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSTimer
-(void)creatDisplayLink{
    // 创建displayLink
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(test)];
    // 将创建的displaylink添加到runloop中，否则定时器不会执行
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
//    // 停止定时器
//    [displayLink invalidate];
//    displayLink = nil;
}

#pragma mark - NSTimer
-(void)creatTimer{
    /**
     *  方式1
     */
    
    // 创建定时器
//    timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    // 两种启动方式都可以
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //[timer fire];
    
    /**
     *  方式2
     */
    // 创建定时器
    timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(test) userInfo:nil repeats:YES];
   // [timer fire]; 这种不行
//    // 将定时器添加到runloop中，否则定时器不会启动
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
       
}

-(void)test{
    NSLog(@"NSTimer 在这里执行事件");
}

#pragma mark - GCD
-(void)setSourceTimer{
    NSTimeInterval period = 0.3; //设置时间间隔
    _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每0.3秒执行
    dispatch_source_set_event_handler(_timer, ^{
      
        NSLog(@"GCD 在这里执行事件");
    });
}

- (IBAction)resumeEvent:(id)sender {
    if (isResume) {
        return;
    }
    isResume = YES;
    dispatch_resume(_timer);
}

- (IBAction)suspendEvent:(id)sender {
    dispatch_suspend(_timer);
}

@end









