//
//  TimeView.h
//  日历
//
//  Created by 谢方振 on 15/12/11.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* timeTableView;
@end
