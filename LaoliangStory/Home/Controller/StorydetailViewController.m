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


@property (strong,nonatomic)UIButton *currentButton;

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
    
    // 添加暂停监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseAction) name:@"pauseMP3" object:nil];
    // 添加播放监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playAction) name:@"playMP3" object:nil];

    // 避免第一次点击就是点击第一个出现的状况
    self.playerVC.currentIndex = -1;


}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


-(void)pauseAction
{
    [self.timer setFireDate:[NSDate distantFuture]];
    self.currentButton.selected = NO;
}

-(void)playAction
{
    [self.timer setFireDate:[NSDate distantPast]];
    self.currentButton.selected = YES;
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
-(void)onClickToPlayer:(NSString *)audioUrl withCellTag:(NSInteger)tag selectButton:(UIButton *)selectButton
{
    selectButton.selected = !selectButton.selected;

    if (self.currentButton != selectButton ) {
        self.currentButton.selected = NO;
        self.playerUrl = nil;
        self.currentButton = selectButton;
        
        self.playerVC.headUrl = _medol.largerImageUrl;
        self.playerVC.titleName = _medol.title;
        
    }
    
        // 将该组的数据传递过去
        self.playerVC.index = (int)tag;
        self.playerVC.programsArray = self.programsMedolArray;

    
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
