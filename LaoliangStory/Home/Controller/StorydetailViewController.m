//
//  StorydetailViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "StorydetailViewController.h"
#import "TStorydetailCell.h"
#import <sqlite3.h>

#define kDataBaseName @"LizhiFM.sqlite"

@interface StorydetailViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    sqlite3 *_dataBase;

}

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
    [self loadMP3Data];

}


-(void)loadMP3Data
{
    // 数据库路径
    NSArray *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dataBasePath = [[documentsDirectory firstObject] stringByAppendingPathComponent:kDataBaseName];
    
    NSLog(@"path == %@", dataBasePath);
    
    // 1、打开数据库
    int createResout = sqlite3_open([dataBasePath UTF8String], &_dataBase);
    if (createResout != SQLITE_OK) {
        NSLog(@"创建数据库失败");
        return;
    }
    else {
        NSLog(@"创建数据库成功");
    }
    
    NSString *selectSQL = @"SELECT track FROM programs";
    char **selectResult = nil;
    int row,column;
    char *error = nil;
    int selectState = sqlite3_get_table(_dataBase, [selectSQL UTF8String],&selectResult, &row, &column, &error);
    
    if (selectState != SQLITE_OK) {
        NSLog(@"查找失败");
        return;
    }
    else {
        NSLog(@"查找成功");
//        int index = column;
        
        NSString *str = [[NSString alloc]initWithUTF8String:selectResult[1]];
        

        
//        for (int i=0; i<row; i++) {
//            for (int j=0; j<column; j++) {
//                
//                NSLog(@"--->%s  ======>%s", selectResult[j], selectResult[index++]);
//
//            }
//        }
    }

    
    
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
