//
//  BaseViewController.m
//  link2svc_2d_mobile_ios
//
//  Created by Zeus.Zhang on 2017/10/11.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+DismissKeyboard.h"

@interface BaseViewController () <UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:NAVBACKCOLOR] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]]; //去除导航条下的阴影线条
    [self setNavTitleAttributesWithColor:NAVTITLECOLOR Font:[UIFont boldSystemFontOfSize:18]];
    [self setupForDismissKeyboard];
    
}

//- (void)addFPSLabel {
//    CCLabel *ccLabel = [CCLabel defaultCCLabel];
//    ccLabel.frame = CGRectMake(80, 0, 50, 30);
//    [[UIApplication sharedApplication].keyWindow addSubview:ccLabel];
//}

-(id)init {
    self = [super init];
    if (self) {
        /** 控制视图是否显示Tabbar
        NSLog(@"rootViewController:%@",APP_DELEGATE.window.rootViewController);
        if ([APP_DELEGATE.window.rootViewController isKindOfClass:[UITabBarController class]]) {
            NSLog(@"1234567");
            if ([self isKindOfClass:[LiveViewController class]] ||
                [self isKindOfClass:[MyViewController class]] ||
                [self isKindOfClass:[LiteAppViewController class]] ||
                [self isKindOfClass:[ContentViewController class]]) {
                self.hidesBottomBarWhenPushed = NO;
            }else {
                self.hidesBottomBarWhenPushed = YES;
            }
        }
         **/
    }
    return self;
}

//- (void)setStatusBarBackgroundColor:(UIColor *)color {
//    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
//    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
//        statusBar.backgroundColor = color;
//    }
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    self.tabBarController.tabBar.hidden = YES;
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; //iOS11 解决安全域问题
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (BOOL)shouldBegin {
    return  YES;
}

- (void)setNavTitle:(NSString *)title {
    self.navigationItem.title = title;
}

- (void)setNavTitleAttributesWithColor:(UIColor *)textColor Font:(UIFont *)textFont {
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:textColor,NSForegroundColorAttributeName,textFont,NSFontAttributeName, nil]];
}

-(void)setNavLeftImageIcon:(UIImage *)imageIcon Title:(NSString *)title{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 70, 44);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:NAVTITLECOLOR forState:UIControlStateNormal];
    button.titleLabel.font = NAVFONT;
    button.titleLabel.numberOfLines = 0;
    [button setImage:imageIcon forState:UIControlStateNormal];
    [button addTarget:self action:@selector(navLeftAction) forControlEvents:UIControlEventTouchUpInside];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, button.frame.size.width - imageIcon.size.width)];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

-(void)setNavRightImageIcon:(UIImage *)imageIcon Title:(NSString *)title{
    UIButton *_rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(0, 0, 44, 44);
    [_rightButton setTitle:title forState:UIControlStateNormal];
    [_rightButton setTitleColor:NAVTITLECOLOR forState:UIControlStateNormal];
    _rightButton.titleLabel.font = NAVFONT;
    _rightButton.titleLabel.numberOfLines = 0;
    [_rightButton setImage:imageIcon forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(navRightAction) forControlEvents:UIControlEventTouchUpInside];
    [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, _rightButton.titleLabel.width, 0, -_rightButton.titleLabel.width)];
    _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
}

-(void)setNavLeftItem:(UIBarButtonItem *)item{
    self.navigationItem.leftBarButtonItem = item;
}

-(void)setNavRightItem:(UIBarButtonItem *)item{
    self.navigationItem.rightBarButtonItem = item;
}

-(void)setNavLeftItems:(NSMutableArray *)array{
    self.navigationItem.leftBarButtonItems = array;
}

-(void)setNavRightItems:(NSMutableArray *)array{
    self.navigationItem.rightBarButtonItems = array;
}

#pragma mark -BaseActions
-(void)navLeftAction {
    
}

-(void)navRightAction {
    
}


+ (BOOL)setTabbarItemWithItemTitle:(NSString *)itemTitle
                    ItemTitleColor:(UIColor *)itemTitleColor
            ItemTitleColorSelected:(UIColor *)itemTitleColorSelected
                     ItemTitleFont:(UIFont *)itemTitleFont
                         ItemImage:(UIImage *)itemImage
                 ItemImageSelected:(UIImage *)itemImageSelected
                           AtIndex:(int)index
                      SourceTabbar:(UITabBarController *)sourceTabbar {
    if ([sourceTabbar.tabBar.items count] <= index) {
        return NO;
    }
    
//    [sourceTabbar.tabBar setShadowImage:[UIImage imageNamed:@""]]; //tabbar背景图片
    UITabBarItem *itemModify = [sourceTabbar.tabBar.items objectAtIndex:index];
    [itemModify setTitle:itemTitle];
    [itemModify setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:itemTitleColor,NSForegroundColorAttributeName,itemTitleFont,NSFontAttributeName, nil] forState:UIControlStateNormal];
    [itemModify setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:itemTitleColorSelected,NSForegroundColorAttributeName,itemTitleFont,NSFontAttributeName, nil] forState:UIControlStateSelected];
    [itemModify setImage:[itemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [itemModify setSelectedImage:[itemImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
