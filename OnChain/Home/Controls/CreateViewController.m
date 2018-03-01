//
//  CreateViewController.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/7.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "CreateViewController.h"
#import "PwdEnterView.h"
#import "BrowserView.h"
#import "CreateView.h"

typedef NS_ENUM(NSInteger, PWDType) {
    PWDTypeDefault,
    PWDTypeNext,
};

@interface CreateViewController ()

@property (nonatomic, strong) PwdEnterView *pwdView;
@property (nonatomic, strong) UITextField *nameF;
@property (nonatomic, strong) UILabel *pwdL;
@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, assign) PWDType type;
@property (nonatomic, copy) NSString *pwdString;
@property (nonatomic, copy) NSString *tempString;
@property (nonatomic, strong) BrowserView *browserView;
@property (nonatomic, strong) CreateView *createView;

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self configNav];
    [self configUI];
    [self configBrowserView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
}

- (void)configNav {
    [self setNavTitle:@"Create an account"];
    [self setNavLeftImageIcon:[UIImage imageNamed:@"nav_back"] Title:@"Back"];
}

- (void)configUI {
    
    UILabel *nameL = [[UILabel alloc] init];
    nameL.font = [UIFont boldSystemFontOfSize:11];
    nameL.textColor = NAVTITLECOLOR;
    nameL.text = Localized(@"LoginEnterName");
    [self.view addSubview:nameL];
    
    self.nameF = [[UITextField alloc] init];
    self.nameF.borderStyle = UITextBorderStyleNone;
    self.nameF.backgroundColor = [UIColor whiteColor];
    self.nameF.font = HUGEFONT;
    [Common setTextFieldLeftPadding:self.nameF width:10];
    [self.view addSubview:self.nameF];
    
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(42);
        make.left.equalTo(self.nameF);
    }];

    [self.nameF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(nameL.mas_bottom).offset(48);
        make.size.mas_equalTo(CGSizeMake((kScreenWidth - 56), 40));
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = MAINAPPCOLOR;
    [self.view addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.nameF);
        make.height.mas_equalTo(@1);
    }];
    
    self.pwdL = [[UILabel alloc] init];
    self.pwdL.font = [UIFont boldSystemFontOfSize:11];
    self.pwdL.textColor = NAVTITLECOLOR;
    self.pwdL.text = @"Set a password";
    [self.view addSubview:self.pwdL];

    [self.pwdL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameL);
        make.top.equalTo(self.nameF.mas_bottom).offset(48);
    }];
    
    self.pwdView = [[PwdEnterView alloc] initWithFrame:CGRectZero];
    __weak typeof(self) weakself = self;
    [self.pwdView setCallbackPwd:^(NSString *pwd_text) {
        weakself.tempString = pwd_text;
        if (weakself.pwdString.length > 0) {
            if ([weakself.pwdString isEqualToString:pwd_text]) {
                
            } else {
                [weakself showHint:@"the password you entered not match" yOffset:-200];
                [weakself.pwdView clearPassword];
            }
        }
    }];
    [self.view addSubview:self.pwdView];
    
    
    [self.pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.pwdL.mas_bottom).offset(48);
        make.height.mas_equalTo(@40);
        make.left.right.mas_equalTo(self.nameF);
    }];
    [self.pwdView layoutIfNeeded];
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn setImage:[UIImage imageNamed:@"login_checkbox"] forState:UIControlStateNormal];
    [self.nextBtn setImage:[UIImage imageNamed:@"login_checked"] forState:UIControlStateSelected];
    [self.view addSubview:self.nextBtn];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(16, 16));
        make.left.equalTo(self.view).offset(30);
        make.top.mas_equalTo(self.pwdView.mas_bottom).offset(65);
    }];
    
    UILabel *checkL = [[UILabel alloc] init];
    checkL.numberOfLines = 2;
    checkL.font = [UIFont systemFontOfSize:10];
    checkL.textColor = [UIColor colorWithHexString:@"#5e5e5e"];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:Localized(@"LoginService")];
    [str addAttribute:NSForegroundColorAttributeName value:MAINAPPCOLOR range:NSMakeRange(str.length - 16, 16)];
    checkL.attributedText = str;
    [self.view addSubview:checkL];
    
    [checkL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nextBtn);
        make.top.equalTo(self.pwdView.mas_bottom).offset(58);
        make.left.equalTo(self.nextBtn.mas_right).offset(17);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(@23);
    }];
    
    UIImageView *questionIV = [[UIImageView alloc] init];
    questionIV.image = [UIImage imageNamed:@"login_question"];
    [self.view addSubview:questionIV];
    
    [questionIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.right.equalTo(self.view).offset(-28);
        make.centerY.mas_equalTo(self.nextBtn);
    }];
}

