//
//  SmallView.m
//  日历
//
//  Created by 谢方振 on 15/12/10.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import "SmallView.h"

@implementation SmallView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        
    }
    return self;


}

- (void)createUI{

    UITapGestureRecognizer* tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    [self addGestureRecognizer:tapGes];

}

- (void)tapAction:(UITapGestureRecognizer*)ges{

    CGPoint point = [ges locationInView:self];
    
    [self.delegate headerView:self point:point];
    

}
@end
