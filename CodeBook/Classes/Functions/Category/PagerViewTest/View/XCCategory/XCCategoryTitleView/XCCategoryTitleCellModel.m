//
//  XCCategoryTitleCellModel.m
//  CodeBook
//
//  Created by mac on 2021/6/24.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "XCCategoryTitleCellModel.h"

@implementation XCCategoryTitleCellModel

- (void)setTitle:(NSString *)title {
    _title = title;

    [self updateNumberSizeWidthIfNeeded];
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;

    [self updateNumberSizeWidthIfNeeded];
}

- (void)updateNumberSizeWidthIfNeeded {
    if (self.titleFont) {
        _titleHeight = [self.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.titleFont} context:nil].size.height;
    }
}

@end
