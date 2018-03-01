//
//  BrowserView.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/22.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "BrowserView.h"

@implementation BrowserView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.wkWebView];
    }
    return self;
}

- (WKWebView *)wkWebView {
    if (!_wkWebView) {
        WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
        configuration.preferences = [WKPreferences new];
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        configuration.preferences.javaScriptEnabled = YES;
        
        configuration.userContentController = [[WKUserContentController alloc] init];
        [configuration.userContentController addScriptMessageHandler:self name:@"getWalletDataStr"];
        
        _wkWebView = [[WKWebView alloc] initWithFrame:self.frame configuration:configuration];
        _wkWebView.UIDelegate = self;
        _wkWebView.navigationDelegate = self;
        NSString *webPath = [[NSBundle mainBundle] pathForResource:@"js" ofType:nil];
        [_wkWebView loadFileURL:[NSURL fileURLWithPath:[webPath stringByAppendingPathComponent:@"test.html"]] allowingReadAccessToURL:[NSURL fileURLWithPath:webPath]];
    }
    return _wkWebView;
}


#pragma mark WKWebViewDelegate
/**
 webview加载完成
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"js finish！！！");
}

/**
 webview开始加载
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"js start！！！");
}

/**
 webview拦截alert
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"alert%@",message);
    completionHandler();
}

/**
 webview拦截Confirm
 */
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"confirm%@",message);
    completionHandler(YES);
}

/**
 webview拦截Prompt
 */
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    NSLog(@"prompt===%@",prompt);
    [self savePrompt:prompt];
    completionHandler(@"123");
}

/**
 webview拦截js方法
 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"message:%@",message);
}

#pragma mark handlePrompt
- (void)savePrompt:(NSString *)prompt {
    if ([prompt hasPrefix:@"Ont://"]) {
        prompt = [prompt substringFromIndex:6];
        _callbackPrompt(prompt);
    }
    
}


@end









