//
//  TopHeadView.m
//  CodeBook
//
//  Created by mac on 2021/6/18.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "TopHeadView.h"

@interface TopHeadView ()

@property(nonatomic, strong)UIImageView *bgImg;

@property(nonatomic, strong)UILabel *titleLabel;

@end

@implementation TopHeadView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.bgImg.hidden = NO;
        self.titleLabel.hidden = NO;
    }
    return self;
}

- (UIImageView *)bgImg {
    if (!_bgImg) {
        _bgImg = [[UIImageView alloc]init];
        _bgImg.image = [UIImage imageNamed:@"nav"];
        [self addSubview:_bgImg];
        [_bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _bgImg;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"它喵的就是个标题啊";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18*adjustRatio weight:UIFontWeightMedium];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
            make.height.mas_equalTo(64).priorityHigh();
        }];
    }
    return _titleLabel;
}

@end
