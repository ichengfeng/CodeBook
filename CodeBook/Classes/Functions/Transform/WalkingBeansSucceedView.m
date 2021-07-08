//
//  WalkingBeansSucceedView.m
//  zmjx
//
//  Created by chengfeng on 2020/2/12.
//  Copyright © 2020 于浦洋. All rights reserved.
//

#import "WalkingBeansSucceedView.h"

#define adjustRatio ([[UIScreen mainScreen] bounds].size.width/375.0)
//#import "FeedView.h"

@interface WalkingBeansSucceedView ()
@property(nonatomic,strong)UIView *bgView,*adView;
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UILabel *titleLabel,*guessLikeLabel;
@property(nonatomic,strong)UIButton *closeBtn;
@end

@implementation WalkingBeansSucceedView
//sleep_bg
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.bgView.hidden = NO;
        self.titleLabel.hidden = NO;
        self.guessLikeLabel.text = @"猜你喜欢";
        self.adView.hidden = NO;
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        self.closeBtn.hidden = NO;
//        [FeedView show:FEED_SLEEP_GET_BEANS superView:self.adView frame:CGRectMake(0, 0, 247*adjustRatio, 101*adjustRatio)];
    }
    return self;
}
- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor clearColor];
        [self addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(288*adjustRatio);
            make.height.mas_equalTo(357*adjustRatio);
            make.center.equalTo(self);
        }];
        UIImageView *imageView = [[UIImageView alloc] init];
        self.bgImageView = imageView;
        imageView.image = [UIImage imageNamed:@"walking_bg"];
        [_bgView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self->_bgView);
        }];
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:16*adjustRatio];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _titleLabel.text = @"恭喜完成挑战！\n等活动结束即可瓜分奖金哦～";
        [self.bgView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView).offset(111*adjustRatio);
            make.left.equalTo(self.bgView).offset(20*adjustRatio);
            make.right.equalTo(self.bgView.mas_right).offset(-20*adjustRatio);
        }];
    }
    return _titleLabel;
}

- (UILabel *)guessLikeLabel {
    if (_guessLikeLabel == nil) {
        _guessLikeLabel = [[UILabel alloc] init];
        _guessLikeLabel.textColor = [UIColor colorWithRed:171/255.0 green:171/255.0 blue:171/255.0 alpha:1.0];
        _guessLikeLabel.font = [UIFont systemFontOfSize:15*adjustRatio];
        [self.bgView addSubview:_guessLikeLabel];
        [_guessLikeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bgView);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(16*adjustRatio);
        }];
        UIView *leftLine = [[UIView alloc] init];
        leftLine.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        [self.bgView addSubview:leftLine];
        [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self->_guessLikeLabel);
            make.right.equalTo(self->_guessLikeLabel.mas_left).offset(-12*adjustRatio);
            make.width.mas_equalTo(85*adjustRatio);
            make.height.mas_equalTo(1*adjustRatio);
        }];
        
        UIView *rightLine = [[UIView alloc] init];
        rightLine.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        [self.bgView addSubview:rightLine];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self->_guessLikeLabel);
            make.left.equalTo(self->_guessLikeLabel.mas_right).offset(12*adjustRatio);
            make.width.mas_equalTo(85*adjustRatio);
            make.height.mas_equalTo(1*adjustRatio);
        }];
    }
    return _guessLikeLabel;
}
- (UIView *)adView {
    if (_adView == nil) {
        _adView = [[UIView alloc] init];
        _adView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
        [self.bgView addSubview:_adView];
        [_adView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(247*adjustRatio);
            make.height.mas_equalTo(101*adjustRatio);
            make.centerX.equalTo(self.bgView);
            make.bottom.equalTo(self.bgView).offset(-23*adjustRatio);
        }];
    }
    return _adView;
}

- (UIButton *)closeBtn {
    if (_closeBtn == nil) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:[UIImage imageNamed:@"关  闭"] forState:UIControlStateNormal];
        [self addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.bgView.mas_bottom).offset(17*adjustRatio);
            make.width.height.mas_equalTo(26*adjustRatio);
        }];
        [_closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (void)closeAction {
    [self removeFromSuperview];
}

+ (void)show:(NSDictionary*)params {
    NSString *contentTxt = params[@"contentTxt"];
    WalkingBeansSucceedView *walkingView = [[WalkingBeansSucceedView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    walkingView.titleLabel.text = @"恭喜完成挑战！\n等活动结束即可瓜分奖金哦～";
    if (contentTxt) {
        walkingView.titleLabel.text = contentTxt;
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:walkingView];
}

@end
