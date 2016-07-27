//
//  ttStatusBarToast.m
//  StatusBarToast
//
//  Created by 王涛 on 16/7/27.
//  Copyright © 2016年 wata. All rights reserved.
//

#import "ttStatusBarToast.h"

#define ttMessageFont [UIFont systemFontOfSize:12]

static CGFloat const ttMessageDuration = 2.0;//消息停留时间
static CGFloat const ttAnimationDuration = 0.25;//消息动画时间

static UIWindow *window_;
static NSTimer *timer_;

@implementation ttStatusBarToast

/**
 *  显示文字
 *
 *  @param msg 文字内容
 */
+ (void)showMessage:(NSString *)msg {
    [self showMessage:msg image:nil];
}

/**
 *  显示成功
 *
 *  @param msg 成功描述
 */
+ (void)showSuccess:(NSString *)msg {
    NSLog(@"%@", NSTemporaryDirectory());
    [self showMessage:msg image:[UIImage imageNamed:@"ttStatusBarToast.bundle/success"]];
}

/**
 *  显示失败
 *
 *  @param msg 失败描述
 */
+ (void)showError:(NSString *)msg {
    [self showMessage:msg image:[UIImage imageNamed:@"ttStatusBarToast.bundle/error"]];
}

/**
 *  显示消息
 *
 *  @param msg   消息内容
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image {
    [timer_ invalidate];

    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = ttMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ttMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示加载
 *
 *  @param msg 加载描述
 */
+ (void)showLoading:(NSString *)msg {
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = ttMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor blackColor];
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [loadingView startAnimating];
    
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : ttMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**
 *  隐藏窗口
 */
+ (void)hide {
    [UIView animateWithDuration:ttAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

/**
 *  显示窗口
 */
+ (void)showWindow {
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor whiteColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:ttAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

@end
