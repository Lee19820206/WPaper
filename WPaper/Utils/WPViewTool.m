//
//  WPViewTool.m
//  WPaper
//
//  Created by Lee on 13-9-10.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "WPViewTool.h"

@implementation WPViewTool

//压入视图栈
+ (void)pushView: (UIViewController *)childViewController {
    [SharedAppDelegate.navigationVc pushViewController:childViewController animated:YES];
    
}

//弹出视图栈
+ (UIViewController *)popView {
    
    UIViewController *vc = [SharedAppDelegate.navigationVc popViewControllerAnimated:YES];
    
    return vc;
    //[SharedAppDelegate.navigationVc po];
}

@end
