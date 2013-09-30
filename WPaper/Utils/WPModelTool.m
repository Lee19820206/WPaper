//
//  WPModelTool.m
//  WPaper
//
//  Created by Lee on 13-9-29.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "WPModelTool.h"
#import "TodayModel.h"
#import "ThumbModel.h"

@implementation WPModelTool

+ (NSMutableArray *)createTodayModelArray:(NSArray *) dataArray
{
    imgs = [[NSMutableArray alloc] init];
    TodayModel *todayModel;
    NSUInteger pos = 0;
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *dic in dataArray) {
        NSString *datestr = [dic objectForKey:@"date"];
        NSArray *thumbDatas = [dic objectForKey:@"imgs"];
        imgNum += [thumbDatas count];
        NSMutableArray *thumbs = [WPModelTool createThumbModelArray:thumbDatas];
        [imgs addObjectsFromArray:thumbs];
        todayModel = [[TodayModel alloc] initWithDate:datestr andThumbs:thumbs];
        todayModel.beginPos = pos;
        pos += [thumbDatas count];
        [retArray addObject:todayModel];
    }
    return  retArray;
}

+ (NSUInteger)numOfimgs
{
    return imgNum;
}

+ (NSMutableArray *)imgArray
{
    return imgs;
}

+ (NSMutableArray *)createThumbModelArray:(NSArray *)dataArray
{
    ThumbModel *thumbModel;
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *dic in dataArray) {
        thumbModel = [[ThumbModel alloc] initWithDictionary:dic];
        [retArray addObject:thumbModel];
    }
    return retArray;
}

@end
