//
//  TSplayerView.m
//  LaoliangStory
//
//  Created by zjq on 15-10-21.
//  Copyright (c) 2015年 tens. All rights reserved.
//


#import "TSplayerView.h"
#import "PlayerViewController.h"
#import "HomeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TSplayerView ()
{
        NSMutableArray *_audioArray; // 所有音乐数据
        NSDictionary *_audioInfo;    // 每首歌的数据
        NSTimer *_timer;
       int _audioIndex;
}



@end

@implementation TSplayerView


- (void)drawRect:(CGRect)rect {
    
//    [_slider setMinimumTrackImage:[UIImage imageNamed:@"volleft"] forState:UIControlStateNormal];
//    [_slider setMaximumTrackImage:[UIImage imageNamed:@"volright"] forState:UIControlStateNormal];
    [_slider setThumbImage:[UIImage imageNamed:@"tabbar_progress_handle"] forState:UIControlStateNormal];
    
//    [_slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    
    
}

#pragma mark--Action

- (IBAction)ButtonActopn:(UIButton *)sender
{
    switch (sender.tag) {
        case ReturnButton :
        {
            if ([self.delagte respondsToSelector:@selector(OnClickToReturn)]) {
                [self.delagte OnClickToReturn];
            }
        }
            break;
        case PlayerButton:
        {
            if ([self.delagte respondsToSelector:@selector(OnClickPlayerButton:)]) {
                [self.delagte OnClickPlayerButton:sender];
            }
        }
            break;
        case LastButton:
        {
            if ([self.delagte respondsToSelector:@selector(OnClickLastButton)]) {
                [self.delagte OnClickLastButton];
            }
        }
            break;
        case NextButton:
        {
            if ([self.delagte respondsToSelector:@selector(OnClickNextButton)]) {
                [self.delagte OnClickNextButton];
            }
        }
            break;
        case BackTimeButton:
        {
            if ([self.delagte respondsToSelector:@selector(OnClickBackTimeButton)]) {
                [self.delagte OnClickBackTimeButton];
            }
        }
            break;
        case ForwardTimeButton:
        {
            if ([self.delagte respondsToSelector:@selector(OnClickForwardTimeButton)]) {
                [self.delagte OnClickForwardTimeButton];
            }
        }
            break;
            
    }
    
    
}


@end
