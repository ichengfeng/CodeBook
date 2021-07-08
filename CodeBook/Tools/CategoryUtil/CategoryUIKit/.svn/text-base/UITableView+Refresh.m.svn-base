//
//  UITableView+Refresh.m
//  BD
//
//  Created by Podinn on 2017/11/1.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import "UITableView+Refresh.h"
#import <objc/runtime.h>

@implementation UITableView (Refresh)

static char kWhenPullingBlockKey;
static char kWhenDragingBlockKey;

- (void)setRefreshHeader:(MJRefreshNormalHeader *)refreshHeader {
    self.refreshHeader = refreshHeader;
}

- (MJRefreshNormalHeader *)refreshHeader  {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{[self runBlockForKey:&kWhenPullingBlockKey];
    }];
    [header setTitle:@"下拉即可刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松手即可更新" forState:MJRefreshStatePulling];
    [header setTitle:@"正拼命为您搬运数据 ..." forState:MJRefreshStateRefreshing];
    header.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];
    
    return header;
}

- (void)setRefreshFooter:(MJRefreshBackNormalFooter *)refreshFooter {
    self.refreshFooter = refreshFooter;
}

- (MJRefreshBackNormalFooter *)refreshFooter {
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self runBlockForKey:&kWhenDragingBlockKey];
    }];
    // 设置文字
    [footer setTitle:@"上拉即可加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"正拼命为您搬运数据 ..." forState:MJRefreshStateRefreshing];
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:15];
    
    return footer;
}

#pragma mark ------------ Set blocks ------------
- (void)runBlockForKey:(void *)blockKey {
    
    WhenPullingBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) block();
}

- (void)setBlock:(WhenPullingBlock)block forKey:(void *)blockKey {
    
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark ------------ Response ----------------
- (void)headerWithRefreshingBlock:(WhenPullingBlock)block {
    
    self.mj_header = self.refreshHeader;
    
    [self setBlock:block forKey:&kWhenPullingBlockKey];
}

- (void)footerWithRefreshingBlock:(WhenPullingBlock)block {
    
    self.mj_footer = self.refreshFooter;
    
    [self setBlock:block forKey:&kWhenDragingBlockKey];
}

#pragma mark ------------ Callbacks ------------

- (void)tableViewWasPulling {
    [self runBlockForKey:&kWhenPullingBlockKey];
}

- (void)tableViewWasDraging {
    [self runBlockForKey:&kWhenDragingBlockKey];
}

#pragma mark - MJ Refresh -

- (void)beginRefreshing {
    [self.mj_header beginRefreshing];
}

- (void)endRefreshing {
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer.isRefreshing) {
        [self.mj_footer endRefreshing];
    }
}
@end
