//
//  PlayerViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "PlayerViewController.h"
#import "ProgramsMedol.h"

@interface PlayerViewController () <PlayerDelagte>

@end
@implementation PlayerViewController 

static PlayerViewController *playerController = nil;

+ (instancetype)defaultPlayerController
{
    if ( playerController == nil) {
        playerController = [[PlayerViewController alloc]init];
        playerController.playerview= [[[NSBundle mainBundle] loadNibNamed:@"TSplayerView" owner:self options:nil]lastObject];
        playerController.playerview.frame = CGRectMake(0, 0, TSWedth, TSHeight);
        [playerController.view addSubview:playerController.playerview];
        
    }
    return playerController;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (playerController == nil) {
        playerController = [super allocWithZone:zone];
    }
    return playerController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerview.delagte = self;

}



-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];

}

#pragma mark－－ 创建音频播放器
-(void)createMPMoviePlayerCol:(NSString *)url
{
    self.player = nil;
    self.player = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:url]];
    self.player.controlStyle = MPMovieControlStyleFullscreen;
    [self.player.view setFrame: self.view.bounds];
    [self toPlay];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playMP3" object:nil];

    
}

-(void)setTitleName:(NSString *)titleName 
{
    _titleName = titleName;
    self.playerview.titleName  = _titleName;
    
}


-(void)setProgramsArray:(NSArray *)programsArray
{
    _programsArray = programsArray;
    
    // 判断是不是之前播放的那个音频文件
    if(self.currentIndex == self.index)
    {
        if (self.playerview.playButton.selected) {
            [self toPlay];
        }else
        {
            [self toPause];
        }
        
    }else
    {
        self.medol = _programsArray[self.index];
        self.playerview.storyintro = self.medol.name;
        self.currentIndex = self.index;
    }

}



-(void)setMedol:(ProgramsMedol *)medol
{
    _medol = medol;
    [self createMPMoviePlayerCol:_medol.mp3Url];
}

-(void)toPlay
{
    [self.player play];
    // 播放按钮的状态 与是否播放关联
    self.playerview.playButton.selected = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playMP3" object:nil];
    
}

-(void)toPause
{
    [self.player pause];
    self.playerview.playButton.selected = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pauseMP3" object:nil];

}


#pragma mark--<PlayerDelagte>
-(void)OnClickToReturn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)OnClickPlayerButton:(UIButton *)playButton
{
    playButton.selected =!playButton.selected;
    
    if (playButton.selected) {
        [self toPause];
    }
    else
    {
        [self toPlay];
    }
}

-(void)OnClickLastButton
{
    [self toPause];
    self.index = self.index - 1;
    if (self.index < 0 ) {
        self.index = (int)[self.programsArray count] - 1;
    }
    self.medol = self.programsArray[ self.index ];
}

-(void)OnClickNextButton
{
    [self toPause];
    self.index = self.index + 1;
    if (self.index == [self.programsArray count] ) {
        self.index = 0;
    }
    self.medol = self.programsArray[self.index];
    
}

-(void)OnClickBackTimeButton
{

}
-(void)OnClickForwardTimeButton
{

}



#pragma mark -播放前设置
- (void)prepareToPlayMusic
{
   
    
}
#pragma mark - 将秒数转为 00：00 时间格式
- (NSString *)fomatTimeToString:(double)duration
{
    int m = duration / 60;
    int s = (int)duration % 60;
    return [NSString stringWithFormat:@"%02d:%02d",m,s];
}
@end
