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

}

-(void)setMedol:(ItemMedol *)medol
{
    _medol = medol;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_medol.largerImageUrl]];
    

    if(_medol.anuthorImageUrl == nil)
    {
     [self.anthorImageView sd_setImageWithURL:[NSURL URLWithString:@"http://183.136.166.248/cdn.lizhi.fm//user//avatar_132_640x640.jpg"]];
        
    }else
    {
        [self.anthorImageView sd_setImageWithURL:[NSURL URLWithString:_medol.anuthorImageUrl]];
    }
        
   
    
    self.titleLable.text = _medol.title;
}

-(void)setProgramsMedol:(ProgramsMedol *)programsMedol
{
    _programsMedol = programsMedol;
    self.storyname.text = _programsMedol.name;
    self.hitslabel.text = [NSString stringWithFormat:@"下载量%@",_programsMedol.downloadCount];
    self.timelabel.text = [NSString stringWithFormat:@"创建时间%@",_programsMedol.createTime];
    self.timelengthlabel.text = [NSString stringWithFormat:@"播放时长%@",_programsMedol.duration];

}



- (IBAction)playbutton:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0:
        {
            if ([self.delgate respondsToSelector:@selector(onClickToPlayer:withTag:withButton:)]) {
                [self.delgate onClickToPlayer:self.programsMedol.mp3Url withTag:self.tag withButton:sender];
            }
        }
            break;
        case 1:
        {
            
            
        }   break;
        case 2:
        {
        }
            break;
        
    }

    
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
