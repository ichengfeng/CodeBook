//
//  UIDevice+Connection.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIDevice (Connection)
 @abstract 设备网络连接
 */
@interface UIDevice (Connection)

/*!
 @method
 @abstract 判断网络是否可连接
 @return YES，是 NO，否
 */
+ (BOOL)isConnectionAvailable;

@end
