//
//  NSString+CurrentLocale.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

typedef enum {
    NETWORK_TYPE_NONE= 0, //其他方式
    NETWORK_TYPE_WIFI = 1,
    NETWORK_TYPE_2G= 2,
    NETWORK_TYPE_3G= 3,
    NETWORK_TYPE_4G= 4,
    NETWORK_TYPE_5G= 5,//  5G目前为猜测结果
}NETWORK_TYPE;

#import <Foundation/Foundation.h>


/**
 应用相关信息
 */
@interface NSString (CurrentLocale)

/*!
 @method
 @abstract 获取设备名称
 @return 返回设备名称
 */
+ (NSString *)deviceName;

/*!
 @method
 @abstract 获取设备id
 @return 返回设备id
 */
+ (NSString *)deviceOpenUdid;

+ (NSString *)macAddress;

/*!
 @method
 @abstract 获取手机系统版本
 @return 返回手机系统版本
 */
+ (NSString *)systemVersion;

/*!
 @method
 @abstract 获取手机型号
 @return 返回手机型号
 */
+ (NSString *)phoneModel;

/*!
 @method
 @abstract 获取当前所在地
 @return 返回当前所在地
 */
+ (NSString *)currentLocale;

/*!
 @method
 @abstract 获取当前设备时间
 @return 返回当前设备时间
 */
//+ (NSString *)currentSystemDate;

/*!
 @method
 @abstract 获取手机详细型号
 @return 返回手机详细型号
 */
+ (NSString *)phoneDetailModel;


/**
 *  获取设备的udid
 *
 *  @return 设备的udid
 */
+ (NSString *)getDeviceUDID;

/**
 *  获取设备的运行商
 *
 *  @return 设备的运行商
 */
+ (NSString *)getDeviceCarrierOperator;

/**
 *  获取设备的网络状态
 *
 *  @return NETWORK_TYPE
 */
+ (NETWORK_TYPE)getNetworkTypeFromStatusBar;

/********************* app *************************/
/*!
 @method
 @abstract 获取当前应用名
 @return 返回当前应用名
 */
+ (NSString *)appCurrentName;

/*!
 @method
 @abstract 获取当前版本号
 @return 返回当前版本号 (1.0.0)   返回100
 */
+ (NSString *)appCurrentVersion;

/*!
 @method
 @abstract 获取版本号
 @return 返回版本号
 */
+ (NSString *)appVersionNum;

@end
