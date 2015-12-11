//
//  SmallTableViewCell.h
//  日历
//
//  Created by 谢方振 on 15/12/10.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallView.h"
@protocol SmallTableViewCellDelegate<NSObject>

- (void)headerView:(UIView*)headerView point:(CGPoint)point;

@end
@interface SmallTableViewCell : UITableViewCell<SmallViewDelegate>
@property(nonatomic,weak)id<SmallTableViewCellDelegate> delegate;
@end
