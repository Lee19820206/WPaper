//
//  WPTabBarController.h
//  WPaper
//
//  Created by Lee on 13-8-28.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPTabBar.h"

@class WPTabBarController;

@protocol WPTabBarControllerDelegate <NSObject>
@optional
- (BOOL)wpTabBarController:(WPTabBarController *)tabVc shouldSelectViewController:(UIViewController *)viewController;
- (void)wpTabBarController:(WPTabBarController *)tabVc didSelectViewController:(UIViewController *)viewController;
@end
@interface WPTabBarController : UIViewController <WPTabBarDelegete>
{
    
}
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic, strong) WPTabBar *tabBar;
@property (nonatomic, weak) id<WPTabBarControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *viewControllers;

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;
@end
