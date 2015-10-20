//
//  StorydetailViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "StorydetailViewController.h"
#import "TStorydetailCell.h"

@interface StorydetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *storydetailtableview;

@property (weak, nonatomic) IBOutlet UIView *headview;

@property(strong,nonatomic)NSMutableArray *storydetailArray;


@end

@implementation StorydetailViewController

-(NSMutableArray *)storydetailArray
{
    
    if (_storydetailArray == nil) {
        _storydetailArray = [[NSMutableArray array]init];
    }
    
    return _storydetailArray;
}




- (void)viewDidLoad {
    [super viewDidLoad];

  self.title = @"老梁故事汇";


}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1;
    }
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ptah = @"StorydetailCell";
    
    TStorydetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ptah forIndexPath:indexPath];
    
    
    
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
