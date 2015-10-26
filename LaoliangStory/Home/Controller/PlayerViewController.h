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
/* 判断是否是当前播放的音频 */
@property (nonatomic,assign)Boolean isCurrentUrl;
/* 获取当前组的数据 */
@property (nonatomic,assign)NSArray *programsArray;
/* 标示是当前组中数据的下表 */
@property (nonatomic,assign)NSInteger *index;

@property (nonatomic,copy)NSString *headUrl;;


@end
