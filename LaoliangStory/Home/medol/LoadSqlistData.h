//
//  LoadSqlistData.h
//  LaoliangStory
//
//  Created by tens on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <Foundation/Foundation.h>
@class sqlite3;


@interface LoadSqlistData : NSObject

+(sqlite3 *)openSqlite3dataBase:(NSString *)kDataBaseName;

+(NSMutableArray *)loadMP3GroupData:(NSString *)selectSQL withDataBase:(sqlite3 *)_dataBase;


@end
