//
//  PublicTools.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicTools : NSObject

/********************NSDate**********************/
//time interval -- NSDate
+ (NSDate *)dateWithTimeInterval:(NSTimeInterval)timeInterval;

//time interval -- yyyy-MM-dd
+ (NSString *)yearStringWithTimeInterval:(NSTimeInterval)timeInterval;

+ (NSString *)followingDayWithTimeInterval:(NSTimeInterval)timeInterval;

//获取三个月之前的时间 返回yyyy-MM-dd
+ (NSString *)previousThreeMonthWithTimeInterval:(NSTimeInterval)timeInterval;

//获取一个月之前的时间 返回yyyy-MM-dd
+ (NSString *)previousOneMonthWithTimeInterval:(NSTimeInterval)timeInterval;

//time interval -- -MM-dd
+ (NSString *)monthStringWithTimeInterval:(NSTimeInterval)timeInterval;

//time interval -- HH:mm
+ (NSString *)timeStringWithTimeInterval:(NSTimeInterval)timeInterval;

//time interval -- yyyy-MM-dd HH:mm
+ (NSString *)dateStringWithTimeInterval:(NSTimeInterval)timeInterval;

//time interval--HH:mm:ss
+ (NSString *)timeWithTimeInterval:(NSTimeInterval)timeInterval;

//s--HH:mm:ss
+ (NSString *)numberWithTimeInterval:(NSTimeInterval)number;

//time interval--小时、分、秒
+ (NSString *)timeUnitWithTimeInterval:(NSTimeInterval)timeInterval;

//NSDate -- time interval
+ (NSTimeInterval)timeIntervalWithDate:(NSDate *)date;

//yyyy-MM-dd HH:mm -- time interval
+ (NSTimeInterval)timeIntervalWithLongTime:(NSString *)longTime;

//NSDate -- yyyy-MM-dd
+ (NSString *)yearStringWithDate:(NSDate *)date;

//NSDate -- HH:mm
+ (NSString *)timeStringWithDate:(NSDate *)date;

//yyyy-MM-dd -- NSDate
+ (NSDate *)dateWithYearString:(NSString *)yearString;

//HH:mm -- NSDate
+ (NSDate *)dateWithTimeString:(NSString *)timeString;

//s--小时、分、秒
+ (NSString *)unitWithNumber:(NSInteger)number;

//s--小时、分、秒 返回复数单位
+ (NSString *)unitsWithNumber:(NSInteger)number;

//s--小时、分
+ (NSString *)hourAndMinterWithNumber:(NSInteger)number;
/******************************************/

@end
