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

@property (nonatomic,copy)NSString *playerUrl;


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

-(void)createMPMoviePlayerCol:(NSString *)url
{
    self.player = nil;
    if( self.player == nil)
    {
        self.player = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:url]];
        [self.player.view setFrame: self.view.bounds];
        self.player.controlStyle = MPMovieControlStyleFullscreen;
        
    }
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

-(void)setMp3Url:(NSString *)mp3Url
{
    _mp3Url = mp3Url;
    
    if (![self.playerUrl isEqualToString:_mp3Url]) {
        [self createMPMoviePlayerCol:_mp3Url];
    }
    
    
    if ([self.player loadState] == MPMovieLoadStatePlayable) {
        
        [self.player pause];
    }else
    {
        NSLog(@"-----");
        [self.player play];
    }
    
    self.playerUrl = _mp3Url;

    
}

#pragma mark--<PlayerDelagte>
-(void)OnClickToReturn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)OnClickPlayerButton:(UIButton *)playButton
{
    playButton.selected =!playButton.selected;
    
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
