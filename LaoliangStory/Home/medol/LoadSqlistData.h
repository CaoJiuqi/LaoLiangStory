//
//  LoadSqlistData.h
//  LaoliangStory
//
//  Created by tens on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface LoadSqlistData : NSObject

/**
 *  打开或创建数据库
 *
 *  @param kDataBaseName 数据库的名称
 *
 *  @return 数据库
 */
+(sqlite3 *)openSqlite3dataBase:(NSString *)kDataBaseName;
/**
 *  获取数据库中MP3分组的相关数据
 *
 *  @param selectSQL 查询的数据
 *  @param _dataBase 数据库
 *
 *  @return 数据数组，每一条数据为一数据
 */
+(NSMutableArray *)loadMP3GroupData:(NSString *)selectSQL withDataBase:(sqlite3 *)_dataBase;

/**
 *  获取节目数据
 *  @param selectSQL 查询的数据
 *  @param _dataBase 数据库
 *
 *  @return 数据数组，每一条数据为一数据
 */
+(NSMutableArray *)loadMP3ProgramsData:(NSString *)selectSQL withDataBase:(sqlite3 *)_dataBase;


@end
