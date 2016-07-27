//
//  ttStatusBarToast.h
//  StatusBarToast
//
//  Created by 王涛 on 16/7/27.
//  Copyright © 2016年 wata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ttStatusBarToast : NSObject

/**
 *  显示文字
 *
 *  @param msg 文字内容
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功
 *
 *  @param msg 成功描述
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败
 *
 *  @param msg 失败描述
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示消息
 *
 *  @param msg   消息内容
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示加载
 *
 *  @param msg 加载描述
 */
+ (void)showLoading:(NSString *)msg;


/**
 *  隐藏窗口
 */
+ (void)hide;

@end
