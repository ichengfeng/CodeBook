//
//  UITableView+Refresh.h
//  BD
//
//  Created by Podinn on 2017/11/1.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

typedef void (^WhenPullingBlock)(void);

@interface UITableView (Refresh)

@property (strong, nonatomic)MJRefreshNormalHeader *refreshHeader;

@property (strong, nonatomic)MJRefreshBackNormalFooter *refreshFooter;

/**
 headerRefreshing
 */
- (void)headerWithRefreshingBlock:(WhenPullingBlock)block;

/**
 footerRefreshing
 */
- (void)footerWithRefreshingBlock:(WhenPullingBlock)block;


#pragma mark - MJ Refresh -
- (void)beginRefreshing;
- (void)endRefreshing;

@end
