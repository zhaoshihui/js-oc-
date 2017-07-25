//
//  ViewController.m
//  js与oc交互
//
//  Created by Scarlett on 2017/7/12.
//  Copyright © 2017年 Scarlett Zhao. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeContactAdd];
    rightItem.frame = CGRectMake(100, 350, 100, 50);
    [rightItem setTitle:@"调js" forState:UIControlStateNormal];
    [self.view addSubview:rightItem];
    [rightItem addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    
    //webview
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 30, 200, 300)];
    _webView.delegate = self;
    
//    NSString *basePath = [[NSBundle mainBundle] bundlePath];
//    NSString *helpHtmlPath = [basePath stringByAppendingPathComponent:@"ui.html"];
    
//    NSURL *url = [NSURL fileURLWithPath:helpHtmlPath];
//    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSString *htmlPath = [path stringByAppendingString:@"ui.html"];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:htmlPath]]];
    
    NSURL *url = [NSURL URLWithString:@"file:///Users/Loneway/Desktop/js_html/ui.html"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:_webView];
    
}

-(void)click{
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *str = @"调js的方法成功了吗？";
    NSString *textJS = [NSString stringWithFormat:@"showAlert('%@')",str];
    [context evaluateScript:textJS];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    NSString *resultstr = @"{\"data\":{\"nli\":[{\"desc_obj\":{\"result\":\"请问你想要看哪个频道？\",\"type\":\"tvprogram\",\"status\":\"0\"},\"type\":\"question\"}]},\"status\":\"ok\"}";
    NSLog(@"result=%@",resultstr);
    
    NSString *textJS = [NSString stringWithFormat:@"refresh_show_trigger('%@')",resultstr];
    [context evaluateScript:textJS];

}

//-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *str = @"调js的方法成功了吗？";
//    NSString *textJS = [NSString stringWithFormat:@"showAlert('%@')",str];
//    [context evaluateScript:textJS];
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
