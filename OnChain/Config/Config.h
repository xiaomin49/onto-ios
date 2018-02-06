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

//Nav、Tab颜色字体
#define NAVBACKCOLOR [UIColor colorWithHexString:@"#212121"]
#define NAVTITLECOLOR [UIColor colorWithHexString:@"#ffffff"]
#define NAVFONT [UIFont systemFontOfSize:14.0]
#define MAINBACKCOLOR [UIColor colorWithHexString:@"#ffffff"]
#define TABBARTITLECOLOR [UIColor colorWithHexString:@"#ffffff"]
#define TABBARTITLECOLORSELECTED [UIColor colorWithHexString:@"#3E84E0"]
#define TABITEMFONT [UIFont systemFontOfSize:10.0]

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


#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//屏幕宽高
#define SYSHeight [UIScreen mainScreen].bounds.size.height
#define SYSWidth  [UIScreen mainScreen].bounds.size.width

#endif /* Config_h */
