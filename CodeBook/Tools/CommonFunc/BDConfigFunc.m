//
//  BDConfigFunc.m
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "BDConfigFunc.h"

@interface BDConfigFunc ()

@end

@implementation BDConfigFunc
/**
 单例
 @return 返回自身
 */
+ (id)shareInstance {
    
    static BDConfigFunc *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BDConfigFunc alloc] init];
    });
    return instance;
}

/**
 配置初始化
 */
- (void)initialize {
    //初始化当前城市
    
    //初始化当前语言
    
}

@end