- (void)nextAction:(UIButton *)btn {
    btn.selected = !btn.selected;
    
    
//    if (self.tempString.length == 6) {
//        if (self.type == PWDTypeDefault) {
//            self.type = PWDTypeNext;
//            [self.pwdView clearPassword];
//            self.pwdString = self.tempString;
//            self.tempString = @"";
//        } else {
//            [self.browserView.wkWebView evaluateJavaScript:@"Ont.SDK.createWallet('zhangsan', '123426','getWalletDataStr')" completionHandler:nil];
//        }
//    }
}

- (void)setType:(PWDType)type {
    _type = type;
    if (_type == PWDTypeNext) {
        [self.nextBtn setTitle:@"Sure" forState:UIControlStateNormal];
        self.pwdL.text = @"Retype the password";
    } else {
        [self.nextBtn setTitle:@"Next" forState:UIControlStateNormal];
        self.pwdL.text = @"Set a password";
    }
}

#pragma mark baseAction
- (void)navLeftAction {
    if (self.type == PWDTypeNext) {
        self.type = PWDTypeDefault;
        self.pwdString = @"";
        [self.pwdView clearPassword];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)configBrowserView {
    [self.view addSubview:self.browserView];
}

- (BrowserView *)browserView {
    if (!_browserView) {
        _browserView = [[BrowserView alloc] initWithFrame:CGRectZero];
        __weak typeof(self) weakSelf = self;
        [_browserView setCallbackPrompt:^(NSString *prompt) {
            NSLog(@"prompt=%@",prompt);
            [weakSelf handlePrompt:prompt];
            [weakSelf.view addSubview:weakSelf.createView];
            weakSelf.createView.qrcode_str = prompt;
            [weakSelf.createView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.mas_equalTo(weakSelf.view);
            }];
        }];
    }
    return _browserView;
}

- (CreateView *)createView {
    if (!_createView) {
        _createView = [[CreateView alloc] initWithFrame:self.view.frame];
        _createView.backgroundColor = [UIColor whiteColor];
    }
    return _createView;
}

- (void)handlePrompt:(NSString *)prompt {
    if ([prompt hasPrefix:@"getWalletDataStr"]) { //创建身份账户
        NSArray *promptArray = [prompt componentsSeparatedByString:@"params="];
        NSString *resultStr = promptArray[1];
        //todo saveResult
        id obj = [NSJSONSerialization JSONObjectWithData:[resultStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        NSLog(@"%@",obj);
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSArray *identities = [obj valueForKey:@"identities"];
            NSData *identities_data=[NSJSONSerialization dataWithJSONObject:identities options:NSJSONWritingPrettyPrinted error:nil];
            NSString *identities_json=[[NSString alloc] initWithData:identities_data encoding:NSUTF8StringEncoding];
            
            NSString *encryptedPrivateKey = [[[identities[0] valueForKey:@"controls"] objectAtIndex:0] valueForKey:@"key"];
            NSString *ontid = [identities[0] valueForKey:@"ontid"];
            
            NSString *qrcode_str = [NSString stringWithFormat:@"%@&%@&%@",identities_json,encryptedPrivateKey,ontid];
            NSLog(@"qrcode_str=%@",qrcode_str);
        }
    }
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
