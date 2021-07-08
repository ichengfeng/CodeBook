//
//  CBFirstCollectionViewCell.h
//  CodeBook
//
//  Created by Podinn on 2019/5/28.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


- (void)loadDataWith:(NSString *)title;


@end

NS_ASSUME_NONNULL_END
