//
//  PlayerViewController.h
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ProgramsMedol.h"


@interface PlayerViewController : UIViewController 

@property (nonatomic,strong)AVAudioPlayer *audioPlayer;
@property (nonatomic,copy)NSString *mp3Url;
@property (nonatomic,strong)ProgramsMedol *medol;


@end
