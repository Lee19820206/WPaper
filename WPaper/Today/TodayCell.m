//
//  TodayCell.m
//  WPaper
//
//  Created by Lee on 13-8-31.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "TodayCell.h"
#import "ImageButton.h"
#import "ThumbModel.h"
@interface TodayCell()
{
    //NSUInteger beginPos;
}

@end

@implementation TodayCell
@synthesize todayModle = _todayModle;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.frame = CGRectMake(10, 20, 75, 30);
        _dayLabel.font = [UIFont boldSystemFontOfSize:25];
        _dayLabel.text = @"09";
        _dayLabel.backgroundColor = CLEANCOLOR;
        [self.contentView addSubview:_dayLabel];
        
        _monthLabel= [[UILabel alloc] init];
        _monthLabel.frame = CGRectMake(10, 60, 75, 30);
        _monthLabel.font = [UIFont systemFontOfSize:16];
        _monthLabel.text = @"10月";
        _monthLabel.textColor = [UIColor grayColor];
        _monthLabel.backgroundColor = CLEANCOLOR;
        [self.contentView addSubview:_monthLabel];
        
        _mainBtn = [[ImageButton alloc] init];
        _mainBtn.frame = CGRectMake(75, 10, 130, 195);
        _mainBtn.backgroundColor = RGBCOLOR(0, 0, 0);
        
        [self.contentView addSubview:_mainBtn];
        
        _bar = [[UIImageView alloc] init];
        _bar.frame = CGRectMake(0, 10, TODAY_KID_BAR_W, TODAY_KID_BAR_H);
        _bar.image = [UIImage imageNamed:@"kidBar.png"];
        [self.contentView addSubview:_bar];
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTodayModle:(TodayModel *)modle
{
    //_mainBtn.bodyImgUrl = [modle.thumbs objectAtIndex:0];
    ThumbModel *thumbModel;
    thumbModel = [modle.thumbs objectAtIndex:0];
    thumbModel.pos = modle.beginPos;
    _mainBtn.thumbModel = thumbModel;
    if (_scrollView) {
        [_scrollView removeFromSuperview];
    }
    _scrollView = nil;
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 215, SCREEN_WIDTH, 112.5);
    NSUInteger num = [modle.thumbs count];
    ImageButton *imgBtn;
    _scrollView.contentSize = CGSizeMake((TODAY_PIC_W + PIC_X_GAP) * (num - 1) - PIC_X_GAP, TODAY_PIC_H);
    for (int i = 1; i < num; i++) {
        imgBtn = [[ImageButton alloc] init];
        imgBtn.frame = CGRectMake((TODAY_PIC_W + PIC_X_GAP) * (i - 1), 0, TODAY_PIC_W, TODAY_PIC_H);
        thumbModel = (ThumbModel *)[modle.thumbs objectAtIndex:i];
        thumbModel.pos = modle.beginPos + i;
        imgBtn.thumbModel = thumbModel;
        //imgBtn.backgroundColor = RGBCOLOR(arc4random() % 225, arc4random() % 225, arc4random() % 225);
        [_scrollView addSubview:imgBtn];
    }
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentInset = UIEdgeInsetsMake(0, 75, 0, 0);
    _scrollView.contentOffset = CGPointMake(-75, 0);
    [self.contentView addSubview:_scrollView];
}

@end
