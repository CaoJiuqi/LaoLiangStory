//
//  LoadSqlistData.m
//  LaoliangStory
//
//  Created by tens on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "LoadSqlistData.h"
#import "GroupMedol.h"
#import <sqlite3.h>

@implementation LoadSqlistData

+(sqlite3 *)openSqlite3dataBase:(NSString *)kDataBaseName
{
    
    sqlite3 *_dataBase;

    // 数据库路径
    NSArray *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dataBasePath = [[documentsDirectory firstObject] stringByAppendingPathComponent:kDataBaseName];
    
    NSLog(@"path == %@", dataBasePath);
    
    // 1、打开数据库
    int createResout = sqlite3_open([dataBasePath UTF8String], &_dataBase);
    if (createResout != SQLITE_OK) {
        NSLog(@"创建数据库失败");
        return nil;
    }
    else {
        NSLog(@"创建数据库成功");
        return _dataBase;
    }

}


+(NSMutableArray *)loadMP3GroupData:(NSString *)selectSQL withDataBase:(sqlite3 *)_dataBase
{
    char **selectResult = nil;
    int row,column;
    char *error = nil;
    int selectState = sqlite3_get_table(_dataBase, [selectSQL UTF8String],&selectResult, &row, &column, &error);
    
    if (selectState != SQLITE_OK) {
        NSLog(@"查找失败");
        return nil;
    }
    else {
        // row 表示 返回的是有几条数据， column 表示数据的有多少列
        NSLog(@"查找成功");
        int index = column;
        NSMutableArray *groupMedols = [[NSMutableArray alloc]init];
        for (int i=0; i<row; i++) {
            
            GroupMedol *groupMedol = nil;
            
            for (int j=0; j < column; j++) {
                NSString *str = [[NSString alloc]initWithUTF8String:selectResult[index ++]];
                int temp = index;
                switch (temp % 4) {
                    case 0:{
                        groupMedol = [[GroupMedol alloc]init];
                        groupMedol.groupId = str;
                    }
                        break;
                    case 1:
                        groupMedol.title = str;
                        break;
                    case 2:
                        groupMedol.timestamp = [NSNumber numberWithInteger:[str integerValue]];
                        break;
                    case 3:
                        groupMedol.type =  [NSNumber numberWithInteger:[str integerValue]];
                        break;
                }
                
            }
            
            [groupMedols addObject:groupMedol];
        }
        
        return groupMedols;
        
    }
    
}

        



@end
