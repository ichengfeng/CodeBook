//
//  TimeCache.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheKeys.h"

/*!
 @define
 @abstract 自定义增加二级缓存路径
 */
#define CACHE_DIRECTORY_APPENDING_PATH @"BDTimeCache"

/*!
 @class TimeCache
 @abstract 文件、图片缓存
 */
@interface TimeCache : NSObject

/*!
 @method
 @abstract 设置缓存时间，之后自动删除
 @param time 时间，默认为0，代表一直缓存
 */
+ (void)setCacheTime:(double)time;

/*!
 @method
 @abstract 获取缓存目录
 @return 返回缓存目录
 */
+ (NSString *)cacheDirectory;

/*!
 @method
 @abstract 根据key值存储数据
 @param data 存储数据
 @param key 键值
 */
+ (void)setObject:(NSData *)data forKey:(NSString *)key;

/*!
 @method
 @abstract 根据key值读取数据
 @param key 键值
 @return 数据对象
 */
+ (id)objectForKey:(NSString *)key;

/*!
 @method
 @abstract 根据key值删除数据
 @param key 键值
 */
+ (void)clearTimeCacheForKey:(NSString *)key;

/*!
 @method
 @abstract 删除所有存储数据
 */
+ (void)clearAllTimeCache;

@end
