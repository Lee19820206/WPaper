//
//  ThumbModel.h
//  WPaper
//
//  Created by Lee on 13-9-29.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThumbModel : NSObject
@property (nonatomic) NSString *msgId;
@property (nonatomic) NSString *imgUrl;
@property (nonatomic) NSUInteger pos;

- (id)initWithDictionary:(NSMutableDictionary *)dic;

@end
