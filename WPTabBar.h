//
//  WPTabBar.h
//  WPaper
//
//  Created by Lee on 13-8-28.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WPTabBar;

@protocol WPTabBarDelegete <NSObject>
@optional
- (void)tabBar:(WPTabBar *)tabBar didSelectIndex:(NSInteger)index;
@end



@interface WPTabBar : UIView
{
}

@property (nonatomic) NSMutableArray *btnsAry;
@property (nonatomic, weak) id<WPTabBarDelegete> delegate;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray;
- (void)selectTabAtIndex:(NSInteger)index;
@end
