//
//  PagerCategoryView.h
//  CodeBook
//
//  Created by mac on 2021/6/18.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCCategoryTitleImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PagerCategoryView : UIView

@property(nonatomic, strong)XCCategoryTitleImageView *categoryTitleImageView;

@property(nonatomic, strong)XCCategoryTitleImageView *categoryOnlyTitleView;

- (void)changeCategory:(BOOL)onlyTitle;

@end

NS_ASSUME_NONNULL_END
