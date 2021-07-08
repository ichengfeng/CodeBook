//
//  CBBaseViewController.m
//  CodeBook
//
//  Created by Podinn on 2019/5/27.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>


@property (nonatomic, retain) UILabel *titleLabel;

- (UILabel *)getNavigationTitle;

@end

@implementation BaseViewController

- (UILabel *)getNavigationTitle {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (self.view.frame.size.width/3.0)*2, self.navigationController.navigationBar.height)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

/*
 @abstract 设置导航栏上的标题
 @param title 标题
 */
- (void)setTitle:(NSString *)title {
    
    if (title) {
        self.titleLabel.text = title;
    }
}

- (NSString *)title {
    return self.titleLabel.text;
}

/*
 @method
 @abstract 设置是否隐藏返回按钮
 @param hidden 是否隐藏
 */
- (void)setBackItemHidden:(BOOL)hidden {
    if (hidden) {
        self.navigationItem.leftBarButtonItem = nil;
    }
    else {
        self.navigationItem.leftBarButtonItem = [BDPublicView navigationBackWithFrame:CGRectMake(0, 0, 20., 20.) target:self action:@selector(backToPopViewController)];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = [[UIScreen mainScreen] bounds];
    self.view.backgroundColor = [UIColor colorWithHexString:@"ebebeb"];
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    
    [self setBackItemHidden:NO];
    self.navigationItem.titleView = [self getNavigationTitle];
    
}

//UIGestureRecognizerDelegate 重写侧滑协议
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return [self gestureRecognizerShouldBegin];
}
- (BOOL)gestureRecognizerShouldBegin {
    return YES;
}

#pragma mark ---------- 返回按钮触发方法 -----------
/*
 返回上一级
 */
- (void)backToPopViewController
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Some Method
- (void)pageJumpTo:(NSString *)nibName {
    const char *className = [nibName cStringUsingEncoding:NSASCIIStringEncoding];
    // 从一个字串返回一个类
    Class newClass = objc_getClass(className);
    if (!newClass)
    {
        // 创建一个类
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        // 注册你创建的这个类
        objc_registerClassPair(newClass);
    }
    // 创建对象
    id instance = [[newClass alloc] init];
    
    UIViewController *controller = instance;
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

- (CGFloat)statusBarHeight {
    if (@available(iOS 14.0, *)) {
        UIScene *scene = UIApplication.sharedApplication.connectedScenes.anyObject;
        return [scene isKindOfClass:[UIWindowScene class]] ? [(UIWindowScene *)scene statusBarManager].statusBarFrame.size.height:20;
    } else {
        return UIApplication.sharedApplication.statusBarFrame.size.height;
    }
}

- (CGFloat)safeAreaBottom {
    if (@available(iOS 11.0, *)) {
        //用scene的项目需要注意
        return UIApplication.sharedApplication.windows.firstObject.safeAreaInsets.bottom;
    } else {
        return 0;
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
