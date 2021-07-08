//
//  CBFirstCollectionViewCell.m
//  CodeBook
//
//  Created by Podinn on 2019/5/28.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import "FirstCollectionViewCell.h"

@implementation FirstCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.layer.cornerRadius = 5.0;
    self.titleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.titleLabel.layer.borderWidth = 1.0;
}

- (void)loadDataWith:(NSString *)title {
    self.titleLabel.text = title;
}

@end
