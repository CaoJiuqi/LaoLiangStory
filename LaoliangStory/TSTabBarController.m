//
//  TSTabBarController.m
//  LaoliangStory
//
//  Created by tens on 15-10-19.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSTabBarController.h"
#import "TSNavgationController.h"

@interface TSTabBarController ()

@end

@implementation TSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor colorWithRed:47/255.0 green:173/255.0 blue:159/255.0 alpha:1];

    
//    NSArray *selectImages = @[@"ic_home_p",
//                              @"ic_download_p",
//                              @"ic_history_p",
//                              @"ic_setup_p"];
//    // 获取标签控制器中的所有子控制器
//    NSArray *viewCols = self.viewControllers;
//    NSMutableArray *navCols = [NSMutableArray arrayWithCapacity:5];
//    
//    for (int i = 0;i < viewCols.count; i++) {
//        
//        UIViewController *viewCol = viewCols[i];
//        
//        // 设置每个试图控制器对应的tabBarItem的选择图片
//        viewCol.tabBarItem.selectedImage = [[UIImage imageNamed:selectImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//        
//        TSNavgationController *navCol = [[TSNavgationController alloc] initWithRootViewController:viewCol];
//        
//        [navCols addObject:navCol];
//    }
    
//    self.viewControllers = navCols;
    
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
