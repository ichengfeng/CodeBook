//
//  PublicTools.m
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "PublicTools.h"
#import "NSDate+Calendar.h"

@implementation PublicTools

/********************NSDate**********************/
//time interval -- NSDate
+ (NSDate *)dateWithTimeInterval:(NSTimeInterval)timeInterval {
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

//time interval -- yyyy-MM-dd
+ (NSString *)yearStringWithTimeInterval:(NSTimeInterval)timeInterval {
    NSDate *nowDate = [self dateWithTimeInterval:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *yearString = [formatter stringFromDate:nowDate];
    return (yearString ? yearString: @"");
}

+ (NSString *)followingDayWithTimeInterval:(NSTimeInterval)timeInterval {
    NSDate *nowDate = [self dateWithTimeInterval:timeInterval];
    NSDate *followingDate = [nowDate followingDay];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *yearString = [formatter stringFromDate:followingDate];
    return (yearString ? yearString: @"");
}

//获取三个月之前的时间 返回yyyy-MM-dd
+ (NSString *)previousThreeMonthWithTimeInterval:(NSTimeInterval)timeInterval
{
    NSDate *nowDate = [self dateWithTimeInterval:timeInterval];
    NSDate *followingDate = [nowDate dateByAddingTimeInterval:-(60 * 60 * 24 * 90)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *yearString = [formatter stringFromDate:followingDate];
    return (yearString ? yearString: @"");
}

//获取一个月之前的时间 返回yyyy-MM-dd
+ (NSString *)previousOneMonthWithTimeInterval:(NSTimeInterval)timeInterval
{
    NSDate *nowDate = [self dateWithTimeInterval:timeInterval];
    NSDate *followingDate = [nowDate dateByAddingTimeInterval:-(60 * 60 * 24 * 30)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *yearString = [formatter stringFromDate:followingDate];
    return (yearString ? yearString: @"");
}

//time interval -- -MM-dd
+ (NSString *)monthStringWithTimeInterval:(NSTimeInterval)timeInterval {
    NSDate *nowDate = [self dateWithTimeInterval:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM-dd";
    NSString *yearString = [formatter stringFromDate:nowDate];
    return (yearString ? yearString: @"");
}

//time interval -- HH:mm
+ (NSString *)timeStringWithTimeInterval:(NSTimeInterval)timeInterval {
    NSDate *nowDate = [self dateWithTimeInterval:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *dateString = [formatter stringFromDate:nowDate];
    NSArray *array = [dateString componentsSeparatedByString:@" "];
    if (array.count > 1) {
        return [array objectAtIndex:1];
    }
    return @"";
}

//time interval -- yyyy-MM-dd HH:mm
+ (NSString *)dateStringWithTimeInterval:(NSTimeInterval)timeInterval {
    NSDate *nowDate = [self dateWithTimeInterval:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *dateString = [formatter stringFromDate:nowDate];
    if (dateString) {
        return dateString;
    }
    return @"";
}

//time interval--HH:mm:ss
+ (NSString *)timeWithTimeInterval:(NSTimeInterval)timeInterval {
    long para = (long)timeInterval;
    NSInteger h = para/60/60;
    NSInteger m = para/60%60;
    NSInteger s = para%60;
    
    NSString *strH = [[NSNumber numberWithInteger:h] stringValue];
    NSString *strM = [[NSNumber numberWithInteger:m] stringValue];
    NSString *strS = [[NSNumber numberWithInteger:s] stringValue];
    
    NSString *stringH = (h < 10) ? [NSString stringWithFormat:@"0%@", strH]: strH;
    NSString *stringM = (m < 10) ? [NSString stringWithFormat:@"0%@", strM]: strM;
    NSString *stringS = (s < 10) ? [NSString stringWithFormat:@"0%@", strS]: strS;
    return [NSString stringWithFormat:@"%@:%@:%@", stringH, stringM, stringS];
}

//s--HH:mm:ss
+ (NSString *)numberWithTimeInterval:(NSTimeInterval)number {
    NSDate *nowDate = [self dateWithTimeInterval:number];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [formatter stringFromDate:nowDate];
    NSArray *array = [dateString componentsSeparatedByString:@" "];
    if (array.count > 1) {
        return [array objectAtIndex:1];
    }
    return @"";
}

//time interval--小时、分、秒
+ (NSString *)timeUnitWithTimeInterval:(NSTimeInterval)timeInterval {
    long para = (long)timeInterval;
    NSInteger remainder = para%(24*60*60);
    if (remainder > 1) {
        return [self unitWithNumber:remainder];
    }
    return @"";
}

//NSDate -- time interval
+ (NSTimeInterval)timeIntervalWithDate:(NSDate *)date {
    if (date) {
        return [date timeIntervalSince1970];
    }
    return 0;
}

//NSDate -- yyyy-MM-dd
+ (NSString *)yearStringWithDate:(NSDate *)date {
    if (date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        return [formatter stringFromDate:date];
    }
    return @"";
}

//NSDate -- HH:mm
+ (NSString *)timeStringWithDate:(NSDate *)date {
    if (date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"HH:mm";
        return [formatter stringFromDate:date];
    }
    return @"";
}

//yyyy-MM-dd -- NSDate
+ (NSDate *)dateWithYearString:(NSString *)yearString {
    if (yearString) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale currentLocale]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        return [dateFormatter dateFromString:yearString];
    }
    return nil;
}

//HH:mm -- NSDate
+ (NSDate *)dateWithTimeString:(NSString *)timeString {
    if (timeString) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
        return [dateFormatter dateFromString:timeString];
    }
    return nil;
}

//yyyy-MM-dd HH:mm -- time interval
+ (NSTimeInterval)timeIntervalWithLongTime:(NSString *)longTime {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    NSDate *date = [dateFormatter dateFromString:longTime];
    return [self timeIntervalWithDate:date];
}

//s--小时、分、秒
+ (NSString *)unitWithNumber:(NSInteger)number {
    NSInteger h = number/60/60;
    NSInteger m = number/60%60;
    NSInteger s = number%60;
    
    NSString *strH = [[NSNumber numberWithInteger:h] stringValue];
    NSString *strM = [[NSNumber numberWithInteger:m] stringValue];
    NSString *strS = [[NSNumber numberWithInteger:s] stringValue];
    
    if (h > 0) {
        NSString *hour = CustomLocalizedString(@"label_hour_short", nil);
        NSString *minute = CustomLocalizedString(@"label_minute_short", nil);
        return [NSString stringWithFormat:@"%@%@%@%@", strH, hour, strM, minute];
    }
    else if (h == 0 && m > 0) {
        NSString *minute = CustomLocalizedString(@"label_minute_short", nil);
        NSString *second = CustomLocalizedString(@"label_second_short", nil);
        return [NSString stringWithFormat:@"%@%@%@%@", strM, minute, strS, second];
    }
    else {
        NSString *second = CustomLocalizedString(@"label_second_short", nil);
        return [NSString stringWithFormat:@"%@%@", strS, second];
    }
}

//s--小时、分、秒 返回复数单位
+ (NSString *)unitsWithNumber:(NSInteger)number {
    NSInteger h = number/60/60;
    NSInteger m = number/60%60;
    NSInteger s = number%60;
    
    NSString *strH = [[NSNumber numberWithInteger:h] stringValue];
    NSString *strM = [[NSNumber numberWithInteger:m] stringValue];
    NSString *strS = [[NSNumber numberWithInteger:s] stringValue];
    
    NSString *hour = (h > 1) ? CustomLocalizedString(@"label_hours", nil) : CustomLocalizedString(@"label_hour", nil);
    NSString *minute = (m > 1) ? CustomLocalizedString(@"label_minutes", nil) : CustomLocalizedString(@"label_minute", nil);
    NSString *second = (s > 1) ? CustomLocalizedString(@"label_seconds", nil) : CustomLocalizedString(@"label_second", nil);
    
    if (h > 0) {
        return [NSString stringWithFormat:@"%@%@%@%@", strH, hour, strM, minute];
    }
    else if (h == 0 && m > 0) {
        return [NSString stringWithFormat:@"%@%@%@%@", strM, minute, strS, second];
    }
    else {
        return [NSString stringWithFormat:@"%@%@", strS, second];
    }
}

//s--小时、分
+ (NSString *)hourAndMinterWithNumber:(NSInteger)number {
    NSInteger h = number/60/60;
    NSInteger m = number/60%60;
    
    NSString *strH = [[NSNumber numberWithInteger:h] stringValue];
    NSString *strM = [[NSNumber numberWithInteger:m] stringValue];
    
    if (h > 0) {
        NSString *hour = CustomLocalizedString(@"label_hour_short", nil);
        NSString *minute = CustomLocalizedString(@"label_minute_short", nil);
        return [NSString stringWithFormat:@"%@%@%@%@", strH, hour, strM, minute];
    }
    else {
        NSString *minute = CustomLocalizedString(@"label_minute_short", nil);
        return [NSString stringWithFormat:@"%@%@", strM, minute];
    }
}
/******************************************/

@end
