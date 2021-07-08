//
//  ParserUtil.m
//  BD
//
//  Created by Podinn on 2017/9/7.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "ParserUtil.h"

@implementation ParserUtil
/**
 根据键值将字典转换成不同类型值
 
 @param dictionary 字典对象
 @param key 键值
 @return 不同类型值
 */
+ (id)object:(NSDictionary *)dictionary key:(NSString *)key {
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id obj = [dictionary objectForKey:key];
    if ([obj isKindOfClass:[NSNull class]] || obj == NULL) {
        return nil;
    }
    return obj;
}

+ (BOOL)boolValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self numberValue:dictionary key:key];
    return [obj boolValue];
}

+ (int)intValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self numberValue:dictionary key:key];
    return [obj intValue];
}

+ (NSInteger)integerValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self numberValue:dictionary key:key];
    return [obj integerValue];
}

+ (long)longValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self numberValue:dictionary key:key];
    return [obj longValue];
}

+ (long long)longlongValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self numberValue:dictionary key:key];
    return [obj longLongValue];
}

+ (double)doubleValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self numberValue:dictionary key:key];
    return [obj doubleValue];
}

+ (float)floatValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self numberValue:dictionary key:key];
    return [obj floatValue];
}

+ (NSNumber *)numberValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj = [self object:dictionary key:key];
    if (!obj) {
        return nil;
    }
    
    if ([obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }
    else {
        if ([obj isKindOfClass:[NSString class]]) {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            NSNumber *num = [formatter numberFromString:(NSString *)obj];
            return num;
        }
    }
    return nil;
}

+ (NSString *)stringValue:(NSDictionary *)dictionary key:(NSString *)key {
    id obj =  [self object:dictionary key:key];
    if (!obj) {
        return nil;
    }
    
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    else  if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj stringValue];
    }
    
    return obj;
}

+ (NSArray *)array:(NSDictionary *)dictionary key:(NSString *)key {
    id obj =  [self object:dictionary key:key];
    if (!obj || ![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return obj;
}

/**
 根据任意对象转换成json字符串
 
 @param object 任意对象
 @return json字符串
 */
+ (NSString *)jsonStringFromObject:(id)object {
    if ([NSJSONSerialization isValidJSONObject:object]) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            //DB_LOG(@"jsonStringFromObject error: %@", error);
        }
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    return nil;
}

/**
 根据数据转换成不同对象
 
 @param data 数据
 @return 不同对象
 */
+ (id)objectFromJsonData:(NSData *)data {
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        //DB_LOG(@"objectFromJsonData error: %@", error);
    }
    return object;
}

@end
