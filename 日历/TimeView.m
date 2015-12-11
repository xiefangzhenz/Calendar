//
//  TimeView.m
//  日历
//
//  Created by 谢方振 on 15/12/11.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        [self createUI];
        
    }
    
    return self;


}
- (void)createUI{

    _timeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    _timeTableView.delegate = self;
    
    _timeTableView.dataSource = self;
    
    _timeTableView.backgroundColor = [UIColor blueColor];
    
    _timeTableView.userInteractionEnabled = NO;
    
    [self addSubview:_timeTableView];

}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;


}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 30;

}
@end
