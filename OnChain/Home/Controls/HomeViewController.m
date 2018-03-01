//
//  HomeViewController.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/7.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "HomeViewController.h"
#import "CreateViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self configUI];
}



- (void)configUI {
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"login_bg"];
    [self.view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(self.view);
    }];
    
    UIImageView *logoIV = [[UIImageView alloc] init];
    logoIV.image = [UIImage imageNamed:@"login_logo"];
    [self.view addSubview:logoIV];
    [logoIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(71, 18));
        make.left.mas_equalTo(self.view).offset(20);
        if (KIsiPhoneX) {
            make.top.mas_equalTo(self.view).offset(60);
        } else {
            make.top.mas_equalTo(self.view).offset(40);
        }
    }];
    
    UIButton *importBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    importBtn.backgroundColor = [UIColor clearColor];
    [importBtn setTitle:Localized(@"LoginImport") forState:UIControlStateNormal];
    [importBtn setImage:[UIImage imageNamed:@"login_import"] forState:UIControlStateNormal];
    [importBtn setTitleColor:[UIColor colorWithHexString:@"#3f3f3f"] forState:UIControlStateNormal];
    importBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [importBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 11)];
    [importBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 11, 0, 0)];
    importBtn.layer.cornerRadius = 16;
    importBtn.layer.masksToBounds = YES;
    importBtn.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
    importBtn.layer.borderWidth = 1;
    [importBtn addTarget:self action:@selector(importAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:importBtn];
    
    [importBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 35));
        make.right.mas_equalTo(self.view).offset(-20);
        if (KIsiPhoneX) {
            make.bottom.equalTo(self.view).offset(-40);
        } else {
            make.bottom.equalTo(self.view).offset(-20);
        }
    }];
    
    UIButton *createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn.backgroundColor = [UIColor clearColor];
    [createBtn setTitle:Localized(@"LoginCreate") forState:UIControlStateNormal];
    [createBtn setTitleColor:[UIColor colorWithHexString:@"#3f3f3f"] forState:UIControlStateNormal];
    [createBtn setImage:[UIImage imageNamed:@"login_create"] forState:UIControlStateNormal];
    createBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [createBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 11)];
    [createBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 11, 0, 0)];
    createBtn.layer.cornerRadius = 16;
    createBtn.layer.masksToBounds = YES;
    createBtn.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
    createBtn.layer.borderWidth = 1;
    [createBtn addTarget:self action:@selector(createAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createBtn];
    
    [createBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 35));
        make.left.mas_equalTo(self.view).offset(20);
        if (KIsiPhoneX) {
            make.bottom.equalTo(self.view).offset(-40);
        } else {
            make.bottom.equalTo(self.view).offset(-20);
        }
    }];
}



- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
//    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}

- (void)importAction {
    
}

- (void)createAction {
    CreateViewController *control = [[CreateViewController alloc] init];
    [self.navigationController pushViewController:control animated:YES];
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
