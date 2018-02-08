//
//  BaseViewController.h
//  link2svc_2d_mobile_ios
//
//  Created by Zeus.Zhang on 2017/10/11.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"


@interface BaseViewController : UIViewController

- (BOOL)shouldBegin;

- (void)setNavTitle:(NSString *)title;

- (void)setNavTitleAttributesWithColor:(UIColor *)textColor Font:(UIFont *)textFont;

- (void)setNavLeftImageIcon:(UIImage *)imageIcon Title:(NSString *)title;

-(void)setNavRightImageIcon:(UIImage *)imageIcon Title:(NSString *)title;

- (void)setNavLeftItem:(UIBarButtonItem *)item;

- (void)setNavRightItem:(UIBarButtonItem *)item;

- (void)setNavLeftItems:(NSMutableArray *)array;

//- (void)setStatusBarBackgroundColor:(UIColor *)color;


+ (BOOL)setTabbarItemWithItemTitle:(NSString *)itemTitle
                    ItemTitleColor:(UIColor *)itemTitleColor
            ItemTitleColorSelected:(UIColor *)itemTitleColorSelected
                     ItemTitleFont:(UIFont *)itemTitleFont
                         ItemImage:(UIImage *)itemImage
                 ItemImageSelected:(UIImage *)itemImageSelected
                           AtIndex:(int)index
                      SourceTabbar:(UITabBarController *)sourceTabbar;

@end
