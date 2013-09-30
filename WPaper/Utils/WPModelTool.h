//
//  WPModelTool.h
//  WPaper
//
//  Created by Lee on 13-9-29.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSUInteger imgNum = 0;
static NSMutableArray *imgs;
@interface WPModelTool : NSObject

+ (NSMutableArray *)createTodayModelArray:(NSArray *)dataArray;
+ (NSMutableArray *)createThumbModelArray:(NSArray *)dataArray;
+ (NSUInteger)numOfimgs;
+ (NSMutableArray *)imgArray;
@end
