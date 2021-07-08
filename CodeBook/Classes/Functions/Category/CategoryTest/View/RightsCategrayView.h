//
//  RightsCategrayView.h
//  zmjx
//
//  Created by chengfeng on 2019/12/10.
//  Copyright © 2019 于浦洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryTitleView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^RightsCategraySelectBlock)(NSInteger index);

@interface RightsCategrayView : UIView

@property (nonatomic,strong) JXCategoryTitleImageView *pinCategoryView;

@property(nonatomic,strong)NSArray *catTitles;

@property(nonatomic,strong)NSArray *imageNames;

@property(nonatomic,strong)NSArray *selectImageNames;

@property(nonatomic,copy)RightsCategraySelectBlock rightsCatSelectBlock;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
