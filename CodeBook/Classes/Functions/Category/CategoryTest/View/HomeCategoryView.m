//
//  HomeCategoryView.m
//  CodeBook
//
//  Created by chengfeng on 2021/6/3.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "HomeCategoryView.h"

@interface HomeCategoryView()

@property(nonatomic,assign)BOOL isOnlyTitle;

@end

@implementation HomeCategoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _categoryView = [[JXCategoryTitleImageView alloc] init];
        self.categoryView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50*2+20);
        self.categoryView.backgroundColor = [UIColor lightGrayColor];
        self.categoryView.titleSelectedColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
        self.categoryView.titleColor = [UIColor blackColor];
        self.categoryView.titleColorGradientEnabled = YES;
        self.categoryView.titleLabelZoomEnabled = YES;
        self.categoryView.titleLabelZoomScale = 1.2;
        self.categoryView.titleImageSpacing = 15;
        [self addSubview:self.categoryView];
        
        [self configCategory:NO];
        
//        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
//        lineView.indicatorColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
//        lineView.indicatorWidth = 30;
        
     
        // 初始化指示器视图
        JXCategoryIndicatorImageView *indicatorImageView = [[JXCategoryIndicatorImageView alloc] init];
        indicatorImageView.indicatorImageView.image = [UIImage imageNamed:@"light"];
        indicatorImageView.indicatorImageViewSize = CGSizeMake(50, 50);
        
        self.categoryView.indicators = @[indicatorImageView];
        
    }
    return self;
}

- (NSArray *)configImageTypesWithImage:(BOOL)onlyTitle {
    NSMutableArray *temps = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        if (!onlyTitle) {
            [temps addObject:@(JXCategoryTitleImageType_TopImage)];
        }else {
            if (i == 0) {
                [temps addObject:@(JXCategoryTitleImageType_OnlyImage)];
            }else {
                [temps addObject:@(JXCategoryTitleImageType_OnlyTitle)];
            }
        }
    }
    return temps;
}

- (void)configCategory:(BOOL)onlyTitle {
    self.categoryView.titles = @[@"能力", @"爱好", @"队友"];
    self.categoryView.imageNames = @[@"ic_sport",@"ic_sport",@"ic_sport"];
    self.categoryView.selectedImageNames = @[@"lion",@"lion",@"lion"];
    self.categoryView.imageTypes = [self configImageTypesWithImage:onlyTitle];
    self.categoryView.imageSize = CGSizeMake(60, 60);
    self.categoryView.imageZoomEnabled = YES;
    self.categoryView.imageZoomScale = 1.2;
    
    self.categoryView.titleImageSpacing = onlyTitle ? 15 : 15;
    
    [self.categoryView reloadData];
}

- (void)changeCategory:(BOOL)onlyTitle {
    
    if (self.isOnlyTitle == onlyTitle) {
        return;
    }
    
    self.isOnlyTitle = onlyTitle;
    
    [self configCategory:onlyTitle];
    
    if (onlyTitle) {
        self.backgroundColor = [UIColor redColor];
    }else {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
}

@end
