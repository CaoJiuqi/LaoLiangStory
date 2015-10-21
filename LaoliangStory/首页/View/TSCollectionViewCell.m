//
//  TSCollectionViewCell.m
//  LaoliangStory
//
//  Created by tens on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSCollectionViewCell.h"

@interface TSCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *itemLable;

@end


@implementation TSCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.bgView = [[UIView alloc]init];
        self.bgView.frame = self.contentView.bounds;
        self.bgView.backgroundColor =[UIColor redColor];
        [self.contentView addSubview:self.bgView];
    }
    return self;
}


@end
