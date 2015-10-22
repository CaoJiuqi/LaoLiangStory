//
//  ItemView.m
//  LaoliangStory
//
//  Created by tens on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "ItemView.h"
#import "ItemMedol.h"
#import "UIImageView+WebCache.h"


@interface ItemView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *menuLable;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation ItemView



-(void)awakeFromNib
{


}

-(void)setMedol:(ItemMedol *)medol
{

    _medol = medol;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_medol.largerImageUrl]];
    self.titleLable.text = _medol.title;
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    if ([self.delegate respondsToSelector:@selector(OnClickViewkwithItem:)]) {

        [self.delegate OnClickViewkwithItem:self.markTag];
    }
    
}


@end
