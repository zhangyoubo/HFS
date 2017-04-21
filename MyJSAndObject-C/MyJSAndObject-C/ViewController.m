//
//  ViewController.m
//  MyJSAndObject-C
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 zf. All rights reserved.
//

#define WWW [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *MYWebView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MYWebView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 100, WWW, 200)];
    MYWebView.delegate=self;
    [MYWebView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle]URLForResource:@"test" withExtension:@"html"]]];
    
    [MYWebView stringByEvaluatingJavaScriptFromString:[NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"test" withExtension:@"js"] encoding:NSUTF8StringEncoding error:nil]];
    
    [self.view addSubview:MYWebView];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *path=[[request URL] absoluteString];
    
    NSLog(@"\n\npath...........%@\n\n",path);
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MYWebView stringByEvaluatingJavaScriptFromString:@"setImageClickFunction()"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
