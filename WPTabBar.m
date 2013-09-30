//
//  WPTabBar.m
//  WPaper
//
//  Created by Lee on 13-8-28.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "WPTabBar.h"
#import <QuartzCore/QuartzCore.h>
@interface WPTabBar()
{
    NSArray *imgArr;
}

@end

@implementation WPTabBar
@synthesize btnsAry = _btnsAry, delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame buttonImages:nil];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIImage *)originalImg:(UIImage *)img toSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *) imageArray
{
    self = [super initWithFrame:frame];
    if (self) {
        //tab 背景
        UIImage *img = [UIImage imageNamed:@"tagBgPatten.png"];
        self.layer.contents = (id)img.CGImage;
        
        //tab 各个按钮的设置
        [self createBtnImageArray];
        
        NSInteger btnNum = [imageArray count];
        _btnsAry = [NSMutableArray arrayWithCapacity:btnNum];
        UIButton *btn;
        CGFloat width = SCREEN_WIDTH / btnNum;
        for (int i = 0; i < btnNum; i++) {
            btn = [[UIButton alloc] init];
            btn.tag = WPTAb_TAG_OFFSET + i;
            btn.frame = CGRectMake(width * i, 0, width, frame.size.height);
            [btn setImage:[[imgArr objectAtIndex:i] objectForKey:@"Default"] forState:UIControlStateNormal];
			[btn setImage:[[imgArr objectAtIndex:i] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
			[btn setImage:[[imgArr objectAtIndex:i] objectForKey:@"Seleted"] forState:UIControlStateSelected];
            //btn.backgroundColor = RGBCOLOR(arc4random() % 255, arc4random() % 255, arc4random() % 255);
            [btn setShowsTouchWhenHighlighted:YES];
            [_btnsAry addObject:btn];
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)createBtnImageArray
{
    NSMutableDictionary *imgDic1 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic1 setObject:[UIImage imageNamed:@"zxP.png"] forKey:@"Default"];
    [imgDic1 setObject:[UIImage imageNamed:@"zx.png"] forKey:@"Highlighted"];
    [imgDic1 setObject:[UIImage imageNamed:@"zx.png"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"ztP.png"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"zt.png"] forKey:@"Highlighted"];
    [imgDic2 setObject:[UIImage imageNamed:@"zt.png"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"allP.png"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"all.png"] forKey:@"Highlighted"];
    [imgDic3 setObject:[UIImage imageNamed:@"all.png"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic4 setObject:[UIImage imageNamed:@"flP.png"] forKey:@"Default"];
    [imgDic4 setObject:[UIImage imageNamed:@"fl.png"] forKey:@"Highlighted"];
    [imgDic4 setObject:[UIImage imageNamed:@"fl.png"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic5 setObject:[UIImage imageNamed:@"moreP.png"] forKey:@"Default"];
    [imgDic5 setObject:[UIImage imageNamed:@"more.png"] forKey:@"Highlighted"];
    [imgDic5 setObject:[UIImage imageNamed:@"more.png"] forKey:@"Seleted"];
    imgArr = [NSArray arrayWithObjects:imgDic1,imgDic2,imgDic3,imgDic4,imgDic5, nil];
}

- (void)pressBtn:(UIButton *)btn
{
    NSInteger theTag = btn.tag - WPTAb_TAG_OFFSET;
    [self selectTabAtIndex:theTag];
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {
        [_delegate tabBar:self didSelectIndex:theTag];
    }
    
}

- (void)selectTabAtIndex:(NSInteger)index
{
    int btnNum = [_btnsAry count];
    UIButton *btn;
    for (int i = 0; i<btnNum; i++)
    {
        btn = [_btnsAry objectAtIndex:i];
        [btn setImage:[[imgArr objectAtIndex:i] objectForKey:@"Default"] forState:UIControlStateNormal];
        btn.userInteractionEnabled = YES;
    }
    btn = [_btnsAry objectAtIndex:index];
    [btn setImage:[[imgArr objectAtIndex:index] objectForKey:@"Highlighted"] forState:UIControlStateNormal];
    btn.userInteractionEnabled = NO;
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
