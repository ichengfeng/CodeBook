//
//  BDPublicView.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^certainBlock)(void);
typedef void (^cancelBlock)(void);

/**
 *BDPublicView
 *  一些公共视图
 */
@interface BDPublicView : UIView

/**
 *  返回导航条上返回Item
 *
 *  @param frame  fram
 *  @param target 任务
 *  @param action 关联的相应方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)navigationBackWithFrame:(CGRect)frame target:(id)target action:(SEL)action;

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
+ (UIBarButtonItem *)navigationRightWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action;

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
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
+ (UIBarButtonItem *)rightItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage width:(float)width height:(float)height;

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
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title;

#pragma mark - 新对话框 -
/**
 弹出的对话框（没有取消按钮）
 
 @param title 标题
 @param message 内容
 @param certainBlock 确定按钮回调方法
 */
+(void)showAlert:(NSString *)title msg:(NSString *)message certainBlock:(certainBlock)certainBlock;

/**
 弹出的对话框（有取消按钮）
 
 @param title 标题
 @param message 内容
 @param certainBlock 确定按钮回调方法
 @param cancelBlock 取消按钮回调方法
 */
+(void)showAlertAction:(NSString *)title msg:(NSString *)message certainBlock:(certainBlock)certainBlock cancelBlock:(cancelBlock)cancelBlock;

@end
