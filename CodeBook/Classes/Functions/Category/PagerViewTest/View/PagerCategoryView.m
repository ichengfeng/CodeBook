//
//  PagerCategoryView.m
//  CodeBook
//
//  Created by mac on 2021/6/18.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "PagerCategoryView.h"

@interface PagerCategoryView ()

@property(nonatomic,assign)BOOL isOnlyTitle;

@end

@implementation PagerCategoryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav"]];
        
        self.categoryTitleImageView.hidden = NO;
        self.categoryOnlyTitleView.hidden = YES;
        
        [self configCategory:self.categoryTitleImageView onlyTitle:NO];
        [self configCategory:self.categoryOnlyTitleView onlyTitle:YES];
        
        [self.categoryOnlyTitleView.collectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [self.categoryTitleImageView.collectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

#pragma mark ----- KVO 检测滑动 -----
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        UICollectionView *collection = object;
        CGPoint offset = collection.contentOffset;
        
        if (self.isOnlyTitle) {
            if (object == self.categoryOnlyTitleView.collectionView) {
                if (self.categoryTitleImageView.hidden == YES) {
                    self.categoryTitleImageView.collectionView.contentOffset = offset;
                }
            }
        }else {
            if (object == self.categoryTitleImageView.collectionView) {
                if (self.categoryOnlyTitleView.hidden == YES) {
                    self.categoryOnlyTitleView.collectionView.contentOffset = offset;
                }
            }
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    if (self.categoryTitleImageView) {
        [self.categoryTitleImageView.collectionView removeObserver:self forKeyPath:@"contentOffset"];
    }
    
    if (self.categoryOnlyTitleView.collectionView) {
        [self.categoryOnlyTitleView.collectionView removeObserver:self forKeyPath:@"contentOffset"];
    }
}


#pragma mark ----- setter -----

- (XCCategoryTitleImageView *)categoryTitleImageView {
    if (!_categoryTitleImageView) {
        _categoryTitleImageView = [[XCCategoryTitleImageView alloc] init];
        _categoryTitleImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 95);
        _categoryTitleImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav"]];
        _categoryTitleImageView.titleSelectedColor = [UIColor whiteColor];
        _categoryTitleImageView.titleColor = [UIColor colorWithHexString:@"#BB1B42"];
        _categoryTitleImageView.titleColorGradientEnabled = YES;
        _categoryTitleImageView.titleFont = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _categoryTitleImageView.titleSelectedFont = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        _categoryTitleImageView.titleImageSpacing = 5;
        _categoryTitleImageView.imageSize = CGSizeMake(55, 55);
        _categoryTitleImageView.imageNames = @[@"ic_sport",@"ic_sport",@"ic_sport",@"ic_sport",@"ic_sport",@"ic_sport"];
//        @[@"lion",@"lion",@"lion",@"lion",@"lion",@"lion"];
        _categoryTitleImageView.selectedImageNames = @[@"ic_sport",@"ic_sport",@"ic_sport",@"ic_sport",@"ic_sport",@"ic_sport"];
        _categoryTitleImageView.cellWidth = 60;
        _categoryTitleImageView.imageZoomEnabled = YES;
        _categoryTitleImageView.imageZoomScale = 1.4;
        [self addSubview:_categoryTitleImageView];
        
        JXCategoryIndicatorImageView *backgroundView = [[JXCategoryIndicatorImageView alloc] init];
        backgroundView.verticalMargin = -2*adjustRatio;
        backgroundView.indicatorImageView.image = [UIImage imageNamed:@"red_bubble"];
        backgroundView.indicatorImageViewSize = CGSizeMake(77*adjustRatio, 32*adjustRatio);
        backgroundView.indicatorImageView.contentMode = UIViewContentModeScaleAspectFill;
        _categoryTitleImageView.indicators = @[backgroundView];
    }
    return _categoryTitleImageView;
}

- (XCCategoryTitleImageView *)categoryOnlyTitleView {
    if (!_categoryOnlyTitleView) {
        _categoryOnlyTitleView = [[XCCategoryTitleImageView alloc] init];
        _categoryOnlyTitleView.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 50);
        _categoryOnlyTitleView.backgroundColor = [UIColor colorWithHexString:@"#FF045C"];
        _categoryOnlyTitleView.titleSelectedColor = [UIColor colorWithHexString:@"#F20000"];
        _categoryOnlyTitleView.titleColor = [UIColor whiteColor];
        _categoryOnlyTitleView.titleFont = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _categoryOnlyTitleView.titleSelectedFont = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        _categoryOnlyTitleView.titleColorGradientEnabled = YES;
        _categoryOnlyTitleView.cellWidth = 60;
        [self addSubview:_categoryOnlyTitleView];
        
        JXCategoryIndicatorImageView *backgroundView = [[JXCategoryIndicatorImageView alloc] init];
        backgroundView.verticalMargin = 5*adjustRatio;
        backgroundView.indicatorImageView.image = [UIImage imageNamed:@"white_bubble"];
        backgroundView.indicatorImageViewSize = CGSizeMake(77*adjustRatio, 32*adjustRatio);
        backgroundView.indicatorImageView.contentMode = UIViewContentModeScaleAspectFill;
        _categoryOnlyTitleView.indicators = @[backgroundView];
    }
    return _categoryOnlyTitleView;
}

#pragma mark ----- method -----
- (void)changeCategory:(BOOL)onlyTitle {
    
    if (self.isOnlyTitle == onlyTitle) {
        return;
    }
    
    self.isOnlyTitle = onlyTitle;
    self.categoryTitleImageView.hidden = onlyTitle;
    self.categoryOnlyTitleView.hidden = !onlyTitle;
    
//    [self configCategory:onlyTitle ? self.categoryOnlyTitleView : self.categoryTitleImageView onlyTitle:onlyTitle];
    
}

- (void)configCategory:(XCCategoryTitleImageView *)categoryView onlyTitle:(BOOL)onlyTitle {
    categoryView.titles = @[@"能力", @"爱好", @"队友",@"奥特曼",@"葫芦娃",@"西游记"];
    
    categoryView.imageTypes = [self configImageTypesWithImage:onlyTitle];
    
    [categoryView reloadData];
}

- (NSArray *)configImageTypesWithImage:(BOOL)onlyTitle {
    NSMutableArray *temps = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        if (!onlyTitle) {
            if (i == 0) {
                [temps addObject:@(XCCategoryTitleImageType_ImageTitle)];
            }
            [temps addObject:@(XCCategoryTitleImageType_TopImage)];
        }else {
            if (i == 0) {
                [temps addObject:@(XCCategoryTitleImageType_TitleImg)];
            }
            [temps addObject:@(XCCategoryTitleImageType_OnlyTitle)];
        }
    }
    return temps;
}

@end
