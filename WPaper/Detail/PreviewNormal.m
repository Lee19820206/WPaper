//
//  PreviewNormal.m
//  WPaper
//
//  Created by Lee on 13-9-26.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "PreviewNormal.h"
#import <QuartzCore/QuartzCore.h>

@interface PreviewNormal()
{
    UIButton *_btn;
    UIImageView *_img;
    UIView *_black;
}

@end

@implementation PreviewNormal

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _btn = [[UIButton alloc] initWithFrame:frame];
        [_btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        _btn.backgroundColor = CLEANCOLOR;
        _img = [[UIImageView alloc] initWithFrame:frame];
        _black = [[UIView alloc] initWithFrame:frame];
        _black.backgroundColor = [UIColor blackColor];
        [self addSubview:_img];
        [self addSubview:_black];
        [self addSubview:_btn];
    }
    return self;
}

- (void)pressBtn:(UIButton *)btn
{
    [UIView animateWithDuration:.4 animations:^{
        //_img.alpha = 0.0;
        _black.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)updateImg:(UIImage *)image
{
    
    _img.image = image;
    _black.alpha = 0.5;
    _img.alpha = 1.0;
    [UIView animateWithDuration:.4 animations:^{
        //_img.alpha = 1.0;
        _black.alpha = 0.0;
    } completion:^(BOOL finished) {
        //[self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
