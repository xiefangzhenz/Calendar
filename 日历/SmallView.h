//
//  SmallView.h
//  日历
//
//  Created by 谢方振 on 15/12/10.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SmallViewDelegate<NSObject>

- (void)headerView:(UIView*)headerView point:(CGPoint)point;

@end
@interface SmallView : UIView
@property(nonatomic,weak)id<SmallViewDelegate> delegate;
@end
