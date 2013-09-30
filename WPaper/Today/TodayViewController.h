//
//  TodayViewController.h
//  WPaper
//
//  Created by Lee on 13-8-30.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "WPPhoto.h"
#import "ASIFormDataRequest.h"

@interface TodayViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, DetailViewControllerDelegate, ASIHTTPRequestDelegate>
- (void)showDetailViewWithPos:(NSUInteger)pos;

@end
