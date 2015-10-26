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

#import "UIImageView+WebCache.h"


@interface TSplayerView ()
@end

@implementation TSplayerView


- (void)drawRect:(CGRect)rect {
    
//    [_slider setMinimumTrackImage:[UIImage imageNamed:@"volleft"] forState:UIControlStateNormal];
//    [_slider setMaximumTrackImage:[UIImage imageNamed:@"volright"] forState:UIControlStateNormal];
    [_slider setThumbImage:[UIImage imageNamed:@"tabbar_progress_handle"] forState:UIControlStateNormal];
    
//    [_slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    
    
}



-(void)setHeadURL:(NSString *)headURL
{
    _headURL = headURL;
    [self.sortimageview sd_setImageWithURL:[NSURL URLWithString:_headURL]];
}

-(void)setTitleName:(NSString *)titleName
{
    _titleName  = titleName;
    self.sortnamelabel.text = _titleName;
    
}



-(void)setStoryintro:(NSString *)storyintro
{
    _storyintro = storyintro;
    self.audionamelabel.text = _storyintro;
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
