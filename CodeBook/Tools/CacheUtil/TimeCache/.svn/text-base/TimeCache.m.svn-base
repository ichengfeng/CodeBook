//
//  TimeCache.m
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "TimeCache.h"

/*!
 @static
 @abstract 默认缓存时间为0
 */
static NSTimeInterval cacheTime = 0; //缓存时间 0

@implementation TimeCache

/*!
 @method
 @abstract 设置缓存时间，之后自动删除
 @param time 时间，默认为0，代表一直缓存
 */
+ (void)setCacheTime:(double)time {
    cacheTime = time;
}

/*!
 @method
 @abstract 获取缓存目录
 @return 返回缓存目录
 */
+ (NSString *)cacheDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    cacheDirectory = [cacheDirectory stringByAppendingPathComponent:CACHE_DIRECTORY_APPENDING_PATH];
    return cacheDirectory;
}

/*!
 @method
 @abstract 根据key值存储数据
 @param data 存储数据
 @param key 键值
 */
+ (void)setObject:(NSData *)data forKey:(NSString *)key {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filename = [self.cacheDirectory stringByAppendingPathComponent:key];
    
    BOOL isDir = YES;
    if (![fileManager fileExistsAtPath:self.cacheDirectory isDirectory:&isDir]) {
        [fileManager createDirectoryAtPath:self.cacheDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSError *error;
    @try {
        [data writeToFile:filename options:NSDataWritingAtomic error:&error];
    }
    @catch (NSException *exception) {
        //error
    }
}

/*!
 @method
 @abstract 根据key值读取数据
 @param key 键值
 @return 数据对象
 */
+ (NSData *)objectForKey:(NSString *)key {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filename = [self.cacheDirectory stringByAppendingPathComponent:key];
    
    if ([fileManager fileExistsAtPath:filename])
    {
        NSDate *modificationDate = [[fileManager attributesOfItemAtPath:filename error:nil] objectForKey:NSFileModificationDate];
        if ([modificationDate timeIntervalSinceNow] > cacheTime && cacheTime != 0) {
            [fileManager removeItemAtPath:filename error:nil];
        } else {
            NSData *data = [NSData dataWithContentsOfFile:filename];
            return data;
        }
    }
    return nil;
}

/*!
 @method
 @abstract 根据key值删除数据
 @param key 键值
 */
+ (void)clearTimeCacheForKey:(NSString *)key {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filename = [self.cacheDirectory stringByAppendingPathComponent:key];
    
    if ([fileManager fileExistsAtPath:filename]) {
        NSError *error;
        BOOL success = [fileManager removeItemAtPath:filename error:&error];
        if (!success && error) {
            //error
        }
    }
}

/*!
 @method
 @abstract 删除所有存储数据
 */
+ (void)clearAllTimeCache {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.cacheDirectory]) {
        NSError *error;
        BOOL success = [fileManager removeItemAtPath:self.cacheDirectory error:&error];
        if (!success && error) {
            //error
        }
    }
}

@end

