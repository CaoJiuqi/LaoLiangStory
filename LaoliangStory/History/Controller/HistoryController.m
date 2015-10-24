//
//  HistoryController.m
//  LaoliangStory
//
//  Created by tens on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "HistoryController.h"
#import "PlayerViewController.h"

@interface HistoryController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//编辑按钮
- (IBAction)editbuttonaction:(UIButton *)sender {
    
}


//跳转播放页面按钮
- (IBAction)pushplayerbuttonaction:(UIButton *)sender {
    
    
    PlayerViewController *playerVC = [[PlayerViewController alloc]init];
    playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:playerVC animated:YES completion:nil];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historycell" forIndexPath:indexPath];
    [tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero ]];

    return cell;
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
