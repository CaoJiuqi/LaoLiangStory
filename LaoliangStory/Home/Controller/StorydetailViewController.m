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

@property(strong,nonatomic)NSMutableArray *storydetailArray;

@property (nonatomic,copy)NSString *playerUrl;



@end

@implementation StorydetailViewController

-(NSMutableArray *)storydetailArray
{
    
    if (_storydetailArray == nil) {
        _storydetailArray = [[NSMutableArray array]init];
    }
    
    return _storydetailArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _medol.title;

}

-(void)createMPMoviePlayerCol:(NSString *)url
{
    self.streamplayer = nil;
    if( self.streamplayer == nil)
    {
        self.streamplayer = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:url]];
        [self.streamplayer.view setFrame: self.view.bounds];
        self.streamplayer.controlStyle = MPMovieControlStyleFullscreen;
    
    }
  
}



#pragma mark--<PlayerAudioDelgate>
-(void)onClickToPlayer:(NSString *)audioUrl withTag:(long)tag withButton:(UIButton *)button
{
    button.selected = !button.selected;
    
    if (![self.playerUrl isEqualToString:audioUrl]) {
        [self createMPMoviePlayerCol:audioUrl];
    }
    if (button.selected) {
        [self.streamplayer play];
    }else
    {
        [self.streamplayer pause];
    }
    
    self.playerUrl = audioUrl;

    PlayerViewController *playerVC = [[PlayerViewController alloc]init];
    playerVC.block = ^(MPMoviePlayerController *player){
        self.streamplayer = player;
        
    };
    playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:playerVC animated:YES completion:nil];
    


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
        //  StorydetailHeaderCell
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







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
