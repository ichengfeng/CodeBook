//
//  XCCategoryTitleImageCell.h
//  CodeBook
//
//  Created by mac on 2021/6/22.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import <JXCategoryView/JXCategoryView.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCCategoryTitleImageCell : JXCategoryTitleCell

//@property (nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong)UIImageView *itemImg;

@property(nonatomic, strong)UILabel *itemLabel;

@property(nonatomic, strong)UIImageView *titleImg;

@end

NS_ASSUME_NONNULL_END
