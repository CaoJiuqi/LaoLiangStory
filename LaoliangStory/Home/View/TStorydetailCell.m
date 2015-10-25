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
    
    self.hitslabel.text = [NSString stringWithFormat:@"%@万",_programsMedol.downloadCount];
    
    self.timelengthlabel.text = [self fomatTimeToString:[_programsMedol.duration doubleValue ]];
    
   [self fomatdateaction:_programsMedol.createTime.description];
    

}
#pragma mark - 将秒数转为时间格式
- (NSString *)fomatTimeToString:(double)duration
{
    int m = duration / 60;
    int s = (int)duration % 60;
    
    return [NSString stringWithFormat:@"时长 %02d'%02d'' ",m,s];
    
    
}

#pragma mark - 时间格式数据
- ( void)fomatdateaction:(NSString *)createTime
{
    
    NSString *str = createTime;
    
    NSTimeInterval time = [str doubleValue]+2800;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];

    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * datestr = [formater stringFromDate:date];

    self.timelabel.text = datestr;
    
}


- (IBAction)playbutton:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0:
        {
            sender.selected = !sender.selected;
            if ([self.delgate respondsToSelector:@selector(onClickToPlayer:withTag:)]) {
                [self.delgate onClickToPlayer:self.programsMedol.mp3Url withTag:self.celltag];
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

- (IBAction)forwardbuttonaction:(UIButton *)sender {
}


- (IBAction)downloadbuttonaction:(UIButton *)sender {
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
