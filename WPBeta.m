//
//  WPBeta.m
//  WPaper
//
//  Created by Lee on 13-9-16.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "WPBeta.h"

@implementation WPBeta
+ (NSString *)randomImg
{
    NSArray *array = [NSArray arrayWithObjects:@"IMG_3492.JPG",@"IMG_3493.JPG",@"IMG_3495.JPG",@"IMG_3497.JPG",@"IMG_3517.jpg",@"IMG_3525.JPG",@"IMG_3529.JPG",@"IMG_3530.JPG",@"IMG_3535.JPG",@"IMG_3554.JPG",@"IMG_3557.jpg",@"IMG_3560.jpg",@"IMG_3563.jpg",@"IMG_3582.jpg",@"IMG_3586.JPG",@"IMG_3486.PNG",@"IMG_3523.PNG",nil];
    NSUInteger i = arc4random() % 17;
    NSString *imgpath = [array objectAtIndex:i];

    return imgpath;
}

+ (NSMutableArray *)randomArray
{
    NSArray *array = [NSArray arrayWithObjects:@"IMG_3492.JPG",@"IMG_3493.JPG",@"IMG_3495.JPG",@"IMG_3497.JPG",@"IMG_3517.jpg",@"IMG_3525.JPG",@"IMG_3529.JPG",@"IMG_3530.JPG",@"IMG_3535.JPG",@"IMG_3554.JPG",@"IMG_3557.jpg",@"IMG_3560.jpg",@"IMG_3563.jpg",@"IMG_3582.jpg",@"IMG_3586.JPG",@"IMG_3486.PNG",@"IMG_3523.PNG",nil];
    NSMutableArray *muArray = [[NSMutableArray alloc] init];
    NSUInteger num = 3 + arc4random() % 17;
    
    for (NSUInteger i = 0; i<num ; i++) {
        [muArray addObject:[array objectAtIndex:(arc4random() % 17)]];
    }
    return muArray;
}
@end
