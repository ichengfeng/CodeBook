//
//  RightsCategrayView.m
//  zmjx
//
//  Created by chengfeng on 2019/12/10.
//  Copyright © 2019 于浦洋. All rights reserved.
//

#import "RightsCategrayView.h"
#import "JXCategoryTitleImageView.h"
#import "JXCategoryIndicatorLineView.h"

@interface RightsCategrayView()<JXCategoryViewDelegate>

@property(nonatomic,strong)NSMutableArray *imageTypes;

@end

@implementation RightsCategrayView

- (JXCategoryTitleImageView *)pinCategoryView {
    if (!_pinCategoryView) {
        _pinCategoryView = [[JXCategoryTitleImageView alloc]init];
        _pinCategoryView.titleColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _pinCategoryView.titleFont = [UIFont systemFontOfSize:14*adjustRatio weight:UIFontWeightRegular];
        _pinCategoryView.titleSelectedColor = [UIColor colorWithHexString:@"#FF2000"];
        _pinCategoryView.titleSelectedFont = [UIFont systemFontOfSize:14*adjustRatio weight:UIFontWeightSemibold];
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorColor = [UIColor colorWithHexString:@"#FFFFFF"];
        lineView.verticalMargin = 5*adjustRatio;
        lineView.indicatorWidth = 22*adjustRatio;
        self.pinCategoryView.indicators = @[lineView];
        self.pinCategoryView.delegate = self;
        [self addSubview:self.pinCategoryView];
        
        [_pinCategoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.mas_equalTo(49*adjustRatio + 24*adjustRatio);
            make.bottom.equalTo(self);
        }];
        
    }
    return _pinCategoryView;
}

- (void)setCatTitles:(NSArray *)catTitles {
    _catTitles = catTitles;

    self.imageTypes = [NSMutableArray new];
    
    for (int i = 0; i < catTitles.count; i++) {
        [self.imageTypes addObject:@(JXCategoryTitleImageType_TopImage)];
    }
}

- (void)reloadData {
    self.pinCategoryView.titles = self.catTitles;
    self.pinCategoryView.imageNames = self.imageNames;
    self.pinCategoryView.selectedImageNames = self.selectImageNames;
    self.pinCategoryView.imageTypes = self.imageTypes;
    self.pinCategoryView.imageZoomEnabled = YES;
    self.pinCategoryView.imageZoomScale = 1.5;
    
    [self.pinCategoryView reloadData];
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    if (self.rightsCatSelectBlock) {
        self.rightsCatSelectBlock(index);
    }
    
}

@end
