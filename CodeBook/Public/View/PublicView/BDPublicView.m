//
//  BDPublicView.m
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "BDPublicView.h"
#import "UIView+Orign.h"
#import "BDApplicationUtil.h"

@implementation BDPublicView
#pragma mark ----------- 导航栏左右两边按钮 ------------
/**
 *  返回导航条上返回Item
 *
 *  @param frame  frame
 *  @param target 任务
 *  @param action 关联的相应方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)navigationBackWithFrame:(CGRect)frame target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setAdjustsImageWhenDisabled:false];
    [button setImage:[UIImage imageNamed:@"btn_back_black"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_back_black"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"btn_back_black"] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backBarButtonItem;
}

/**
 *  返回导航条右边的item
 *
 *  @param frame                fram
 *  @param imageName            正常图片
 *  @param highlightedImageName 高亮图片
 *  @param target               任务
 *  @param action               相应方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)navigationRightWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setAdjustsImageWhenDisabled:false];
    if (imageName)
    {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (highlightedImageName)
    {
       [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }
    if (title)
    {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
        [button setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
//        [button setTintColor:[UIColor whiteColor]];
        [button.titleLabel setTextAlignment:NSTextAlignmentRight];
        [button.titleLabel sizeToFit];
//        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 20., 0, 0.)];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return rightBarButtonItem;
}

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateSelected];

    // 设置尺寸
//    btn.size = btn.currentImage.size;
    btn.width = 22.0;
    btn.height = 22.0;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)rightItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage width:(float)width height:(float)height {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateSelected];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(-8., 6., -8., -6.)];
    // 设置尺寸
    //    btn.size = btn.currentImage.size;
    btn.width = width;
    btn.height = height;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *  @param title     标题
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    if (image)
    {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (highImage)
    {
        [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸
    //    btn.size = btn.currentImage.size;
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    //    btn.width = 22.0;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.height = 22.0;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

#pragma mark ----------- 弹出的对话框 ------------
/**
 弹出的对话框（没有取消按钮）

 @param title 标题
 @param message 内容
 @param certainBlock 确定按钮回调方法
 */
+(void)showAlert:(NSString *)title msg:(NSString *)message certainBlock:(certainBlock)certainBlock {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *certainAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (certainBlock)
        {
            certainBlock();
        }
    }];
    [alert addAction:certainAction];

    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    [mainWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

/**
 弹出的对话框（有取消按钮）

 @param title 标题
 @param message 内容
 @param certainBlock 确定按钮回调方法
 @param cancelBlock 取消按钮回调方法
 */
+(void)showAlertAction:(NSString *)title msg:(NSString *)message certainBlock:(certainBlock)certainBlock cancelBlock:(cancelBlock)cancelBlock {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock)
        {
            cancelBlock();
        }
    }];
    UIAlertAction *certainAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (certainBlock)
        {
            certainBlock();
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:certainAction];
    
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    [mainWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}
@end
