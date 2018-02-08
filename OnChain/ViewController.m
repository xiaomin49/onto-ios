//
//  ViewController.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/1/31.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "ViewController.h"
//#import <MiniVisionAuthorization/MiniVisionAuthorization.h>

@interface ViewController () ///<>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 100, 100);
//    [btn setTitle:@"活体检测" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

//- (void)btnClick {
//    Class rootClass = NSClassFromString(@"MiniVision");
//    if (rootClass) {
//        id object = [MiniVision sharedInstance];
//        ((MiniVision *)object).delegate = self;
//        [(MiniVision *)object startLiveBodyWithAccount:@"renlian" password:@"renlian1"];
//    }
//}

+ (void)gotoGuideVC {
    
}

+ (void)gotoHomeVC {
    
}

+ (void)gotoIdentityVC {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)didFinishAuthorizationWithResult1:(NSString *)result1 andResult2:(NSString *)result2 andResult3:(NSString *)result3 {
//    NSString *str = [NSString stringWithFormat:@"result1 = %@ \n result2 = %@ \n result3 = %@", result1, result2, result3];
//    NSLog(@"检测结果:%@",str);
//}

@end
