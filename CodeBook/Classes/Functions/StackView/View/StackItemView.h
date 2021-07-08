//
//  StackItemView.h
//  CodeBook
//
//  Created by mac on 2021/7/6.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ItemAxisForVertical,
    ItemAxisForHorizontal,
} ItemAxisDirection;

typedef enum : NSUInteger {
    ItemContentTypeForAll,
    ItemContentTypeForOnlyFirst,
    ItemContentTypeForOnlySecond,
} ItemContentType;

NS_ASSUME_NONNULL_BEGIN

@interface StackItemView : UIView

@property(nonatomic, assign)ItemAxisDirection axisDirection;

/**
 typedef NS_ENUM(NSInteger, UIStackViewAlignment) {
     UIStackViewAlignmentFill,    //水平布局时为高度充满，竖直布局时为宽度充满
     UIStackViewAlignmentLeading,   //前边对其
     UIStackViewAlignmentTop = UIStackViewAlignmentLeading,   //顶部对其
     UIStackViewAlignmentFirstBaseline,    //第一个控件文字的基线对其 水平布局有效
     UIStackViewAlignmentCenter,      //中心对其
     UIStackViewAlignmentTrailing,    //后边对其
     UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing,    //底部对其
     UIStackViewAlignmentLastBaseline,      //基线对其，水平布局有效
 } NS_ENUM_AVAILABLE_IOS(9_0);
 */


/**
 typedef NS_ENUM(NSInteger, UIStackViewDistribution) {
     UIStackViewDistributionFill = 0,              //充满，并且根据内部子视图尺寸对子视图尺寸进行动态调整
     UIStackViewDistributionFillEqually,          //平分充满，每个控件占据相同尺寸排列充满
     UIStackViewDistributionFillProportionally, //根据之前的比例填充
     UIStackViewDistributionEqualSpacing,     //等间距排列
     UIStackViewDistributionEqualCentering,   //所有子视图的中心之间的距离保持一致
 } NS_ENUM_AVAILABLE_IOS(9_0);
 */

@property(nonatomic, assign)UIStackViewDistribution itemDistribution;

@property(nonatomic, assign)ItemContentType contentType;

@end

NS_ASSUME_NONNULL_END
