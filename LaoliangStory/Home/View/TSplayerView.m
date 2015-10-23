//
//  TSplayerView.m
//  LaoliangStory
//
//  Created by zjq on 15-10-21.
//  Copyright (c) 2015年 tens. All rights reserved.
//


#import "TSplayerView.h"
#import "PlayerViewController.h"
#import "HomeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TSplayerView ()
{
    
        NSMutableArray *_audioArray; // 所有音乐数据
        NSDictionary *_audioInfo;    // 每首歌的数据
        NSTimer *_timer;
       int _audioIndex;

}

@property (weak, nonatomic) IBOutlet UIButton *returnbutton;

@property (weak, nonatomic) IBOutlet UILabel *sortnamelabel;

@property (weak, nonatomic) IBOutlet UIImageView *sortimageview;

@property (weak, nonatomic) IBOutlet UILabel *audionamelabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *starttimelabel;

@property (weak, nonatomic) IBOutlet UILabel *endtimelabel;

@property (weak, nonatomic) IBOutlet UIButton *playbutton;

@property (weak, nonatomic) IBOutlet UIButton *lastbutton;

@property (weak, nonatomic) IBOutlet UIButton *nextbutton;

@property (weak, nonatomic) IBOutlet UIButton *retreatbutton;
@property (weak, nonatomic) IBOutlet UIButton *speedbutton;

@property (weak, nonatomic) IBOutlet UIView *bottomview;

@property(nonatomic, strong)AVAudioPlayer *audioPlayer;


@end

@implementation TSplayerView

- (void)drawRect:(CGRect)rect {
    
//    [_slider setMinimumTrackImage:[UIImage imageNamed:@"volleft"] forState:UIControlStateNormal];
//    [_slider setMaximumTrackImage:[UIImage imageNamed:@"volright"] forState:UIControlStateNormal];
    [_slider setThumbImage:[UIImage imageNamed:@"tabbar_progress_handle"] forState:UIControlStateNormal];
    
    [_slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    
    
    [_playbutton addTarget:self action:@selector(playaudioaction) forControlEvents:UIControlEventTouchUpInside];
    
    [_lastbutton addTarget:self action:@selector(lastaudioplayaction) forControlEvents:UIControlEventTouchUpInside];
    
    [_nextbutton addTarget:self action:@selector(nextaudioplayaction) forControlEvents:UIControlEventTouchUpInside];
}


- (void)loadMusicData
{
    // 1、获取plist文件所在的文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MusicInfo" ofType:@"plist"];
    
    // 2、读取plist文件的数据，保存为对应的数据类型
    _audioArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    
    _audioInfo = _audioArray[0];
    
    [self prepareToPlayMusic];
    
    
    NSLog(@"%@",_audioInfo);
}



- (AVAudioPlayer *)audioPlayer
{
    if (_audioPlayer == nil) {
        
        NSString *musicPath = [[NSBundle mainBundle] pathForResource:_audioInfo[@"name"] ofType:@"mp3"];
        
        NSURL *musicURL = [NSURL fileURLWithPath:musicPath];
        
        NSError *error;
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:&error];
        
        _audioPlayer.delegate = self;
        
        // 准备播放
        [_audioPlayer prepareToPlay];
    }
    
    return _audioPlayer;
    
}






#pragma mark -播放前设置
- (void)prepareToPlayMusic
{
    self.audioPlayer = nil;
    
    // 每一首音乐都要新建一个播放器
    [self audioPlayer];
    
    // 设置slider最大值
    self.slider.maximumValue = self.audioPlayer.duration;
    self.slider.value = 0;
    
    // 将音乐的总秒数格式化显示
    self.endtimelabel.text = [self fomatTimeToString:self.audioPlayer.duration];
    self.starttimelabel.text = @"00:00";
    self.audionamelabel.text = _audioInfo[@"name"];
    self.sortimageview.image = [UIImage imageNamed:_audioInfo[@"imageName"]];
    
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changSliderValue) userInfo:nil repeats:YES];
    
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
    self.slider.value = self.audioPlayer.currentTime;
    self.starttimelabel.text = [self fomatTimeToString:self.audioPlayer.currentTime];
}


#pragma mark - <AVAudioPlayerDelegate> 音乐播放完后调用的协议方法
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.nextbutton sendActionsForControlEvents:UIControlEventTouchUpInside];
}


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




- (void)sliderAction
{
    
    self.audioPlayer.currentTime = self.slider.value;
    
}


- (IBAction)returnbuttonaction:(UIButton *)sender {
    
    
    
    
}















@end
