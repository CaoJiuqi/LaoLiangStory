//
//  StorydetailViewController.h
//  LaoliangStory
//
//  Created by zjq on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemMedol.h"




@interface StorydetailViewController : UIViewController

@property (nonatomic,strong)ItemMedol * medol;
@property (nonatomic,strong)NSString * groupId;
@property (nonatomic,strong)NSArray *programsMedolArray;
@property (nonatomic,strong)NSString *intro;


@end
