//
//  Common.h
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/1.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Common : NSObject


/**
 将指定的视图转换为图片

 @param sourceView 视图
 @return 图片
 */
+ (UIImage *)getImageWithSourceView:(UIView *)sourceView;

/**
 舒适化app语言
 */
+ (void)initUserLanguage;

/**
 获取当前app语言

 @return 当前多语言
 */
+ (NSString *)getUserLanguage;

/**
 调用系统相机

 @param viewController 调用的VC
 */
+ (void)takePhoto:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)viewController;

/**
 调用相册

 @param viewController 调用的VC
 @param edit 是否可裁剪
 */
+ (void)choosePhoto:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)viewController allowsEdit:(BOOL)edit;

/**
 设置textfiled组件左边偏移量

 @param textField textfield
 @param width 偏移量
 */
+ (void)setTextFieldLeftPadding:(UITextField *)textField width:(CGFloat)width;


/**
 获取当前设备的唯一标示码

 @return 标示码
 */
+ (NSString *)getUniqueDeviceIdentifierAsString;

/**
 获取Appname

 @return appName
 */
+ (NSString *)getAppName;

/**
 将string时间转换为date

 @param string 被转换的时间串
 @param formatStr 转换的格式
 @return date
 */
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)formatStr;

/**
 将date转换为时间串

 @param date 被转换的date
 @param formatStr 转换的格式
 @return 时间串
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)formatStr;






@end
