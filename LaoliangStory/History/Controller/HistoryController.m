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

{
    NSTimer *timer;
    
}
@property (weak, nonatomic) IBOutlet UIButton *playerbutton;


@end

@implementation HistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerdataaction) userInfo:nil repeats:YES];
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


- (void)timerdataaction
{
    NSArray *values = @[@"topbar_musicplayer_1",
                        @"topbar_musicplayer_2",
                        @"topbar_musicplayer_3",
                        @"topbar_musicplayer_4",
                        @"topbar_musicplayer_5"];
    NSString *str = values[arc4random()%5];
    [self.playerbutton setImage:[UIImage imageNamed:str] forState:UIControlStateNormal];

}




#pragma mark -<UITableViewDataSource,UITableViewDelegate>
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
