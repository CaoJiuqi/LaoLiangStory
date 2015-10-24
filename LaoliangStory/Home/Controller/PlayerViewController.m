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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
