//
//  ImageButton.m
//  WPaper
//
//  Created by Lee on 13-9-9.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "ImageButton.h"

@implementation ImageButton
@synthesize delegate = _delegate, detailId = _detailId, bodyImgUrl = _bodyImgUrl, index = _index;
@synthesize thumbModel = _thumbModel;

- (id)initWithFrame:(CGRect)aframe
{
    self = [super initWithFrame:aframe];
    if (self) {
        
        // Initialization code
        _cover = [[UIImageView alloc] init];
        CGRect frame = CGRectMake(0, SCREEN_HEIGHT - MY_H, aframe.size.width, aframe.size.height);
        //_cover.frame = CGRectMake(0, SCREEN_HEIGHT - MY_H, TODAY_MAIN_BTN_W, TODAY_MAIN_BTN_H);
        _cover.frame = frame;
        _cover.image = [UIImage imageNamed:@"defaultCover.png"];
        self.backgroundColor = RGBCOLOR(0, 0, 30);
        
        
        _btn = [[UIButton alloc] init];
        _btn.frame = frame;
        
        //[_btn setImage:[UIImage imageNamed:imgUrl] forState:UIControlStateNormal];
        //_btn.backgroundColor =
        [_btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
        [self addSubview:_cover];
        self.backgroundColor = RGBCOLOR(arc4random() % 255, arc4random() % 255, arc4random() % 255);
        //[ImageButton undateTotal];
        _index = total;
    }
    return self;
}

- (void)setBodyImgUrl:(NSString *)imgUrl
{
    NSLog(@"imgUrl %@", imgUrl);
    //[_btn setImage:[UIImage imageNamed:imgUrl] forState:UIControlStateNormal];
}

- (void)setThumbModel:(ThumbModel *)theThumbModel
{
    _thumbModel = theThumbModel;
    NSLog(@"_thumbModel.imgUrl %@", _thumbModel.imgUrl);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_PRE, _thumbModel.imgUrl]];
    [_btn setImageWithURL:url placeholderImage:nil];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    UIImage *img = [manager imageWithURL:url];
    if (img) {
        [_btn setImage:img forState:UIControlStateNormal];
    }
}

+ (void)undateTotal
{
    total++;
}

+ (NSUInteger)howMany
{
    return total;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _cover.frame = CGRectMake(0, SCREEN_HEIGHT - MY_H, frame.size.width, frame.size.height);
    _btn.frame = CGRectMake(0, SCREEN_HEIGHT - MY_H, frame.size.width, frame.size.height);
}

- (void)pressBtn:(UIButton *)btn
{
    //[WPViewTool popView];
    NSLog(@"image pressed!");
    if ([_delegate respondsToSelector:@selector(imageBtn:didPressedWithId:)]) {
        [_delegate imageBtn:self didPressedWithId:_detailId];
    }
    [SharedAppDelegate.todayVc showDetailViewWithPos:_thumbModel.pos];
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
