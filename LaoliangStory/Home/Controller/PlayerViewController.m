//
//  PlayerViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "PlayerViewController.h"
#import "TSplayerView.h"
@interface PlayerViewController () <PlayerDelagte>

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
        playerview.delagte = self;
      [self.view addSubview:playerview];
        
    }
    return self;
}



#pragma mark--<PlayerAudioDelgate>
-(void)onClickToPlayer:(NSString *)audioUrl
{
    NSLog(@"点击了播放按钮:url :%@",audioUrl);

}

#pragma mark--<PlayerDelagte>
-(void)onClickToReturn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

<<<<<<< HEAD
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













=======
>>>>>>> e73a22410af40a66d58d14d3036ad1061040cc7e


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
