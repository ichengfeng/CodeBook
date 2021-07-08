//
//  HomeCategoryView.h
//  CodeBook
//
//  Created by chengfeng on 2021/6/3.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCategoryView : UIView

@property (nonatomic, strong) JXCategoryTitleImageView *categoryView;

- (void)changeCategory:(BOOL)onlyTitle;

@end

NS_ASSUME_NONNULL_END
