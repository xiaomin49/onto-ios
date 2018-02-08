//
//  BaseNavigationViewController.m
//  link2svc_2d_mobile_ios
//
//  Created by Zeus.Zhang on 2017/10/11.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "BaseViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.interactivePopGestureRecognizer.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    BOOL ok = YES;
    if ([self.topViewController isKindOfClass:[BaseViewController class]]) {
        if ([self.topViewController respondsToSelector:@selector(shouldBegin)]) {
            BaseViewController *control = (BaseViewController *)self.topViewController;
            ok = [control shouldBegin];
        }
    }
    return ok;
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
