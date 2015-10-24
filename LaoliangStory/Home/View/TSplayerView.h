//
//  TSplayerView.h
//  LaoliangStory
//
//  Created by zjq on 15-10-21.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger, PlayerSelctedButtonType){
    
    ReturnButton,
    PlayerButton,
    LastButton,
    NextButton,
    BackTimeButton,
    ForwardTimeButton
};

/**
 *  播放页面按钮的代理方法
 */
@protocol PlayerDelagte <NSObject>
/* 点击返回按钮时调用的方法 */
-(void)OnClickToReturn;
/* 点击播放按钮时调用的方法 */
-(void)OnClickPlayerButton:(UIButton *)playButton;
/* 点击上一曲按钮调用的方法 */
-(void)OnClickLastButton;
/* 点击下一曲按钮调用的方法 */
-(void)OnClickNextButton;
/* 点击后退15秒按钮 */
-(void)OnClickBackTimeButton;
/* 点击前进15秒按钮 */
-(void)OnClickForwardTimeButton;

@end


@interface TSplayerView : UIView

@property (weak, nonatomic) IBOutlet UILabel *sortnamelabel;

@property (weak, nonatomic) IBOutlet UIImageView *sortimageview;

@property (weak, nonatomic) IBOutlet UILabel *audionamelabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *starttimelabel;

@property (weak, nonatomic) IBOutlet UILabel *endtimelabel;

@property (weak, nonatomic) IBOutlet UIView *bottomview;

@property (nonatomic,strong) id <PlayerDelagte> delagte;

@end
