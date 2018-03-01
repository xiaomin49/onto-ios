//
//  BrowserView.h
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/22.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface BrowserView : UIView <WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, copy) void(^callbackPrompt)(NSString *);

@end
