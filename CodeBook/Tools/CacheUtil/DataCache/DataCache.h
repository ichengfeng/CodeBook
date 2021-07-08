//
//  DataCache.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheKeys.h"

/*!
 @class DataCache
 @abstract 简单数据存储工具
 */
@interface DataCache : NSObject

/*!
 @method
 @abstract 根据key值存储数据
 @param data 数据
 @param key 键值
 */
+ (void)writeCache:(id)data forKey:(NSString *)key;

/*!
 @method
 @abstract 根据key值读取数据
 @param key 键值
 @return 数据对象
 */
+ (id)readCacheforKey:(NSString *)key;

/*!
 @method
 @abstract 根据key值删除存储数据
 @param key 键值
 */
+ (void)removeCacheForKey:(NSString *)key;



@end
