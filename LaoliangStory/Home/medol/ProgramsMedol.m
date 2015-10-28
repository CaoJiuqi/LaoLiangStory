//
//  ProgramsMedol.m
//  LaoliangStory
//
//  Created by tens on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "ProgramsMedol.h"

@implementation ProgramsMedol

-(void)setDuration:(NSString *)duration
{

    int m = [duration intValue] / 60;
    int s = [duration intValue] % 60;
    
    _changedDuration = [NSString stringWithFormat:@"%02d:%02d",m,s];
    
//    NSLog(@"%@",_changedDuration);
    
}



@end
