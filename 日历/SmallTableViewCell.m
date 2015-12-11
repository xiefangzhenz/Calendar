//
//  SmallTableViewCell.m
//  日历
//
//  Created by 谢方振 on 15/12/10.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import "SmallTableViewCell.h"
#import "SmallView.h"
@implementation SmallTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self createUI];
        
    }
    
    
    return self;
}

- (void)createUI{
    
    for (int i = 0; i<10; i++) {
        
        SmallView* smallView = [[SmallView alloc]initWithFrame:CGRectMake(i*100, 0, 100-1, 30-1)];
        smallView.delegate = self;
        
        smallView.backgroundColor = [UIColor redColor];
        
        [self addSubview:smallView];
    }

    

}
- (void)headerView:(UIView*)headerView point:(CGPoint)point{

    [self.delegate headerView:headerView point:point];

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
