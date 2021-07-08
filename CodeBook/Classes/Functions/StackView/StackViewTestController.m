//
//  StackViewTestController.m
//  CodeBook
//
//  Created by mac on 2021/7/6.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "StackViewTestController.h"
#import "StackItemView.h"

@interface StackViewTestController ()

@property(nonatomic, strong)StackItemView *itemView;

@property(nonatomic, strong)UIButton *changeDirectionBtn;

@property(nonatomic, strong)UIStackView *stackView;

@property(nonatomic, strong)UIButton *showAll;

@property(nonatomic, strong)UIButton *onlyImage;

@property(nonatomic, strong)UIButton *onlyTitle;

@property(nonatomic, strong)UIStackView *disStackView;

@property(nonatomic, strong)UIButton *oldBtn;

@property(nonatomic, strong)UIButton *nextBtn;

@end

@implementation StackViewTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemView.hidden = NO;
    self.changeDirectionBtn.hidden = NO;
    
    [self.stackView addArrangedSubview:self.showAll];
    [self.stackView addArrangedSubview:self.onlyImage];
    [self.stackView addArrangedSubview:self.onlyTitle];
    
    NSArray *disArr = @[@"Fill",@"FillEqually",@"FillProportionally",@"EqualSpacing",@"EqualCentering"];
    for (NSString *title in disArr) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
        button.layer.borderColor = [UIColor orangeColor].CGColor;
        button.layer.borderWidth = 1;
        button.tag = [disArr indexOfObject:title];
        [self.disStackView addArrangedSubview:button];
        [button addTarget:self action:@selector(disStackViewItemDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.nextBtn.hidden = NO;
}

- (void)disStackViewItemDidClick:(UIButton *)sender {
    NSInteger tag = sender.tag;
    sender.selected = YES;
    if (self.oldBtn) {
        self.oldBtn.selected = NO;
    }
    self.oldBtn = sender;
    switch (tag) {
        case 0: {//充满，并且根据内部子视图尺寸对子视图尺寸进行动态调整
            self.itemView.itemDistribution = UIStackViewDistributionFill;
        }
            break;
        case 1:{//平分充满，每个控件占据相同尺寸排列充满
            self.itemView.itemDistribution = UIStackViewDistributionFillEqually;
        }
            break;
        case 2:{//根据之前的比例填充
            self.itemView.itemDistribution = UIStackViewDistributionFillProportionally;
        }
            break;
        case 3:{//等间距排列
            self.itemView.itemDistribution = UIStackViewDistributionEqualSpacing;
        }
            break;
        default: {//所有子视图的中心之间的距离保持一致
            self.itemView.itemDistribution = UIStackViewDistributionEqualCentering;
        }
            break;
    }
}

- (StackItemView *)itemView {
    if (!_itemView) {
        _itemView = [[StackItemView alloc]init];
        _itemView.layer.borderColor = [UIColor orangeColor].CGColor;
        _itemView.layer.borderWidth = 1;
        [self.view addSubview:_itemView];
        [_itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view).offset(-100);
            make.size.mas_equalTo(CGSizeMake(300, 200));
        }];
    }
    return _itemView;
}

- (UIButton *)changeDirectionBtn {
    if (!_changeDirectionBtn) {
        _changeDirectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeDirectionBtn setTitle:@"改变排布方向" forState:UIControlStateNormal];
        [_changeDirectionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _changeDirectionBtn.layer.borderColor = [UIColor orangeColor].CGColor;
        _changeDirectionBtn.layer.borderWidth = 1;
        [self.view addSubview:_changeDirectionBtn];
        [_changeDirectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.itemView.mas_bottom).offset(50);
            make.size.mas_equalTo(CGSizeMake(180, 40));
        }];
        MJWeakSelf
        [_changeDirectionBtn whenTapped:^{
            weakSelf.changeDirectionBtn.selected = !weakSelf.changeDirectionBtn.isSelected;
            weakSelf.itemView.axisDirection = weakSelf.changeDirectionBtn.isSelected ? ItemAxisForVertical : ItemAxisForHorizontal;
        }];
    }
    return _changeDirectionBtn;
}

- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [[UIStackView alloc]init];
        _stackView.axis = UILayoutConstraintAxisHorizontal;
        _stackView.distribution = UIStackViewDistributionFillEqually;
        [self.view addSubview:_stackView];
        [_stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.changeDirectionBtn.mas_bottom).offset(35);
            make.height.mas_equalTo(50);
        }];
    }
    return _stackView;
}

- (UIButton *)showAll {
    if (!_showAll) {
        _showAll = [[UIButton alloc]init];
        [_showAll setTitle:@"图文" forState:UIControlStateNormal];
        [_showAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _showAll.layer.borderColor = [UIColor orangeColor].CGColor;
        _showAll.layer.borderWidth = 1;
        MJWeakSelf
        [_showAll whenTapped:^{
            weakSelf.itemView.contentType = ItemContentTypeForAll;
        }];
    }
    return _showAll;
}

- (UIButton *)onlyImage {
    if (!_onlyImage) {
        _onlyImage = [[UIButton alloc]init];
        [_onlyImage setTitle:@"图片" forState:UIControlStateNormal];
        [_onlyImage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _onlyImage.layer.borderColor = [UIColor orangeColor].CGColor;
        _onlyImage.layer.borderWidth = 1;
        MJWeakSelf
        [_onlyImage whenTapped:^{
            weakSelf.itemView.contentType = ItemContentTypeForOnlyFirst;
        }];
    }
    return _onlyImage;
}

- (UIButton *)onlyTitle {
    if (!_onlyTitle) {
        _onlyTitle = [[UIButton alloc]init];
        [_onlyTitle setTitle:@"文字" forState:UIControlStateNormal];
        [_onlyTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _onlyTitle.layer.borderColor = [UIColor orangeColor].CGColor;
        _onlyTitle.layer.borderWidth = 1;
        MJWeakSelf
        [_onlyTitle whenTapped:^{
            weakSelf.itemView.contentType = ItemContentTypeForOnlySecond;
        }];
    }
    return _onlyTitle;
}

- (UIStackView *)disStackView {
    if (!_disStackView) {
        _disStackView = [[UIStackView alloc]init];
        _disStackView.axis = UILayoutConstraintAxisHorizontal;
        _disStackView.distribution = UIStackViewDistributionFillEqually;
        [self.view addSubview:_disStackView];
        [_disStackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.stackView.mas_bottom).offset(35);
            make.height.mas_equalTo(50);
        }];
    }
    return _disStackView;
}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc]init];
        [_nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _nextBtn.layer.borderColor = [UIColor orangeColor].CGColor;
        _nextBtn.layer.borderWidth = 1;
        [self.view addSubview:_nextBtn];
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.disStackView.mas_bottom).offset(35);
            make.height.mas_equalTo(50);
        }];
        [_nextBtn whenTapped:^{
            StackViewDemoController *demoVC = [[StackViewDemoController alloc]initWithNibName:nil bundle:nil];
            demoVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:demoVC animated:YES];
        }];
    }
    return _nextBtn;
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
