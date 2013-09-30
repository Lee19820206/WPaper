//
//  TodayModel.h
//  WPaper
//
//  Created by Lee on 13-8-31.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayModel : NSObject

@property (nonatomic) NSString *date;
@property (nonatomic) NSString *month;
@property (nonatomic) NSString *coverImgUrl;
@property (nonatomic) NSMutableArray *kids;

@property (nonatomic) NSString *coverId;
@property (nonatomic) NSMutableArray *kidIds;
@property (nonatomic) NSMutableArray *thumbs;
@property (nonatomic) NSUInteger beginPos;
- (id)initWithDate:(NSString *)theDate andThumbs:(NSMutableArray *)thumbArray;
@end
