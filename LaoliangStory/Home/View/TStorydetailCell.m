//
//  StorydetailCell.m
//  LaoliangStory
//
//  Created by zjq on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TStorydetailCell.h"
#import "UIImageView+WebCache.h"


@interface TStorydetailCell ()

@property (weak, nonatomic) IBOutlet UIView *headview;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIImageView *anthorImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UITextView *introduceLable;



@property (weak, nonatomic) IBOutlet UILabel *storyname;

@property (weak, nonatomic) IBOutlet UILabel *hitslabel;

@property (weak, nonatomic) IBOutlet UILabel *timelabel;

@property (weak, nonatomic) IBOutlet UILabel *timelengthlabel;

@property (weak, nonatomic) IBOutlet UIButton *forwardbutton;
@property (weak, nonatomic) IBOutlet UIButton *downbutton;

@end

@implementation TStorydetailCell

- (void)awakeFromNib {

    self.forwardbutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.forwardbutton.layer.borderWidth = 0.8;

    self.downbutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.downbutton.layer.borderWidth = 0.8;

    self.storyname.text = @"明天";
}

-(void)setMedol:(ItemMedol *)medol
{
    _medol = medol;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_medol.largerImageUrl]];
    NSLog(@"--->%@",_medol.title);
    
    self.titleLable.text = _medol.title;
}



- (IBAction)playbutton:(UIButton *)sender {
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
