//
//  PlayerViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "PlayerViewController.h"
#import "TSplayerView.h"

@interface PlayerViewController ()
{
    TSplayerView *playerview ;
}

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}
- (void)awakeFromNib
{
    playerview = [[[NSBundle mainBundle]loadNibNamed:@"TSPlayerView" owner:self options:nil]lastObject];
    [self.view addSubview:playerview];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
