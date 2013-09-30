//
//  DetailView.m
//  WPaper
//
//  Created by Lee on 13-9-16.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "DetailView.h"
#import "WPBeta.h"
#import "PreviewNormal.h"

#define btn_w 30
#define btn_h 40
#define btn_x 20
#define scrollView_X 75
#define scrollView_W 234
#define Pic_H 351

@interface DetailView()<UIWebViewDelegate>
{
    UIButton *_saveBtn;
    UIButton *_previewBtn;
    UIButton *_shareBtn;
    UIImageView *_bar;
    UIScrollView *_scrollView;
    UIButton *_btn;
    
    UILabel *_titleLable;
    UILabel *_dateLable;
    UIWebView *_infoWebView;
    
    UIActionSheet *_actionSheet;
}

@end

@implementation DetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _bar = [[UIImageView alloc] init];
        _bar.frame = CGRectMake(0, H_GAP, TODAY_KID_BAR_W, TODAY_KID_BAR_H);
        _bar.image = [UIImage imageNamed:@"kidBar.png"];
        [self addSubview:_bar];
        
        _saveBtn = [[UIButton alloc] init];
        _saveBtn.frame = CGRectMake(btn_x, H_GAP + TODAY_KID_BAR_H, btn_w, btn_h);
        [_saveBtn setImage:[UIImage imageNamed:@"downLoadBtn.png"] forState:UIControlStateNormal];
        [_saveBtn setImage:[UIImage imageNamed:@"downLoadBtnP.png"] forState:UIControlStateHighlighted];
        [self addSubview:_saveBtn];
        
        _previewBtn = [[UIButton alloc] init];
        _previewBtn.frame = CGRectMake(btn_x, H_GAP + TODAY_KID_BAR_H + (btn_h + H_GAP * 2) * 1, btn_w, btn_h);
        [_previewBtn setImage:[UIImage imageNamed:@"previewBtn.png"] forState:UIControlStateNormal];
        [_previewBtn setImage:[UIImage imageNamed:@"previewBtnP.png"] forState:UIControlStateHighlighted];
        [self addSubview:_previewBtn];
        
        _shareBtn = [[UIButton alloc] init];
        _shareBtn.frame = CGRectMake(btn_x, H_GAP + TODAY_KID_BAR_H + (btn_h + H_GAP * 2) * 2, btn_w, btn_h);
        [_shareBtn setImage:[UIImage imageNamed:@"shareBtn.png"] forState:UIControlStateNormal];
        [_shareBtn setImage:[UIImage imageNamed:@"shareBtnP.png"] forState:UIControlStateHighlighted];
        [self addSubview:_shareBtn];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(scrollView_X, 0, scrollView_W, SCREEN_HEIGHT - HEAD_H - STATU_BAR_HEIGHT);
        _scrollView.backgroundColor = CLEANCOLOR;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        _scrollView.contentSize = CGSizeMake(scrollView_X, 700);
        [self addSubview:_scrollView];
        
        //[self initWithData];
    }
    return self;
}

- (void)configWithData
{
    _btn = [[UIButton alloc] init];
    int gap = 10;
    float h = [self caculatePicH];
    _btn.frame = CGRectMake(0, gap, scrollView_W, h);
    [_btn setImage:[UIImage imageNamed:[WPBeta randomImg]] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(previewImg:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_btn];
    //_btn.userInteractionEnabled = NO;
    
    int titleH = 20;
    _titleLable = [[UILabel alloc] init];
    _titleLable.frame = CGRectMake(0, gap * 2 + h, scrollView_W, titleH);
    _titleLable.font = [UIFont boldSystemFontOfSize:20];
    _titleLable.backgroundColor = CLEANCOLOR;
    _titleLable.textColor = RGBCOLOR(0, 0, 0);
    _titleLable.text = @"图样图森破";
    [_scrollView addSubview:_titleLable];
    
    int dateH = 10;
    _dateLable = [[UILabel alloc] init];
    _dateLable.frame = CGRectMake(0, gap * 3 + h + titleH, scrollView_W, dateH);
    _dateLable.font = [UIFont systemFontOfSize:12];
    _dateLable.backgroundColor = CLEANCOLOR;
    _dateLable.textColor = [UIColor grayColor];
    _dateLable.text = @"2013-09-03";
    [_scrollView addSubview:_dateLable];
    
    _infoWebView = [[UIWebView alloc] init];
    _infoWebView.backgroundColor = [UIColor clearColor];
    _infoWebView.opaque = NO;
    _infoWebView.delegate = self;
    _infoWebView.userInteractionEnabled = NO;
    _infoWebView.frame = CGRectMake(0, gap * 4 + h + titleH + dateH, scrollView_W, 10);
    
    NSString *webviewText = HOTPAGE_HTML_DAY_STYLE;
    NSString *htmlString = [webviewText stringByAppendingFormat:@"%@", @"这是一张关于电影海报的壁纸"];
    [_infoWebView loadHTMLString:htmlString baseURL:nil];
    [_scrollView addSubview:_infoWebView];
    
}

- (void)previewImg:(UIButton *)abtn
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    //frame.origin.y = 0;
    PreviewNormal *preview = [[PreviewNormal alloc] initWithFrame:frame];
    [preview updateImg:[_btn imageForState:UIControlStateNormal]];
    [KEY_WINDOW addSubview:preview];
}

- (void)pressBtn:(UIButton *)abtn
{
    //_actionSheet = [UIActionSheet alloc] in
}

- (void)displayImg
{
    
}

- (float)caculatePicH
{
    return Pic_H;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    int gap = 10;
    CGRect frame = _infoWebView.frame;
    NSString *fitHeight = [_infoWebView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"];
    frame.size.height = [fitHeight floatValue];
    _infoWebView.frame = frame;
    [_scrollView setContentSize:CGSizeMake(scrollView_W, _infoWebView.frame.size.height + gap + frame.origin.y)];
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
