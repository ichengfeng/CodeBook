//
//  CBWaitView.h
//  CodeBook
//
//  Created by Podinn on 2019/4/22.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBWaitView : UIView

//先都写在这个构造方法里面吧
- (instancetype)initWithFrame:(CGRect)frame;

- (void)dissmissWaitView;

@end

NS_ASSUME_NONNULL_END
