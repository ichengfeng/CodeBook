//
//  XCCategoryTitleCell.h
//  CodeBook
//
//  Created by mac on 2021/6/24.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import <JXCategoryView/JXCategoryView.h>
#import "JXCategoryViewDefines.h"

@class XCCategoryTitleCellModel;

@interface XCCategoryTitleCell : JXCategoryIndicatorCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *maskTitleLabel;
@property (nonatomic, strong) NSLayoutConstraint *titleLabelCenterX;
@property (nonatomic, strong) NSLayoutConstraint *titleLabelCenterY;
@property (nonatomic, strong) NSLayoutConstraint *maskTitleLabelCenterX;

- (JXCategoryCellSelectedAnimationBlock)preferredTitleZoomAnimationBlock:(XCCategoryTitleCellModel *)cellModel baseScale:(CGFloat)baseScale;

- (JXCategoryCellSelectedAnimationBlock)preferredTitleStrokeWidthAnimationBlock:(XCCategoryTitleCellModel *)cellModel attributedString:(NSMutableAttributedString *)attributedString;

- (JXCategoryCellSelectedAnimationBlock)preferredTitleColorAnimationBlock:(XCCategoryTitleCellModel *)cellModel;

@end
