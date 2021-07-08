//
//  StackItemView.m
//  CodeBook
//
//  Created by mac on 2021/7/6.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "StackItemView.h"

@interface StackItemView ()

@property(nonatomic, strong)UIStackView *contentView;

@property(nonatomic, strong)UIImageView *firstImg;

@property(nonatomic, strong)UIImageView *secondImg;

@property(nonatomic, strong)UILabel *titleLabel;

@property(nonatomic, strong)UILabel *subTitleLabel;

@end

@implementation StackItemView

- (UIImageView *)firstImg {
    if (!_firstImg) {
        _firstImg = [[UIImageView alloc]init];
        _firstImg.backgroundColor = [UIColor lightGrayColor];
        _firstImg.image = [UIImage imageNamed:@"NoState"];
        _firstImg.contentMode = UIViewContentModeScaleAspectFit;
        _firstImg.layer.borderColor = [UIColor orangeColor].CGColor;
        _firstImg.layer.borderWidth = 1;
//        _firstImg.size = CGSizeMake(88, 40);
    }
    return _firstImg;
}

- (UIImageView *)secondImg {
    if (!_secondImg) {
        _secondImg = [[UIImageView alloc]init];
        _secondImg.backgroundColor = [UIColor lightGrayColor];
        _secondImg.image = [UIImage imageNamed:@"NoState"];
        _secondImg.contentMode = UIViewContentModeScaleAspectFit;
        _secondImg.layer.borderColor = [UIColor orangeColor].CGColor;
        _secondImg.layer.borderWidth = 1;
//        _secondImg.size = CGSizeMake(88, 40);
    }
    return _secondImg;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"kong kong";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.layer.borderColor = [UIColor orangeColor].CGColor;
        _titleLabel.layer.borderWidth = 1;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.text = @"zhe shi fu biao ti";
        _subTitleLabel.textColor = [UIColor blackColor];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.numberOfLines = 0;
        _subTitleLabel.layer.borderColor = [UIColor orangeColor].CGColor;
        _subTitleLabel.layer.borderWidth = 1;
    }
    return _subTitleLabel;
}

- (UIStackView *)contentView {
    if (!_contentView) {
        _contentView = [[UIStackView alloc]init];
        _contentView.axis = UILayoutConstraintAxisVertical;
        _contentView.distribution = UIStackViewDistributionFillEqually;
        _contentView.spacing = 10;
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _contentView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addArrangedSubview:self.firstImg];
        [self.contentView addArrangedSubview:self.titleLabel];
        [self.contentView addArrangedSubview:self.secondImg];
        
        [self.contentView addArrangedSubview:self.subTitleLabel];
        
    }
    return self;
}

- (void)setAxisDirection:(ItemAxisDirection)axisDirection {
    
    _axisDirection = axisDirection;
    
    self.contentView.axis = axisDirection;
}

- (void)setItemDistribution:(UIStackViewDistribution)itemDistribution {
    
    _itemDistribution = itemDistribution;
    self.firstImg.height = 30;
    self.secondImg.height = 30;
    self.contentView.distribution = itemDistribution;
}

- (void)setContentType:(ItemContentType)contentType {
    
    _contentType = contentType;
        
    switch (contentType) {
        case ItemContentTypeForAll:{
            self.firstImg.hidden = NO;
            self.secondImg.hidden = NO;
            self.titleLabel.hidden = NO;
            self.subTitleLabel.hidden = NO;
        }
            break;
        case ItemContentTypeForOnlyFirst:{
            self.firstImg.hidden = NO;
            self.secondImg.hidden = NO;
            self.titleLabel.hidden = YES;
            self.subTitleLabel.hidden = YES;
        }
            break;
        default:{
            self.firstImg.hidden = YES;
            self.secondImg.hidden = YES;
            self.titleLabel.hidden = NO;
            self.subTitleLabel.hidden = NO;
        }
            break;
    }
    
}

@end
