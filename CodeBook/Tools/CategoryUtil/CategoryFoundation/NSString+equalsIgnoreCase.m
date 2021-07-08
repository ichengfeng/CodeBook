//
//  NSString+equalsIgnoreCase.m
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "NSString+equalsIgnoreCase.h"

@implementation NSString (equalsIgnoreCase)

- (BOOL)isEqualIgnoreCase:(NSString *)_string
{
    if (self && _string && ([self hasPrefix:[_string uppercaseString]] || [self hasPrefix:[_string lowercaseString]])) {
        return TRUE;
    }else{
        return FALSE;
    }
}

@end
