//
//  StorydetailCell.h
//  LaoliangStory
//
//  Created by zjq on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemMedol.h"
#import "ProgramsMedol.h"
#import "TSplayerView.h"

@protocol PlayerAudioDelgate <NSObject>

-(void)onClickToPlayer:(NSString *)audioUrl withTag:(long)tag withButton:(UIButton *)button;

@end

@interface TStorydetailCell : UITableViewCell

@property (nonatomic,strong)ItemMedol * medol;
@property (nonatomic,strong)ProgramsMedol *programsMedol;
@property (nonatomic,strong)TSplayerView *player;
@property (nonatomic,strong)id <PlayerAudioDelgate> delgate;
@property (nonatomic,assign)long celltag;


@end
