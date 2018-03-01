//
//  CreateView.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/24.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "CreateView.h"
#import "Config.h"

@implementation CreateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)setQrcode_str:(NSString *)qrcode_str {
    _imageV.image = [UIImage LX_ImageOfQRFromURL:qrcode_str codeSize:200];
}

- (void)configUI {
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self addSubview:_imageV];
    UIButton *backupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backupBtn setTitle:@"Back up account" forState:UIControlStateNormal];
    [backupBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    backupBtn.titleLabel.font = MIDDLEFONT;
    backupBtn.backgroundColor = MAINAPPCOLOR;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
