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
{
    NSTimer* timer;
}


@property (weak, nonatomic) IBOutlet UITableView *storydetailtableview;

@property (weak, nonatomic) IBOutlet UIButton *playerbutton;

@property(strong,nonatomic)NSMutableArray *storydetailArray;


@property (strong,nonatomic)NSMutableArray *storydetailArray;
@property (strong,nonatomic) NSString *playerUrl;
@property (strong,nonatomic) PlayerViewController *playerVC;


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
        _playerVC = [[PlayerViewController alloc]init];
        _playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return _playerVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _medol.title;
   

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
    self.playerVC.isCurrentUrl = [self.playerUrl isEqualToString:audioUrl];
    self.playerVC.mp3Url = audioUrl;
    self.playerVC.programsArray = self.programsMedolArray;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerdataaction) userInfo:nil repeats:YES];
    


}


    self.playerVC.index = tag;
    NSLog(@"tag:%ld",tag);
    NSLog(@"self.playerVC.index----->%d",(int)self.playerVC.index);
    if (self.playerVC.isCurrentUrl == 1) {
        self.playerUrl = nil;
    }else
    {
        self.playerUrl = audioUrl;
    }
}

>>>>>>> 34a409cc8ce0999e4bb2c7a86d681c7cbd747cf4
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
