//
//  HomeController.m
//  LaoliangStory
//
//  Created by tens on 15-10-19.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "HomeViewController.h"
#import "StorydetailViewController.h"
#import "ItemView.h"
#import "ItemMedol.h"
#import "PlayerViewController.h"
#import "LoadSqlistData.h"
#import <sqlite3.h>
#import "GroupMedol.h"
#import "ProgramsMedol.h"



#define imageWidth  (TSWedth - 50)/2
#define imageHeight (imageWidth + 30)
#define kDataBaseName @"LizhiFM.sqlite"


@interface HomeViewController () <OnclickItemViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;


@property (nonatomic,strong)NSMutableArray *infoArrays;

@property (strong,nonatomic)NSMutableArray *groupMedols;

@property (strong,nonatomic)NSMutableArray *programsMedols;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMP3SqliteData];
    
    
    [self loadData];
    
    [self setScrollView];
    [self addViewToScrollView];
    
    

}

#pragma mark-- 设置ScrollView
-(void)setScrollView{
    self.myScrollView.contentSize = CGSizeMake(TSWedth, (imageHeight + 10) * 4);
}

-(void)addViewToScrollView
{

    ItemView *itemView = nil;
    for (int i = 0; i < 7 ; i++) {
        
        itemView = [[[NSBundle mainBundle]loadNibNamed:@"ItemView"owner:self options:nil]lastObject];
        [self.myScrollView addSubview:itemView];
        CGFloat itemViewX = 15;
        CGFloat itemViewY = 15 + (i / 2) * (imageWidth +50);
        if (i % 2 != 0) {
            itemViewX = 30 +imageWidth ;
        }
        itemView.frame = CGRectMake(itemViewX, itemViewY, imageWidth, imageHeight);

        itemView.medol = self.infoArrays[i];
        itemView.markTag = i;
        itemView.delegate = self;
    }
}

#pragma mark-- 加载数据
-(void)loadData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];

    NSArray *medolArrays = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dictionary in medolArrays) {
        ItemMedol *medol = [[ItemMedol alloc]initWithDictary:dictionary];
        [self.infoArrays addObject:medol];
    }

}

-(void)loadMP3SqliteData
{
    sqlite3 *mysqlite = [LoadSqlistData openSqlite3dataBase:kDataBaseName];
    
    NSString *selectSQL1 = @"SELECT * FROM groups";
    self.groupMedols = [LoadSqlistData loadMP3GroupData:selectSQL1 withDataBase:mysqlite];
    NSString *selectSQL2 = @"SELECT * FROM programs";
    self.programsMedols = [LoadSqlistData loadMP3ProgramsData:selectSQL2 withDataBase:mysqlite];
}


-(void)OnClickViewkwithItem:(int)markTag
{
    StorydetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"StorydetailViewController"];

    detail.medol = self.infoArrays[markTag];
    NSLog(@"-->%@",detail.medol.title);
    
    NSMutableArray *programsItemArray = [[NSMutableArray alloc]init];
    
    for (GroupMedol *groupMedol in self.groupMedols) {
    
        if ( ![groupMedol.title isEqualToString:detail.medol.title] ) {
            NSLog(@"title 不相同");
        }else
        {
            NSLog(@"title 相同");
            
            detail.groupId = groupMedol.groupId;
            
            for ( ProgramsMedol *programMedol in self.programsMedols) {
                if ([programMedol.radioId isEqualToString:groupMedol.groupId]) {
                    [programsItemArray addObject:programMedol];
                }
            }

            detail.programsMedolArray = programsItemArray;

            break ;

        }
        
        
    }
    
    
    [self.navigationController pushViewController:detail animated:YES];

}




- (IBAction)pushplayerbuttonaction:(UIButton *)sender {
    
    
         PlayerViewController *playerVC = [[PlayerViewController alloc]init];
        playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:playerVC animated:YES completion:nil];
    
    
    
}




-(NSMutableArray *)infoArrays
{
    if (_infoArrays == nil) {
        _infoArrays = [[NSMutableArray alloc]init];
    }
    return _infoArrays;
}

-(NSMutableArray *)groupMedols
{
    if (_groupMedols == nil) {
        _groupMedols = [[NSMutableArray alloc]init];
    }
    return _groupMedols;
}

-(NSMutableArray *)programsMedols
{
    if (_programsMedols == nil) {
        _programsMedols = [[NSMutableArray alloc]init];
    }
    return _programsMedols;
}
@end
