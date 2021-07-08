//
//  CBTransformViewController.m
//  CodeBook
//
//  Created by chengfeng on 2019/7/21.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import "TransformViewController.h"
#import "WalkingBeansSucceedView.h"
#import <NormalTools/NormalToos.h>
@interface TransformViewController ()
{
    UIView *redView;
}

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.with.offset(30);
        make.topMargin.with.offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGes:)];
    [redView addGestureRecognizer:tapGes];
    
    if (@available(iOS 10.0, *)) {
        [NSTimer scheduledTimerWithTimeInterval:3.f repeats:YES block:^(NSTimer * _Nonnull timer) {
            CABasicAnimation* rotationAnimation = [CABasicAnimation animation];;
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
            rotationAnimation.duration = 1;
            // 切换界面保证动画不停止
            rotationAnimation.removedOnCompletion = NO;
            rotationAnimation.repeatCount = 1;
            [self->redView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        }];
    } else {
        // Fallback on earlier versions
    }
    
}

- (void)tapGes:(UIGestureRecognizer *)ges {
    NSLog(@"点击了红色方块啊");
    [WalkingBeansSucceedView show:@{@"contentTxt":@"大家伙！\n恭喜你完成了任务啊！\n恭喜你完成了任务啊！"}];
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
