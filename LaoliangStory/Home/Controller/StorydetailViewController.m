//
//  StorydetailViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "StorydetailViewController.h"
#import "TStorydetailCell.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>



@interface StorydetailViewController ()<UITableViewDataSource,UITableViewDelegate,PlayerAudioDelgate>

@property (weak, nonatomic) IBOutlet UITableView *storydetailtableview;

@property (weak, nonatomic) IBOutlet UIButton *playerbutton;

@property(strong,nonatomic)NSMutableArray *storydetailArray;

/* 用于记录 当前播放的音频 */

@property (strong,nonatomic) NSString *playerUrl;
@property (strong,nonatomic) PlayerViewController *playerVC;
@property (strong,nonatomic) NSTimer *timer;


@end


@implementation StorydetailViewController

-(NSMutableArray *)storydetailArray
{
    if (_storydetailArray == nil) {
        _storydetailArray = [[NSMutableArray array]init];
    }
    return _storydetailArray;
}

-(PlayerViewController *)playerVC
{
    if (_playerVC == nil) {
        _playerVC = [PlayerViewController defaultPlayerController];
        _playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return _playerVC;
}

-(NSTimer *)timer
{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerdataaction) userInfo:nil repeats:YES];
    }
    return  _timer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _medol.title;
    
    // playMP3
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseAction) name:@"pauseMP3" object:nil];
    // playMP3
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playAction) name:@"playMP3" object:nil];
    

}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


-(void)pauseAction
{
    [self.timer setFireDate:[NSDate distantFuture]];
}

-(void)playAction
{
    [self.timer setFireDate:[NSDate distantPast]];
}



//播放按钮动画
- (void)timerdataaction
{
    NSArray *values = @[@"topbar_musicplayer_1",
                        @"topbar_musicplayer_2",
                        @"topbar_musicplayer_3",
                        @"topbar_musicplayer_4",
                        @"topbar_musicplayer_5"];
    NSString *str = values[arc4random()%5];
    [self.playerbutton setImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
    
}




#pragma mark--<PlayerAudioDelgate>
-(void)onClickToPlayer:(NSString *)audioUrl withTag:(NSInteger)tag
{
    // 判断是不是之前播放的那个音频
    self.playerVC.isCurrentUrl = [self.playerUrl isEqualToString:audioUrl];
    self.playerVC.headUrl = _medol.largerImageUrl;
    self.playerVC.mp3Url = audioUrl;
    self.playerVC.index = &(tag);
    self.playerVC.programsArray = self.programsMedolArray;
    
    if (self.playerVC.isCurrentUrl == 1) {
        
        self.playerUrl = nil;
    }else
    {
        self.playerUrl = audioUrl;
    }


}



//    self.playerVC.index = tag;
//    NSLog(@"tag:%ld",tag);
//    NSLog(@"self.playerVC.index----->%d",(int)self.playerVC.index);
//    if (self.playerVC.isCurrentUrl == 1) {
//        self.playerUrl = nil;
//    }else
//    {
//        self.playerUrl = audioUrl;
//    }
//}

- (IBAction)pushplayerbuttonaction:(UIButton *)sender {
    [self presentViewController:self.playerVC animated:YES completion:nil];
>>>>>>> 2528805ef1f59f496faa05693b04f0d4e9835b0c
}




- (IBAction)pushplayerbuttonaction:(UIButton *)sender {
    [self presentViewController:self.playerVC animated:YES completion:nil];
}

#pragma mark-- <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return [self.programsMedolArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ptah = @"StorydetailCell";
    
    TStorydetailCell *cell = nil;
    if(indexPath.row == 0 && indexPath.section == 0)
    {
       cell = [tableView dequeueReusableCellWithIdentifier:@"StorydetailHeaderCell" forIndexPath:indexPath];
        cell.medol = _medol;
        return cell;
    }
    cell = [tableView dequeueReusableCellWithIdentifier:ptah forIndexPath:indexPath];
    cell.programsMedol = self.programsMedolArray[indexPath.row];
    cell.celltag = indexPath.row;
    NSLog(@"celltag:%d",(int)cell.celltag);
    cell.delgate = self;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        return 265;
    }
    return 120;
        
}

@end
