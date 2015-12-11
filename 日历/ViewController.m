//
//  ViewController.m
//  日历
//
//  Created by 谢方振 on 15/12/10.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import "ViewController.h"
#import "SmallTableViewCell.h"
#import "TimeView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,SmallTableViewCellDelegate>
{
    UITableView* _mainTableView;
    
    UIScrollView* _mainScrollView;
    
    UIView* _headerView;
    
    TimeView* _timeView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];

    
}

- (void)createUI{

    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100*10, 50)];

    
    for (int i = 0; i<10; i++) {
        
        UIView* view = [[UIView alloc]initWithFrame:CGRectMake(i*100, 0, 100-1, 50)];
        
        view.backgroundColor = [UIColor greenColor];
        
        [_headerView addSubview:view];

    }
    
    
    
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, _headerView.frame.size.width, [UIScreen mainScreen].bounds.size.height-20) style:UITableViewStylePlain];
    
    
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(50, 20, self.view.frame.size.width-50, self.view.frame.size.height-20)];
    
    _mainScrollView.contentSize = CGSizeMake(_headerView.frame.size.width, 0);
    
    _mainScrollView.bounces = NO;
    
    [self.view addSubview:_mainScrollView];
    
    [_mainScrollView addSubview:_mainTableView];
    
    _mainTableView.delegate = self;
    
    _mainTableView.dataSource = self;
    
    _timeView = [[TimeView alloc]initWithFrame:CGRectMake(0, _mainScrollView.frame.origin.y+_headerView.frame.size.height, 50, _mainTableView.frame.size.height)];
    
    [self.view addSubview:_timeView];
    
    
    
    
    
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 50;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"cell";
    
    SmallTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[SmallTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.delegate = self;
    }
    
    return cell;
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return _headerView;
}


- (void)headerView:(UIView*)headerView point:(CGPoint)point{

    CGPoint currentPoint = [_mainTableView convertPoint:point fromView:headerView];
    
    [self convertCellFromPoint:currentPoint];

}
-(void)convertCellFromPoint:(CGPoint)point{

    NSInteger row = (point.y-50)/30;
    NSInteger colum = (point.x)/100;
    
    NSLog(@"%ld %ld",row,colum);

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat mainTableViewOffsetY = _mainTableView.contentOffset.y;
    
    CGPoint timeViewOffsetY = _timeView.timeTableView.contentOffset;
    
    timeViewOffsetY.y = mainTableViewOffsetY;
    
    _timeView.timeTableView.contentOffset = timeViewOffsetY;
    
    if (mainTableViewOffsetY == 0) {
        
        _timeView.timeTableView.contentOffset = CGPointZero;
    }
    
    


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
