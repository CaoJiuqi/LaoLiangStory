//
//  TSLoadController.m
//  LaoliangStory
//
//  Created by tens on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSLoadController.h"
#import "PlayerViewController.h"

@interface TSLoadController ()

@end

@implementation TSLoadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)pushplayerbuttonaction:(UIButton *)sender {
    
    PlayerViewController *playerVC = [[PlayerViewController alloc]init];
    playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:playerVC animated:YES completion:nil];
    
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
