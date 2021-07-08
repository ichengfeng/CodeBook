//
//  XCCategoryTitleCellModel.h
//  CodeBook
//
//  Created by mac on 2021/6/24.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import <JXCategoryView/JXCategoryView.h>
#import <UIKit/UIKit.h>
#import "JXCategoryViewDefines.h"

@interface XCCategoryTitleCellModel : JXCategoryIndicatorCellModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign, readonly) CGFloat titleHeight;

@property (nonatomic, assign) NSInteger titleNumberOfLines;
@property (nonatomic, assign) CGFloat titleLabelVerticalOffset;

@property (nonatomic, strong) UIColor *titleNormalColor;
@property (nonatomic, strong) UIColor *titleCurrentColor;
@property (nonatomic, strong) UIColor *titleSelectedColor;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *titleSelectedFont;

@property (nonatomic, assign, getter=isTitleLabelMaskEnabled) BOOL titleLabelMaskEnabled;
@property (nonatomic, assign, getter=isTitleLabelZoomEnabled) BOOL titleLabelZoomEnabled;

@property (nonatomic, assign) CGFloat titleLabelNormalZoomScale;
@property (nonatomic, assign) CGFloat titleLabelCurrentZoomScale;
@property (nonatomic, assign) CGFloat titleLabelSelectedZoomScale;
@property (nonatomic, assign) CGFloat titleLabelZoomSelectedVerticalOffset;

@property (nonatomic, assign, getter=isTitleLabelStrokeWidthEnabled) BOOL titleLabelStrokeWidthEnabled;
@property (nonatomic, assign) CGFloat titleLabelNormalStrokeWidth;
@property (nonatomic, assign) CGFloat titleLabelCurrentStrokeWidth;
@property (nonatomic, assign) CGFloat titleLabelSelectedStrokeWidth;

@property (nonatomic, assign) JXCategoryTitleLabelAnchorPointStyle titleLabelAnchorPointStyle;

@end
