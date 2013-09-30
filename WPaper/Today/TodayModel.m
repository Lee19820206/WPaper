//
//  TodayModel.m
//  WPaper
//
//  Created by Lee on 13-8-31.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "TodayModel.h"

@implementation TodayModel

@synthesize date = _date, month, coverImgUrl, kids, coverId, kidIds;
@synthesize thumbs = _thumbs;
@synthesize beginPos = _beginPos;

- (id)initWithDate:(NSString *)theDate andThumbs:(NSMutableArray *)thumbArray
{
    if (self = [super init]) {
        _date = theDate;
        _thumbs = thumbArray;
    }
    return self;
}
@end
