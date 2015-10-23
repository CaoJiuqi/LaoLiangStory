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

@end


@implementation PlayerViewController 

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
 
        
        TSplayerView *playerview= [[[NSBundle mainBundle] loadNibNamed:@"TSplayerView" owner:self options:nil]lastObject];
            playerview.frame = CGRectMake(0, 0, TSWedth, TSHeight);

      [self.view addSubview:playerview];
        
    }
    return self;
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
