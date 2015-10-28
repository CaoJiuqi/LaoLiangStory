//
//  PlayerViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "PlayerViewController.h"
#import "TSplayerView.h"
#import "ProgramsMedol.h"

@interface PlayerViewController () <PlayerDelagte>
{
    NSTimer *_timer;
}

@property (nonatomic,strong)TSplayerView *playerview;

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
    
 

    
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changSliderValue) userInfo:nil repeats:YES];
    
    

    self.playerview.slider.maximumValue = 400;
    self.playerview.slider.value = 0;
    
    NSLog(@"%f",self.player.duration);

    
    [self.playerview.slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];

    
//    self.playerview.slider.value = self.player.currentPlaybackTime;

}

- (void)changSliderValue
{
    self.playerview.slider.value = self.player.currentPlaybackTime;

    self.playerview.starttimelabel.text = [self fomatTimeToString:self.player.currentPlaybackTime];
    
    
    
}

- (void)sliderAction
{
    self.player.currentPlaybackTime = self.playerview.slider.value;
 
}





-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];

}

#pragma mark－－ 创建音频播放器
-(void)createMPMoviePlayerCol:(NSString *)url
{
    self.player = nil;
    if( self.player == nil)
    {
        self.player = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:url]];
        [self.player.view setFrame: self.view.bounds];
        self.player.controlStyle = MPMovieControlStyleFullscreen;
        [self.player play];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"playMP3" object:nil];

    }
}


//-(void)setMp3Url:(NSString *)mp3Url
//{
//    _mp3Url = mp3Url;
//    // 通过判断是否是当前播放的数据，来判读是播放还是暂停
//    if (!self.isCurrentUrl) {
//        [self createMPMoviePlayerCol:_mp3Url];
//    }else
//    {
//        [self.player pause];
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"pauseMP3" object:nil];
//    }
//
//}

-(void)setHeadUrl:(NSString *)headUrl
{
    _headUrl = headUrl;
    
//    self.playerview.headURL = _headUrl;
//    self.playerview.storyintro = self.medol.name;

}

-(void)setTitleName:(NSString *)titleName
{
    _titleName = titleName;
    self.playerview.titleName  = _titleName;
    
}


-(void)setProgramsArray:(NSArray *)programsArray
{
    _programsArray = programsArray;
    self.medol = _programsArray[self.index];
    self.playerview.storyintro = self.medol.name;
    
    self.playerview.endtime = self.medol.changedDuration;
    
}



-(void)setMedol:(ProgramsMedol *)medol
{
    if (_medol != medol) {
        
        [self createMPMoviePlayerCol:medol.mp3Url];
        _medol = medol;
        _playerview.storyintro = medol.name;
    }else
    {
        [self.player pause];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pauseMP3" object:nil];
    }

    
    
    
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
        self.playerview.playButton.selected = playButton.selected;
        [self.player pause];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pauseMP3" object:nil];
    }
    else
    {
        [self.player play];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"playMP3" object:nil];
    }

    self.playerview.storyintro = _medol.name;
    
}
-(void)OnClickLastButton
{
    self.index = self.index - 1;
    if (self.index < 0 ) {
        self.index = (int)[self.programsArray count] - 1;
    }

    ProgramsMedol *medol = self.programsArray[ self.index ];
        [self createMPMoviePlayerCol:medol.mp3Url];

}
-(void)OnClickNextButton
{

    self.index = self.index + 1;
    
    if (self.index == [self.programsArray count] ) {
        self.index = 0;
    }
    
    NSLog(@"--%@",self.programsArray);
    
    ProgramsMedol *medol = self.programsArray[self.index];
    
    NSLog(@"nexturl:%@",medol.mp3Url);
    
    [self createMPMoviePlayerCol:medol.mp3Url];
    
}
-(void)OnClickBackTimeButton
{

}
-(void)OnClickForwardTimeButton
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
