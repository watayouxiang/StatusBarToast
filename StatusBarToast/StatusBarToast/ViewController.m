//
//  ViewController.m
//  StatusBarToast
//
//  Created by 王涛 on 16/7/27.
//  Copyright © 2016年 wata. All rights reserved.
//

#import "ViewController.h"
#import "ttStatusBarToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showTxt:(id)sender {
    [ttStatusBarToast showMessage:@"O(∩_∩)O哈哈~"];
}

- (IBAction)showSuccess:(id)sender {
    [ttStatusBarToast showSuccess:@"登录成功"];
}

- (IBAction)showError:(id)sender {
    [ttStatusBarToast showError:@"登录失败"];
}

- (IBAction)showProgress:(id)sender {
    [ttStatusBarToast showLoading:@"正在加载数据..."];
}

- (IBAction)hideWindow:(id)sender {
    [ttStatusBarToast hide];
}

- (IBAction)showMsg:(id)sender {
    [ttStatusBarToast showMessage:@"显示自定义的图片" image:[UIImage imageNamed:@"rabbit"]];
}

@end
