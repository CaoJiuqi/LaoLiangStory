//
//  TSplayerView.h
//  LaoliangStory
//
//  Created by zjq on 15-10-21.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayerDelagte <NSObject>

-(void)onClickToReturn;


@end


@interface TSplayerView : UIView

@property (nonatomic,strong) id <PlayerDelagte> delagte;

@end
