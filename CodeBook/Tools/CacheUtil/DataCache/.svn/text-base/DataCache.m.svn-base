//
//  DataCache.m
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "DataCache.h"

@implementation DataCache

/*!
 @method
 @abstract 根据key值存储数据
 @param data 数据
 @param key 键值
 */
+ (void)writeCache:(id)data forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*!
 @method
 @abstract 根据key值读取数据
 @param key 键值
 @return 数据对象
 */
+ (id)readCacheforKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

/*!
 @method
 @abstract 根据key值删除存储数据
 @param key 键值
 */
+ (void)removeCacheForKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

@end
