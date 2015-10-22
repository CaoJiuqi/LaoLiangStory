//
//  TSNavgationController.m
//  LaoliangStory
//
//  Created by tens on 15-10-19.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSNavgationController.h"

@interface TSNavgationController ()

@end

@implementation TSNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBar];

}


-(void)setNavigationBar
{
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_topbar"] forBarMetrics:UIBarMetricsDefault];
    // 设置字体的颜色和大小
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
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
