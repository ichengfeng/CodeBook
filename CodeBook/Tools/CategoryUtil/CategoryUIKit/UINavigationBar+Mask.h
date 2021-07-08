//
//  UINavigationBar+Mask.h
//  BD
//
//  Created by Podinn on 2017/10/20.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Mask)

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;

- (void)lt_setElementsAlpha:(CGFloat)alpha;

- (void)lt_setTranslationY:(CGFloat)translationY;

- (void)lt_reset;

@end
