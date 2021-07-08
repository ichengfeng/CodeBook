//
//  UIDevice+Connection.m
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "UIDevice+Connection.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation UIDevice (Connection)

//判断网络是否可连接
+ (BOOL)isConnectionAvailable {
    SCNetworkReachabilityFlags flags;
    BOOL receivedFlags;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"www.baidu.com" UTF8String]);
    receivedFlags = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    
    if (!receivedFlags || (flags == 0)) {
        
        return FALSE;
    }
    else {
        return TRUE;
    }
}

@end
