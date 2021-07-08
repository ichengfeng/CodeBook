//
//  ParserUtil.h
//  BD
//
//  Created by Podinn on 2017/9/7.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @class ParserUtil
 @abstract json解析工具
 */
@interface ParserUtil : NSObject

/**
 根据键值将字典转换成不同类型值
 
 @param dictionary 字典对象
 @param key 键值
 @return 不同类型值
 */
+ (id)object:(NSDictionary *)dictionary key:(NSString *)key;
+ (BOOL)boolValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (int)intValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (NSInteger)integerValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (long)longValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (long long)longlongValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (double)doubleValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (float)floatValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (NSNumber *)numberValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (NSString *)stringValue:(NSDictionary *)dictionary key:(NSString *)key;
+ (NSArray *)array:(NSDictionary *)dictionary key:(NSString *)key;

/**
 任意对象转换成json字符串

 @param object 任意类型对象
 @return json字符串
 */
+ (NSString *)jsonStringFromObject:(id)object;

/**
 根据数据转换成不同对象

 @param data 数据
 @return 不同对象
 */
+ (id)objectFromJsonData:(NSData *)data;

@end
