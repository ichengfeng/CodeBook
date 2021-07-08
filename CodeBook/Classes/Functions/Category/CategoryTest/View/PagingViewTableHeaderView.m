//
//  PagingViewTableHeaderView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "PagingViewTableHeaderView.h"

@interface PagingViewTableHeaderView()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect imageViewFrame;

@end

@implementation PagingViewTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lufei.jpg"]];
        self.imageView.clipsToBounds = YES;
        self.imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];

        self.imageViewFrame = self.imageView.frame;

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, frame.size.height - 30, 200, 30)];
        label.font = [UIFont systemFontOfSize:20];
        label.text = @"Monkey·D·路飞";
        label.textColor = [UIColor redColor];
        [self addSubview:label];
        
//        _categoryView = [[JXCategoryTitleImageView alloc] init];
//        self.categoryView.frame = CGRectMake(0, self.imageView.height, [UIScreen mainScreen].bounds.size.width, 50*2);
//        self.categoryView.titles = @[@"能力", @"爱好", @"队友"];;
//        self.categoryView.backgroundColor = [UIColor lightGrayColor];
////        self.categoryView.delegate = self;
//        self.categoryView.titleSelectedColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
//        self.categoryView.titleColor = [UIColor blackColor];
//        self.categoryView.titleColorGradientEnabled = YES;
//        self.categoryView.titleLabelZoomEnabled = YES;
//        self.categoryView.titleLabelZoomScale = 1.4;
//        self.categoryView.titleLabelZoomSelectedVerticalOffset = 15;
//        [self configCategory];
//        [self addSubview:self.categoryView];
//
//        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
//        lineView.indicatorColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
//        lineView.indicatorWidth = 30;
//        self.categoryView.indicators = @[lineView];
        
    }
    return self;
}

//- (NSArray *)configImageTypes {
//    NSMutableArray *temps = [NSMutableArray new];
//    for (int i = 0; i < 3; i++) {
//        [temps addObject:@(JXCategoryTitleImageType_TopImage)];
//    }
//    return temps;
//}
//
//- (void)configCategory {
//    self.categoryView.titles = @[@"能力", @"爱好", @"队友"];
//    self.categoryView.imageNames = @[@"ic_sport",@"ic_sport",@"ic_sport"];
//    self.categoryView.selectedImageNames = @[@"lion",@"lion",@"lion"];
//    self.categoryView.imageTypes = [self configImageTypes];
//    self.categoryView.imageSize = CGSizeMake(40, 40);
//    self.categoryView.imageZoomEnabled = YES;
//    self.categoryView.imageZoomScale = 1.4;
//    [self.categoryView reloadData];
//}

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY {
    CGRect frame = self.imageViewFrame;
    frame.size.height -= contentOffsetY;
    frame.origin.y = contentOffsetY;
    self.imageView.frame = frame;
}

@end
