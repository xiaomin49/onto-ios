//
//  Config.h
//  OnChain
//
//  Created by Zeus.Zhang on 2018/1/31.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#ifndef Config_h
#define Config_h

#import <YYKit.h>
#import <AFNetworking.h>
#import "AppDelegate.h"
#import "BaseNavigationViewController.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "Common.h"
#import "UIViewController+HUD.h"
#import "UIImage+LXQRCode.h"

//Nav、Tab颜色字体
#define NAVBACKCOLOR [UIColor colorWithHexString:@"#FFFFFF"]
#define NAVTITLECOLOR [UIColor colorWithHexString:@"#3e3e3e"]
#define NAVFONT [UIFont systemFontOfSize:10.0]
#define MAINBACKCOLOR [UIColor colorWithHexString:@"#212121"]
#define TABBARTITLECOLOR [UIColor colorWithHexString:@"#212121"]
#define TABBARTITLECOLORSELECTED [UIColor colorWithHexString:@"#33A4BE"]
#define TABITEMFONT [UIFont systemFontOfSize:10.0]

#define MAINAPPCOLOR [UIColor colorWithHexString:@"#20c0db"]

#define HUGEFONT [UIFont systemFontOfSize:20]
#define LARGEFONT [UIFont systemFontOfSize:18]
#define MIDDLEFONT [UIFont systemFontOfSize:16]
#define DEFAULTFONT [UIFont systemFontOfSize:14]
#define LITTLEFONT [UIFont systemFontOfSize:12]

//Tabbar图片
#define TABONEIMAGE [UIImage imageNamed:@"tab_video"]
#define TABONEIMAGESELECTED [UIImage imageNamed:@"tab_video_selected"]
#define TABTWOIMAGE [UIImage imageNamed:@"tab_live"]
#define TABTWOIMAGESELECTED [UIImage imageNamed:@"tab_live_selected"]
#define TABTHREEIMAGE [UIImage imageNamed:@"tab_liteApp"]
#define TABTHREEIMAGESELECTED [UIImage imageNamed:@"tab_liteApp_selected"]
#define TABFOURIMAGE [UIImage imageNamed:@"tab_me"]
#define TABFOURIMAGESELECTED [UIImage imageNamed:@"tab_me_selected"]

//国际化
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"InfoPlist"]

//iPhone X
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//屏幕宽高
#define SYSHeight [UIScreen mainScreen].bounds.size.height
#define SYSWidth  [UIScreen mainScreen].bounds.size.width

#endif /* Config_h */
