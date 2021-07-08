//
//  NSString+dictionay.m
//  BD
//
//  Created by Podinn on 2018/6/4.
//  Copyright © 2018年 布丁酒店. All rights reserved.
//

#import "NSString+dictionay.h"

@implementation NSString (dictionay)

//NSString类别方法
//通过url.query获取参数字符 再分成字典
-(NSMutableDictionary *)getURLParameters
{
    if (!self.length) {
        return nil;
    }
    NSMutableDictionary  *params = [NSMutableDictionary   dictionary];
    if ([self containsString:@"&"]) {
        NSArray *urlComponents = [self componentsSeparatedByString:@"&"];
        
        for(NSString *keyValuePair in urlComponents) {
            
            //生成key/value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString*value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            //key不能为nil
            
            if(key==nil|| value ==nil) continue;
            
            id existValue = [params valueForKey:key];
            if(existValue !=nil) {
                //已存在的值，生成数组。
                if([existValue isKindOfClass:[NSArray class]]) {
                    //已存在的值生成数组
                    NSMutableArray*items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    [params setValue:items forKey:key];
                }else{
                    //非数组
                    [params setValue:@[existValue,value]forKey:key];
                }
                
            }else{
                //设置值
                [params setValue:value forKey:key];
            }
            
        }
    }else {
        //单个参数生成key/value
        NSArray *pairComponents = [self componentsSeparatedByString:@"="];
        if(pairComponents.count==1) {
            return nil;
        }
        //分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        //key不能为nil
        if(key ==nil|| value ==nil)return nil;
        //设置值
        [params setValue:value forKey:key];
        
    }
    return params;
}

@end
