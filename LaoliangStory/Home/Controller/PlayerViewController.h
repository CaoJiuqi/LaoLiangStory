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

typedef void(^PlayerBlock)(MPMoviePlayerController *);


@interface PlayerViewController : UIViewController 

@property (nonatomic,strong)MPMoviePlayerController *player;
@property (nonatomic,copy)NSString *mp3Url;
@property (nonatomic,strong)ProgramsMedol *medol;

@property (copy, nonatomic) PlayerBlock block;


@end
