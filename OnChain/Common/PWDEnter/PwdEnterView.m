//
//  PwdEnterView.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/14.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "PwdEnterView.h"
#import "Config.h"

#define kDotSize CGSizeMake (10, 10) //密码点的大小
#define kDotCount 6  //密码个数
#define K_Field_Height 40  //每一个输入框的高度等于当前view的高度
#define LineWidth (kScreenWidth - 56 - 210) / 5

@interface PwdEnterView ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableArray *dotArray;


@end

@implementation PwdEnterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPwdTextField];
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initPwdTextField];
    }
    return self;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 56, K_Field_Height)];
        _textField.backgroundColor = [UIColor whiteColor];
        //输入的文字颜色为白色
        _textField.textColor = [UIColor whiteColor];
        //输入框光标的颜色为白色
        _textField.tintColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_textField];
    }
    return _textField;
}

- (void)textFieldDidChange:(UITextField *)textField
{
    for (UIView *dotView in self.dotArray) {
        dotView.hidden = YES;
    }
    for (int i = 0; i < textField.text.length; i++) {
        ((UIView *)[self.dotArray objectAtIndex:i]).hidden = NO;
    }
    if (textField.text.length == kDotCount) {
        NSLog(@"输入完毕");
        [textField resignFirstResponder];
        _callbackPwd(textField.text);
    }
}

- (void)initPwdTextField {
    CGFloat width = 35;
    
    for (int i = 0; i < kDotCount - 1; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textField.frame) + (i+1) * width + i * LineWidth, 0, LineWidth, K_Field_Height)];
        lineView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        [self addSubview:lineView];
    }
    
    self.dotArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < kDotCount; i++) {
        UIView *dotView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textField.frame) + i * (width + LineWidth) + width / 2 - 5, K_Field_Height / 2 - 5, kDotSize.width, kDotSize.height)];
        dotView.backgroundColor = [UIColor blackColor];
        dotView.layer.cornerRadius = kDotSize.width / 2.0f;
        dotView.clipsToBounds = YES;
        dotView.hidden = YES; //先隐藏
        [self addSubview:dotView];
        [self.dotArray addObject:dotView];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textField.frame) + i *(width + LineWidth), CGRectGetMaxY(self.textField.frame) - 1, width, 1)];
        line.backgroundColor = MAINAPPCOLOR;
        [self addSubview:line];
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    } else if(string.length == 0) {
        //判断是不是删除键
        return YES;
    }
    else if(textField.text.length >= kDotCount) {
        //输入的字符个数大于6，则无法继续输入，返回NO表示禁止输入
        NSLog(@"输入的字符个数大于6，忽略输入");
        return NO;
    } else {
        return YES;
    }
}

- (void)clearPassword
{
    self.textField.text = @"";
    [self textFieldDidChange:self.textField];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
