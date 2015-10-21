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



#pragma mark-- <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1;
    }
    
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ptah = @"StorydetailCell";
    
    TStorydetailCell *cell = nil;
    if(indexPath.row == 0 && indexPath.section == 0)
    {
        //  StorydetailHeaderCell
       cell = [tableView dequeueReusableCellWithIdentifier:@"StorydetailHeaderCell" forIndexPath:indexPath];
        cell.medol = _medol;
        return cell;
    }
    
    
    cell = [tableView dequeueReusableCellWithIdentifier:ptah forIndexPath:indexPath];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        return 265;
    
    }
    return 120;
        
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
