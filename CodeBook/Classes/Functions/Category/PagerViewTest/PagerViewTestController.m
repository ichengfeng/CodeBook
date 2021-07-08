//
//  PagerViewTestController.m
//  CodeBook
//
//  Created by mac on 2021/6/15.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "PagerViewTestController.h"
#import "TestListBaseView.h"
#import "PagingViewTableHeaderView.h"
#import "TopHeadView.h"
#import "PagerCategoryView.h"

static const CGFloat JXTableHeaderViewHeight = 200;

@interface PagerViewTestController ()<JXPagerViewDelegate,JXCategoryViewDelegate>

@property(nonatomic, strong)TopHeadView *topPinView;

@property (nonatomic, strong) PagingViewTableHeaderView *userHeaderView;

//@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property(nonatomic, strong)PagerCategoryView *categoryMangerView;

@property(nonatomic, strong)JXPagerView *pagerView;

@property (nonatomic, strong) NSArray <NSString *> *titles;

@end

@implementation PagerViewTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = @[@"能力", @"爱好", @"队友",@"奥特曼",@"葫芦娃",@"西游记"];
    
    self.userHeaderView = [[PagingViewTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, JXTableHeaderViewHeight)];
    
    self.pagerView = [[JXPagerView alloc] initWithDelegate:self];
    self.pagerView.pinSectionHeaderVerticalOffset = 14;
    [self.view addSubview:self.pagerView];

    ///将pagerView的listContainerView和categoryView.listContainer进行关联，这样列表就可以和categoryView联动了。
    self.categoryMangerView.categoryTitleImageView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
    self.categoryMangerView.categoryOnlyTitleView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
    self.categoryMangerView.categoryTitleImageView.delegate = self;
    self.categoryMangerView.categoryOnlyTitleView.delegate = self;
    
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryMangerView.categoryTitleImageView.selectedIndex == 0);
    
    self.topPinView.hidden = YES;
    
}

- (TopHeadView *)topPinView {
    if (!_topPinView) {
        _topPinView = [[TopHeadView alloc]init];
        [self.view addSubview:_topPinView];
        [_topPinView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self.view);
        }];
    }
    return _topPinView;
}

- (PagerCategoryView *)categoryMangerView {
    if (!_categoryMangerView) {
        _categoryMangerView = [[PagerCategoryView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    }
    return _categoryMangerView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGRect frame = self.view.bounds;
    self.pagerView.frame = frame;
}


#pragma mark - - -
- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.userHeaderView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return JXTableHeaderViewHeight;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.categoryMangerView.height;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.categoryMangerView;
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
    }else if (index == 3) {
        list.dataSource = @[@"奥特之父", @"迪迦奥特曼", @"泰罗奥特曼", @"赛文奥特曼",@"艾欧尼亚"].mutableCopy;
    }else if (index == 4) {
        list.dataSource = @[@"大娃", @"二娃", @"三娃", @"四娃",@"五娃",@"六娃",@"七娃",@"蛇精",@"葫芦藤",@"爷爷"].mutableCopy;
    }else if (index == 5) {
        list.dataSource = @[@"孙悟空", @"猪八戒", @"沙悟净", @"唐三藏",@"东海龙王",@"西海龙王",@"牛魔王",@"铁扇公主",@"虾兵",@"蟹将"].mutableCopy;
    }
    return list;
}

- (void)pagerView:(JXPagerView *)pagerView mainTableViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"===== Did Scroll");
    CGFloat offset = scrollView.contentOffset.y;
    if (offset > (JXTableHeaderViewHeight - self.topPinView.height*2)) {
        CGFloat offsetY = offset - (JXTableHeaderViewHeight - self.topPinView.height*2);
        
        self.topPinView.hidden = NO;
        self.topPinView.alpha = offsetY >= self.topPinView.height ? 1.0 : offsetY/self.topPinView.height;
        
        if (offsetY - 114 >= 0) {
            [self.categoryMangerView changeCategory:YES];
        }else {
            [self.categoryMangerView changeCategory:NO];
        }
        
    }else {
        self.topPinView.hidden = YES;
    }
}

- (void)pagerView:(JXPagerView *)pagerView mainTableViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"===== Will Begin Dragging");
}

- (void)pagerView:(JXPagerView *)pagerView mainTableViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"===== Did End Dragging");
}

- (void)pagerView:(JXPagerView *)pagerView mainTableViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"===== Did End Decelerating");
}

- (void)pagerView:(JXPagerView *)pagerView mainTableViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"===== Did End Scrolling");
}

#pragma mark - - -
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    [self.pagerView.listContainerView didClickSelectedItemAtIndex:index];
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    
    if (categoryView == self.categoryMangerView.categoryTitleImageView) {
        if (self.categoryMangerView.categoryOnlyTitleView.hidden == YES) {
            [self.categoryMangerView.categoryOnlyTitleView selectItemAtIndex:index];
        }
    }
    
    if (categoryView == self.categoryMangerView.categoryOnlyTitleView) {
        if (self.categoryMangerView.categoryTitleImageView.hidden == YES) {
            [self.categoryMangerView.categoryTitleImageView selectItemAtIndex:index];
        }
    }
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
