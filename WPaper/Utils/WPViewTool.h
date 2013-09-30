//
//  WPViewTool.h
//  WPaper
//
//  Created by Lee on 13-9-10.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPViewTool : NSObject

//压入视图栈
+ (void)pushView: (UIViewController *)childViewController;

//弹出视图栈
+ (UIViewController *)popView;

@end
