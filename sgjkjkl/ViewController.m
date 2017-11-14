//
//  ViewController.m
//  sgjkjkl
//
//  Created by kobe on 17/11/13.
//  Copyright © 2017年 kobe. All rights reserved.
//

#import "ViewController.h"
//导入头文件，定义WebView 为属性
#import <JavaScriptCore/JavaScriptCore.h>
#import "MyBridge.h"

#define SCREENWIDTH   self.view.frame.size.width
#define SCREENHEIGHT  self.view.frame.size.height

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)JSContext *jsContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    self.webView=[[UIWebView alloc]init];
    //初始化webView
    self.webView=[[UIWebView alloc]init];
    self.webView.frame=self.view.frame;
    //BOOL值  是否适应iphone屏幕
    self.webView.scalesPageToFit=YES;
    //设置webView 的代理为当前视图控制器(可别忘了遵守协议)
    self.webView.delegate=self;
    //加载在视图上
    [self.view addSubview:self.webView];
    
    //给一个url,用webView加载
    NSString *httpStr=@"http://www.lishe.cn/wshop.php/activity/chuju";
    
    NSURL *url=[NSURL URLWithString:httpStr];
    
    NSURLRequest *httpRequest=[NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:httpRequest];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{

    self.jsContext= [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    MyBridge *myBridge = [[MyBridge alloc] init];
    _jsContext[@"doApp"] = myBridge;
    myBridge.jsContext = _jsContext;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
