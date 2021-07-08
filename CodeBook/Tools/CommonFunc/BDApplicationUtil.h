//
//  BDApplicationUtil.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "BDApplicationUtilBase.h"

@interface BDApplicationUtil : NSObject

+ (NSString *)getImageNameFromTypeId:(NSString *)typeId;

+ (NSString *)getTemperatureRangeByLowTemperature:(NSString *)lowTemperature highTemperature:(NSString *)highTemperature;

/*!
 @method
 @abstract 经纬度数据类型转换
 @param string 经纬度字符串
 @return 经度
 */
+ (double)getLongitudeByString:(NSString *)string;

/*!
 @method
 @abstract 经纬度数据类型转换
 @param string 经纬度字符串
 @return 纬度
 */
+ (double)getLatitudeByString:(NSString *)string;

/**
 *  把经纬度转化为经纬度的字符串
 *
 *  @param coordinate2D 经纬度
 *
 *  @return 经纬度的字符串
 */
+ (NSString *)getAddressMapStringByLocationCoordinate2D:(CLLocationCoordinate2D)coordinate2D;

/**
 *  把经纬度的字符串转化为坐标
 *
 *  @param coordStr 经纬度的字符串
 *
 *  @return  经纬度
 */
+ (CLLocationCoordinate2D)getLocationCoordinate2DWithCoordinateStr:(NSString *)coordStr;

/**
 *  计算两个地方的距离
 *
 *  @param lng1 第一个地方的经度
 *  @param lat1 第一个地方的纬度
 *  @param lng2 第一个地方的经度
 *  @param lat2 第一个地方的纬度
 *
 *  @return 距离 千米
 */
+ (int)getDistance:(double)lng1 lng:(double)lat1 la2:(double)lng2 lng2:(double)lat2;

/**
 *  判断字符串是否为空
 *
 *  @param string 要处理的字符串
 *
 *  @return BOOL
 */
+ (BOOL)isEmptyString:(NSString *)string;


/**
 * 计算文本自适应
 *
 *  @param string 要计算的字符串
 *  @param size   size的范围
 *  @param font   文本字体大小
 *
 *  @return CGSize
 */
+ (CGSize)getStringSizeWithString:(NSString *)string size:(CGSize)size font:(UIFont *)font;

/**
 *  获取优惠券的有效期限
 *
 *
 *  @return 返回对应的有效期限
 */
+(NSString *)getCouponCashEffectTimeStringWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;



/**
 *  计算两地的距离
 *
 *  @param originCoord 出发的坐标
 *  @param destCoord   目的地坐标
 *
 *  @return 距离
 */
+ (NSString *)calculateDistanceWithOriginCoordinate:(CLLocationCoordinate2D)originCoord destinationCoordinate:(CLLocationCoordinate2D)destCoord;
/**
 *  判断字符串中是否含有某个前缀
 *
 *  @param string    原始的字符串
 *  @param prefixStr 前缀字符串
 *
 *  @return bool
 */
+ (BOOL)originalString:(NSString *)string ifHasPrefixString:(NSString *)prefixStr;


/**
 *  获取年月日的字符串
 *
 *  @param string string
 *
 *  @return string
 */
+ (NSString *)getDateStrFromDateString:(NSString *)string;

/**
 *  拿到日期的字符串计算星期几
 *
 *  @param dateStr 时间字符串
 *
 *  @return 汉子的周几 例如：周一
 */
+ (NSString *)calculateWeekNum:(NSString*)dateStr;

//设置星期几
+ (NSString*)getWeekdayLabel:(NSString*)_str;

//通过数字获取对应的星期
+ (NSString*)getWeekdayLabelByDay:(NSInteger)day;

/**
 *  计算两个日期之前的天数
 *
 *  @param fromDate  起始日期
 *  @param toDate 借宿日期
 *
 *  @return 天数
 */
+ (NSInteger)calculateDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

/**
 *  替换字符串
 *
 *  @param string 要处理的字符串
 *
 *  @return NSString
 */
+ (NSString	*) escapeBracket:(NSString *)string;

/*!
 @method
 @abstract 根据字符串获取高度
 
 */
+ (CGSize)getSizeByString:(NSString *)string width:(CGFloat)width font:(UIFont *)font;
+ (CGFloat)getHeightByString:(NSString *)string width:(CGFloat)width font:(UIFont *)font;

+ (NSString *)getServerContentByString:(NSString *)string;

+ (NSString *)getRoomContentByString:(NSString *)string;

+ (NSString *)getContentByString:(NSString *)string dictionary:(NSDictionary *)dictionary;

/*!
 @method
 @abstract 替换网络转义字符
 @param string 网络数据
 @return 返回替换后的数据
 */
+ (NSString *)getReplacingOccurrencesByString:(NSString *)string;

/*!
 @method
 @abstract 截取年、月、日
 @param string 网络数据
 @return 返回日期
 */
+ (NSString *)getYearByString:(NSString *)string;

/**
 过滤字符串中的特殊字符

 @param string  要处理的字符串
 @return 返回处理后的字符串
 */
+(NSString*)filterSpecialString:(NSString*)string;

//通过解析24,35,60 这种字符串获取RGBA内容
+ (UIColor *)getColorWithName:(NSString *)name;
@end
