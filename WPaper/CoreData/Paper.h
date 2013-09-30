//
//  Paper.h
//  WPaper
//
//  Created by Lee on 13-9-4.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Paper : NSManagedObject

@property (nonatomic, retain) NSNumber * ad;
@property (nonatomic, retain) NSString * des;
@property (nonatomic, retain) NSString * detailId;
@property (nonatomic, retain) NSString * imgUrl;
@property (nonatomic, retain) NSString * publishDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSManagedObject *relationship;

@end
