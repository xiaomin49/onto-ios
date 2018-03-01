//
//  Common.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/1.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "Common.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <SAMKeychain.h>
#import "Config.h"

#define HomeLanguage @"userLanguage"

@implementation Common

+ (UIImage *)getImageWithSourceView:(UIView *)sourceView {
    UIGraphicsBeginImageContext(sourceView.bounds.size);
    [sourceView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

+ (void)initUserLanguage {
    NSString *language = [NSLocale preferredLanguages][0];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if ([language hasPrefix:@"en"]) {
        [userDefault setValue:@"en" forKey:HomeLanguage];
    } else {
        [userDefault setValue:@"zh-Hans" forKey:HomeLanguage];
    }
    [userDefault synchronize];
}

+ (NSString *)getUserLanguage {
    return [[NSUserDefaults standardUserDefaults] valueForKey:HomeLanguage];
}

+ (void)takePhoto:(id<UINavigationControllerDelegate,UIImagePickerControllerDelegate>)viewController {
    [self acquireVideoAuth:^(BOOL grant) {
        if (grant) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
                cameraUI.delegate = viewController;
                cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
                cameraUI.allowsEditing = YES;
                [(UIViewController *)viewController presentViewController:cameraUI animated:YES completion:nil];
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"摄像头不可用" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:alertAction];
                [APP_DELEGATE.window.rootViewController presentViewController:alert animated:YES completion:nil];
            }
        }
    }];
}

+ (void)choosePhoto:(id<UINavigationControllerDelegate,UIImagePickerControllerDelegate>)viewController allowsEdit:(BOOL)edit {
    PHAuthorizationStatus author = [PHPhotoLibrary authorizationStatus];
    if (author == PHAuthorizationStatusRestricted ||
        author == PHAuthorizationStatusDenied) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"获取授权" message:[NSString stringWithFormat:@"您已关闭了相册访问，请前往（设置-隐私-照片-%@）",@"111"] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        [APP_DELEGATE.window.rootViewController presentViewController:alert animated:YES completion:nil];
    } else {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.delegate = viewController;
            picker.allowsEditing = edit;
            [(UIViewController *)viewController presentViewController:picker animated:YES completion:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"无法访问相册" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:alertAction];
            [APP_DELEGATE.window.rootViewController presentViewController:alert animated:YES completion:nil];
        }
    }
}

+ (void)acquireVideoAuth:(void(^)(BOOL grant))block {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                block(YES);
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"获取授权" message:[NSString stringWithFormat:@"您已关闭了相机访问，请前往（设置-隐私-相机-%@）",@"111"] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:alertAction];
                [APP_DELEGATE.window.rootViewController presentViewController:alert animated:YES completion:nil];
                block(NO);
            }
        });
    }];
}

+ (void)setTextFieldLeftPadding:(UITextField *)textField width:(CGFloat)width {
    CGRect frame = textField.frame;
    frame.size.width = width;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftView;
}

+ (NSString *)getUniqueDeviceIdentifierAsString {
    NSString *appName = [self getAppName];
    NSString *strApplicationUUID = [SAMKeychain passwordForService:appName account:@"incoding"];
    if (strApplicationUUID == nil) {
        strApplicationUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        
        NSError *error = nil;
        SAMKeychainQuery *query = [[SAMKeychainQuery alloc] init];
        query.service = appName;
        query.account = @"incoding";
        query.password = strApplicationUUID;
        query.synchronizationMode = SAMKeychainQuerySynchronizationModeNo;
        [query save:&error];
    }
    return strApplicationUUID;
}

+ (NSString *)getAppName {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleDisplayName"];
}

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)formatStr {
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:formatStr];
    return [format dateFromString:string];
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)formatStr {
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:formatStr];
    return  [format stringFromDate:date];
}

@end












