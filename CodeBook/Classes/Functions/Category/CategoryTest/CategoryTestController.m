//
//  CategoryTestController.m
//  CodeBook
//
//  Created by chengfeng on 2021/6/2.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "CategoryTestController.h"
#import "RightsCategrayView.h"
#import "TransformViewController.h"
//#import "ScrollUpListViewController.h"

#import "JXPagerView.h"
#import "PagingViewTableHeaderView.h"
#import "TestListBaseView.h"
#import "HomeCategoryView.h"

static const CGFloat JXTableHeaderViewHeight = 200;
static const CGFloat JXheightForHeaderInSection = 50;

@interface CategoryTestController ()<JXPagerViewDelegate, JXCategoryViewDelegate>
@property (nonatomic, strong) JXPagerView *pagingView;
@property (nonatomic, strong) PagingViewTableHeaderView *userHeaderView;
@property (nonatomic, strong) HomeCategoryView *homeCategoryView;
//@property (nonatomic, strong) JXCategoryTitleImageView *categoryView;
//@property (nonatomic, strong) JXCategoryTitleView *categoryOnlyView;
@property (nonatomic, strong) NSArray <NSString *> *titles;

@end

@implementation CategoryTestController

- (void)viewDidLoad {
    [super viewDidLoad];
        
//    MJWeakSelf ///__weak typeof(self) weakSelf = self;
    
    _titles = @[@"能力", @"爱好", @"队友"];

    _userHeaderView = [[PagingViewTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, JXTableHeaderViewHeight)];
    self.homeCategoryView = [[HomeCategoryView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 120)];
    self.homeCategoryView.categoryView.delegate = self;

    _pagingView = [[JXPagerView alloc] initWithDelegate:self];
//    _pagingView.pinSectionHeaderVerticalOffset = -80;
    [self.view addSubview:self.pagingView];

    self.homeCategoryView.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagingView.listContainerView;

    self.navigationController.interactivePopGestureRecognizer.enabled = (self.homeCategoryView.categoryView.selectedIndex == 0);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGRect frame = self.view.bounds;
    frame.origin.y += kStatuBarH+44;
    frame.size.height -= kStatuBarH+44;
    self.pagingView.frame = frame;
}

#pragma mark - JXPagingViewDelegate

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.userHeaderView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return JXTableHeaderViewHeight;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return 120;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.homeCategoryView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.titles.count;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    TestListBaseView *list = [[TestListBaseView alloc] init];
    if (index == 0) {
        list.dataSource = @[@"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮", @"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮"].mutableCopy;
    }else if (index == 1) {
        list.dataSource = @[@"吃烤肉", @"吃鸡腿肉", @"吃牛肉", @"各种肉"].mutableCopy;
    }else if (index == 2) {
        list.dataSource = @[@"【剑士】罗罗诺亚·索隆", @"【航海士】娜美", @"【狙击手】乌索普", @"【厨师】香吉士", @"【船医】托尼托尼·乔巴", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾"].mutableCopy;
    }
    return list;
}

- (void)pagerView:(JXPagerView *)pagerView mainTableViewDidScroll:(UIScrollView *)scrollView {
    
    if (!(scrollView.isTracking || scrollView.isDecelerating)) {
        //不是用户滚动的，比如setContentOffset等方法，引起的滚动不需要处理。
        return;
    }
    
    BOOL isTrue = scrollView.contentOffset.y >= self.userHeaderView.height;
    [self.homeCategoryView changeCategory:isTrue];
    
//    if (scrollView.contentOffset.y >= (self.userHeaderView.height)) {
//        self.homeCategoryView.backgroundColor = [UIColor redColor];
//    }else {
//        self.homeCategoryView.backgroundColor = [UIColor lightGrayColor];
//    }
//    self.homeCategoryView.categoryView.hidden = scrollView.contentOffset.y >= 200;
    
//    [self.userHeaderView scrollViewDidScroll:scrollView.contentOffset.y];

}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}



@end
