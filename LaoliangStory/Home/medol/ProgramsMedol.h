//
//  ProgramsMedol.h
//  LaoliangStory
//
//  Created by tens on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgramsMedol : NSObject

/*0、节目的ID*/
@property (nonatomic,copy)NSString *programId;
/*1、节目的ID*/
@property (nonatomic,copy)NSString *radioId;
/*2、节目名称*/
@property (nonatomic,copy)NSString *name;
/*3、节目的时间*/
@property (nonatomic,copy)NSString *duration;
/*4、节目的创建时间*/
@property (nonatomic,strong)NSNumber *createTime;
/*5、节目的跟踪，可以获取到MP3的播放文件*/
@property (nonatomic,copy)NSString *track;
@property (nonatomic,copy)NSString *mp3Url;
/*7、分享Url地址*/
@property (nonatomic,copy)NSString *shareUrl;
/*8、节目的下载量*/
@property (nonatomic,strong)NSNumber *downloadCount;
/*9、节目的分享数量*/
@property (nonatomic,strong)NSNumber *sharedCount;
/*11、重复播放的数量*/
@property (nonatomic,strong)NSNumber *replayCount;




@end
