//
//  ItemView.h
//  LaoliangStory
//
//  Created by tens on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemMedol;

@protocol OnclickItemViewDelegate <NSObject>

-(void)OnClickViewkwithItem:(int)markTag;


@end

@interface ItemView : UIView

@property (nonatomic,strong)ItemMedol *medol;
@property (nonatomic,assign)int markTag;

@property (nonatomic,weak)id<OnclickItemViewDelegate> delegate;
@end
