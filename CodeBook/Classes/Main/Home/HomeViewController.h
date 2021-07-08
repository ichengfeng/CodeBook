//
//  CBFirstViewController.h
//  CodeBook
//
//  Created by Podinn on 2019/5/27.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

//@"DataCache数据存储",@"音频播放",@"视频播放",@"地图导航",@"网页交互",@"地址选取",@"绘图",@"动画",@"支付",@"推送",@"短信邮件",@"重力感应\n加速度/指南针",@"多语言支持",@"换皮肤"
#define TITLE_ARRAY [NSArray arrayWithObjects:@"二维码扫描",@"照片获取",@"分享",@"代码布局",@"类目选择",@"解除联动",@"PagerViewTest",@"条形码扫描",@"ZXing",@"ZBar",@"StackView",@"Predicate", nil]

//@"FMDBViewController"
#define NIB_ARRAY [NSArray arrayWithObjects:@"SWQRCodeViewController",@"TransformViewController",@"CBShareViewController",@"MasonryViewController",@"CategoryTestController",@"ScrollTestViewController",@"PagerViewTestController",@"QRCodeTestViewController",@"ZXingTestViewController",@"ZBarTestViewController",@"StackViewTestController",@"PredicateTestViewController", nil]

@interface HomeViewController : BaseViewController

@end

NS_ASSUME_NONNULL_END
