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

@property (nonatomic,strong)TSplayerView *playerview;

@end
@implementation PlayerViewController 

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerview= [[[NSBundle mainBundle] loadNibNamed:@"TSplayerView" owner:self options:nil]lastObject];
        _playerview.frame = CGRectMake(0, 0, TSWedth, TSHeight);
        _playerview.delagte = self;
        [self.view addSubview:_playerview];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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

    }
}


-(void)setMp3Url:(NSString *)mp3Url
{
    _mp3Url = mp3Url;
    if (!self.isCurrentUrl) {
        [self createMPMoviePlayerCol:_mp3Url];
    }else
    {
        [self.player pause];
        
    }

}

-(void)setHeadUrl:(NSString *)headUrl
{
    _headUrl = headUrl;
    
    self.playerview.headURL = _headUrl;
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
        [self.player pause];
    }
    else
    {
        [self.player play];
    }

    
}
-(void)OnClickLastButton
{
    self.index = self.index - 1;
    if (self.index < 0 ) {
        self.index = (NSInteger *) [self.programsArray count] - 1;
    }

    ProgramsMedol *medol = self.programsArray[ (int)--self.index ];
        [self createMPMoviePlayerCol:medol.mp3Url];

}
-(void)OnClickNextButton
{

    self.index = self.index + 1;
    
    if (self.index == (NSInteger *)[self.programsArray count] ) {
        self.index = 0;
    }
    ProgramsMedol *medol = self.programsArray[(int)(self.index)];
    
    NSLog(@"nexturl:%@",medol.mp3Url);
    
    [self createMPMoviePlayerCol:medol.mp3Url];
    
}
-(void)OnClickBackTimeButton
{

}
-(void)OnClickForwardTimeButton
{

}


//
//- (AVAudioPlayer *)audioPlayer
//{
//    if (_audioPlayer == nil) {
//
//        NSString *musicPath = [[NSBundle mainBundle] pathForResource:_audioInfo[@"name"] ofType:@"mp3"];
//
//        NSURL *musicURL = [NSURL fileURLWithPath:musicPath];
//
//        NSError *error;
//
//        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:&error];
//
//        _audioPlayer.delegate = self;
//
//        // 准备播放
//        [_audioPlayer prepareToPlay];
//    }
//
//    return _audioPlayer;
//
//}


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

- (void)changSliderValue
{
//    self.slider.value = self.audioPlayer.currentTime;
//    self.starttimelabel.text = [self fomatTimeToString:self.audioPlayer.currentTime];
}





/*
 - (void)playaudioaction
 {
 self.playbutton.selected =!self.playbutton.selected;
 if (self.playbutton.selected) {
 
 [self.audioPlayer play];
 
 _timer.fireDate = [NSDate distantPast];
 }else{
 
 [self.audioPlayer pause];
 
 _timer.fireDate = [NSDate distantFuture];
 }
 
 }
 
 - (void)lastaudioplayaction
 {
 _audioIndex--;
 if (_audioIndex <0) {
 _audioIndex = (int)_audioArray.count -1;
 }
 _audioInfo = _audioArray[_audioIndex];
 
 [self prepareToPlayMusic];
 
 self.playbutton.selected = NO;
 
 [self.playbutton sendActionsForControlEvents:UIControlEventTouchUpInside];
 
 }
 
 - (void)nextaudioplayaction
 {
 _audioIndex++;
 if (_audioIndex > _audioArray.count - 1) {
 
 _audioIndex = 0;
 }
 
 _audioInfo = _audioArray[_audioIndex];
 [self prepareToPlayMusic];
 
 self.playbutton.selected = NO;
 [self.playbutton sendActionsForControlEvents:UIControlEventTouchUpInside];
 }
 */



- (void)sliderAction
{
    
//    self.audioPlayer.currentTime = self.slider.value;
    
}







@end
