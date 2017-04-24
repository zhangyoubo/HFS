//
//  AppDelegate.m
//  dsipatch_source
//
//  Created by 张友波 on 17/4/13.
//  Copyright © 2017年 张友波. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //用NSObject的方法创建一个多线程
  
    [self performSelectorInBackground:@selector(multiThread) withObject:nil];
   
    self.window.backgroundColor = [UIColor whiteColor];
  
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)multiThread
{
    
    if (![NSThread isMainThread]) {
        // 第1种方式
   
        //此种方式创建的timer已经添加至runloop中
      
        //        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
      
        //保持线程为活动状态，才能保证定时器执行
     
        //        [[NSRunLoop currentRunLoop] run];//已经将nstimer添加到NSRunloop中了
      
        //第2种方式
       
        //此种方式创建的timer没有添加至runloop中
      
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
      
        //将定时器添加到runloop中
        
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
      
        [[NSRunLoop currentRunLoop] run];
      
        NSLog(@"多线程结束");
      
    }
 
}



- (void)timerAction

{
    //定时器也是在子线程中执行的
   
    if (![NSThread isMainThread]) {
       
        NSLog(@"定时器");
      
    }
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
