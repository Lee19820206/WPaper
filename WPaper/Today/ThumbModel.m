//
//  ThumbModel.m
//  WPaper
//
//  Created by Lee on 13-9-29.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "ThumbModel.h"

@implementation ThumbModel
@synthesize msgId = _msgId;
@synthesize imgUrl = _imgUrl;
@synthesize pos = _pos;

- (id)initWithDictionary:(NSMutableDictionary *)dic
{
    if (self = [super init]) {
        self.imgUrl = [dic objectForKey:@"img"];
        NSLog(@"iiiimg %@", _imgUrl);
        self.msgId = [dic objectForKey:@"id"];
    }
    return self;
}

@end
