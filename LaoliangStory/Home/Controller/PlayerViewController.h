//
//  PlayerViewController.h
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgramsMedol.h"
#import <MediaPlayer/MediaPlayer.h>



@interface PlayerViewController : UIViewController 

@property (nonatomic,strong)MPMoviePlayerController *player;
@property (nonatomic,copy)NSString *mp3Url;
@property (nonatomic,strong)ProgramsMedol *medol;

@property (nonatomic,assign)Boolean isPlaying;
@property (nonatomic,strong)UIButton *onClickButton;



@end
