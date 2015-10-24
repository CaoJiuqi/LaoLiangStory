//
//  PlayerViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "PlayerViewController.h"
#import "TSplayerView.h"
@interface PlayerViewController ()

@end


@implementation PlayerViewController 

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
 
        
        TSplayerView *playerview= [[[NSBundle mainBundle] loadNibNamed:@"TSplayerView" owner:self options:nil]lastObject];
            playerview.frame = CGRectMake(0, 0, TSWedth, TSHeight);

      [self.view addSubview:playerview];
        
    }
    return self;
}



#pragma mark--<PlayerAudioDelgate>
-(void)onClickToPlayer:(NSString *)audioUrl
{
    NSLog(@"点击了播放按钮:url :%@",audioUrl);

}

/*
#pragma mark - 创建音乐播放器
- (AVAudioPlayer *)audioPlayer
{
    if (_audioPlayer == nil) {
        
        // 1、获取音乐的路径
        NSString *musicPath = [[NSBundle mainBundle] pathForResource:_musicInfo[@"name"] ofType:@"mp3"];
        
        // 2、将路径转为URL
        NSURL *musicURL = [NSURL fileURLWithPath:musicPath];
        
        // 3、创建播放器并且将URL交给播放器
        NSError *error;
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:&error];
        
        
        // 设置audioPlayer的代理对象
//        _audioPlayer.delegate = self;
        
        // 准备播放
        [_audioPlayer prepareToPlay];
    }
    
    return _audioPlayer;
    
}

#pragma mark - 播放前的设置
- (void)prepareToPlayMusic
{
    self.audioPlayer = nil;
    
    // 每一首音乐都要新建一个播放器
    [self audioPlayer];
    
    // 设置slider最大值
    self.musicSlider.maximumValue = self.audioPlayer.duration;
    self.musicSlider.value = 0;
    
    // 将音乐的总秒数格式化显示
    self.endTimeLabel.text = [self fomatTimeToString:self.audioPlayer.duration];
    self.startTimeLabel.text = @"00:00";
    self.musicNameLabel.text = _musicInfo[@"name"];
    self.musicImageView.image = [UIImage imageNamed:_musicInfo[@"imageName"]];
    self.singerNameLabel.text = _musicInfo[@"actor"];
    
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changSliderValue) userInfo:nil repeats:YES];
    
}
*/

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
