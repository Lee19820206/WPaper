//
//  TodayCell.h
//  WPaper
//
//  Created by Lee on 13-8-31.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageButton.h"
#import "TodayModel.h"


@interface TodayCell : UITableViewCell
{
    UIImageView *_bar;
    UILabel *_dayLabel;
    UILabel *_monthLabel;
    UIScrollView *_scrollView;
    ImageButton *_mainBtn;
}
@property (nonatomic, strong)TodayModel *todayModle;

@end
