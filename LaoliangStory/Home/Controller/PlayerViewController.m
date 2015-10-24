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

-(void)createPlayerWith:(NSString *)url
{
    self.player = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:url]];
    [self.player.view setFrame: self.view.bounds];
    self.player.controlStyle = MPMovieControlStyleFullscreen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if (self.block == nil) {
//        self.player = /
        self.block(self.player);

    }
    
}



#pragma mark--<PlayerAudioDelgate>
-(void)OnClickToPlayer:(NSString *)audioUrl
{
    NSLog(@"点击了播放按钮:url :%@",audioUrl);

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
        
//        [self.audioPlayer play];
        
//        _timer.fireDate = [NSDate distantPast];
    }else{
        
//        [self.audioPlayer pause];
        
//        _timer.fireDate = [NSDate distantFuture];
    }


}
-(void)OnClickLastButton
{

}
-(void)OnClickNextButton
{

}
-(void)OnClickBackTimeButton
{

}
-(void)OnClickForwardTimeButton
{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
