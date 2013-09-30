//
//  DetailViewController.m
//  WPaper
//
//  Created by Lee on 13-9-10.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "DetailViewController.h"
#import "ImageButton.h"
#define CONTENT_SIZEWIDTH 320

@interface DetailViewController () <UIScrollViewDelegate>
{
    UIImageView *_headBar;
    UIView *_holderView;
    
    UIButton *_backBtn;
    UIScrollView *_scrollView;
    NSUInteger _currentIndex;
    NSUInteger _total;
    UILabel *_title;
    NSMutableArray *_photos;
    NSUInteger _photoCount;
    
}

- (NSUInteger)numberOfPhotos;
- (void)updateNavigationTitle;

//paging
- (void)didStartViewingPageAtIndex:(NSUInteger)index;

@end

@implementation DetailViewController

@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _currentIndex = NSNotFound;
        _photos = [[NSMutableArray alloc] init];
        
        _holderView = [[UIView alloc] init];
        _holderView.frame = [[UIScreen mainScreen] applicationFrame];
        
        _headBar = [[UIImageView alloc] init];
        _headBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, HEAD_H);
        _headBar.image = [UIImage imageNamed:@"headBar.png"];
        
        _holderView.backgroundColor = RGBCOLOR(23, 23, 23);
        
        
        _backBtn = [[UIButton alloc] init];
        _backBtn.frame = CGRectMake(0, 0, HEAD_H, HEAD_H);
        //_backBtn.backgroundColor = ARGBCOLOR(0, 0, 0, 0.5);
        [_backBtn setImage:[UIImage imageNamed:@"backBtn.png"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"backBtnPress.png"] forState:UIControlStateHighlighted];
        _backBtn.tag = DETAIL_TAG_OFFSET + 1;
        [_backBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        _scrollView.frame = CGRectMake(0, HEAD_H, SCREEN_WIDTH, SCREEN_HEIGHT - HEAD_H);
        
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(100, 0, 120, HEAD_H);
        _title.backgroundColor = CLEANCOLOR;
        _title.frame = CGRectMake(100, 0, 120, HEAD_H);
        _title.font = HEAD_TITLE_STYLE_FONT;
        //_title.text = TODAY_HEAD_TITLE;
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (id)initWithPhotos:(NSArray *)photosArray
{
    return self;
}

- (NSUInteger)numberOfPhotos
{
    if (_photoCount == NSNotFound) {
        _photoCount = [_photos count];
    }
    if (_photoCount == NSNotFound) {
        _photoCount = 0;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(numberOfPhotosInDetailVC:)]) {
        _photoCount = [_delegate numberOfPhotosInDetailVC:self];
    }
    return _photoCount;
}

- (id)initWithCurrentIndex:(NSUInteger)currentIndex andTotal:(NSUInteger)total
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        _currentIndex = currentIndex + 1;
        _total = total;
        _title.text = [NSString stringWithFormat:@"%d / %d", _currentIndex, _total];
    }
    
    return self;
}

- (void)updateNavigationTitle
{
    if (_title) {
        _title.text = [NSString stringWithFormat:@"%d / %d", _currentIndex, _total];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [_holderView addSubview:_headBar];
    [_holderView addSubview:_backBtn];
    DetailView *detailView;
    
    _total = [self numberOfPhotos];
    _title.text = [NSString stringWithFormat:@"%d / %d", _currentIndex, _total];
    
    for (int i = 0; i<_total ; i++) {
        [_photos addObject:[NSNull null]];
        detailView = [[DetailView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT - HEAD_H)];
        [_scrollView addSubview:detailView];
    }
    
    [(DetailView *)[[_scrollView subviews] objectAtIndex:_currentIndex - 1] configWithData];
    [(DetailView *)[[_scrollView subviews] objectAtIndex:_currentIndex] configWithData];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * _total, SCREEN_HEIGHT - HEAD_H);
    
    [_holderView addSubview:_scrollView];
    [_holderView addSubview:_title];
    _holderView.backgroundColor = RGBCOLOR(255, 255, 255);
    self.view = _holderView;
    
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * (_currentIndex - 1), 0);
    [self didStartViewingPageAtIndex:_currentIndex];
    
    //NSLog(@"_current = %d  _total = %d", _currentIndex, _total);
	// Do any additional setup after loading the view.
}

- (void)pressBtn:(UIButton *)btn
{
    [WPViewTool popView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = 0;
    
    index = floor((_scrollView.contentOffset.x - CONTENT_SIZEWIDTH / 2) / CONTENT_SIZEWIDTH) + 1;
    
    if (index < 0) {
        index = 0;
    }
    if (index > _total - 1) {
        index = _total - 1;
    }
    //WPLog(@"index didscroll  %d", index);
    NSUInteger previousCurrentPage = _currentIndex;
    _currentIndex = index;
    if (_currentIndex != previousCurrentPage) {
        [self didStartViewingPageAtIndex:_currentIndex];
    }
    
}

- (void)didStartViewingPageAtIndex:(NSUInteger)index
{
    NSLog(@"change index");
    NSUInteger i;
    if (index > 0) {
        for (i = 0; i < index - 1; i++) {
            id photo = [_photos objectAtIndex:i];
            if (photo != [NSNull null]) {
                [photo unloadUnderlyingImage];
                [_photos replaceObjectAtIndex:i withObject:[NSNull null]];
            }
        }
    }
    
    if (index < [self numberOfPhotos] - 1) {
        for (i = index + 2; i < _photos.count; i++) {
            id photo = [_photos objectAtIndex:i];
            if (photo != [NSNull null]) {
                [photo unloadUnderlyingImage];
                [_photos replaceObjectAtIndex:i withObject:[NSNull null]];
                WPLog(@"Released underlying image at index %i", i);
            }
        }
    }
    
    id <WPPhotoProtocol> currentPhoto = [self photoAtIndex:index];
    if ([currentPhoto underlyingImage]) {
        [self loadAdjacentPhotosIfNeccessary:currentPhoto];
    }
    
}

- (void)loadAdjacentPhotosIfNeccessary:(id<WPPhotoProtocol>)photo
{
    
}

- (id<WPPhotoProtocol>)photoAtIndex:(NSUInteger)index
{
    id <WPPhotoProtocol> photo = nil;
    if (index < _photos.count) {
        if ([_photos objectAtIndex:index] == [NSNull null]) {
            if (_delegate && [_delegate respondsToSelector:@selector(detailViewController: photoAtIndex:)]) {
                photo = [_delegate detailViewController:self photoAtIndex:index];
            }
            if (photo) {
                [_photos replaceObjectAtIndex:index withObject:photo];
            }
        }else{
            photo = [_photos objectAtIndex:index];
        }
    }
    return photo;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
