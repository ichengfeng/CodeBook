//
//  CBBaseViewController.h
//  CodeBook
//
//  Created by Podinn on 2019/5/27.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/**
 返回上一级
 */
- (void)backToPopViewController;

/**
 设置是否隐藏返回按钮
 @param hidden 是否隐藏
 */
- (void)setBackItemHidden:(BOOL)hidden;

/**
 @method
 @abstract 设置导航栏上的标题
 @param title 标题
 */
- (void)setTitle:(NSString * _Nullable)title;

- (NSString *)title;

- (void)pageJumpTo:(NSString *)nibName;

- (CGFloat)statusBarHeight;

- (CGFloat)safeAreaBottom;

@end

NS_ASSUME_NONNULL_END
