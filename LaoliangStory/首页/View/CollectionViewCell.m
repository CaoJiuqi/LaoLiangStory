//
//  CollectionViewCell.m
//  LaoliangStory
//
//  Created by tens on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.bgView = [[UIView alloc]init];
        self.bgView.frame = self.contentView.bounds;
        self.bgView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.bgView];
    }
    return self;
}

@end
