//
//  PwdEnterView.h
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/14.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PwdEnterView : UIView <UITextFieldDelegate>

@property (nonatomic, copy) void(^callbackPwd)(NSString *);

- (void)clearPassword;

@end
