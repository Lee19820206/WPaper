//
//  WPTabBarController.m
//  WPaper
//
//  Created by Lee on 13-8-28.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "WPTabBarController.h"
#import "WPTabBar.h"

@interface WPTabBarController ()
{
    UIView *_holderView;
    UIView *_transitionView;
}

@end

@implementation WPTabBarController
@synthesize tabBar = _tabBar, delegate = _delegate, selectedIndex = _selectedIndex, viewControllers = _viewControllers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _viewControllers = [NSMutableArray arrayWithArray:vcs];
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        //NSLog(@"frame y : %f", frame.origin.y);
        _holderView = [[UIView alloc] initWithFrame:frame];
        _transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, frame.size.height - TAB_BAR_HEIGHT)];
        _tabBar = [[WPTabBar alloc] initWithFrame:CGRectMake(0 ,frame.size.height - TAB_BAR_HEIGHT, SCREEN_WIDTH, TAB_BAR_HEIGHT) buttonImages:_viewControllers];
        _tabBar.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_holderView addSubview:_transitionView];
    [_holderView addSubview:_tabBar];
    self.view  = _holderView;
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayViewAtIndex:(NSInteger)index
{
    if ([_delegate respondsToSelector:@selector(wpTabBarController:shouldSelectViewController:)]) {
        if (![_delegate wpTabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]]) {
            return;
        }
    }
    
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0) {
        return;
    }
    _selectedIndex = index;
    UIViewController *selectedVc = [self.viewControllers objectAtIndex:index];
    selectedVc.view.frame = _transitionView.frame;
    if ([selectedVc.view isDescendantOfView:_transitionView]) {
        NSLog(@"A");
        [_transitionView bringSubviewToFront:selectedVc.view];
    }else{
        NSLog(@"B");
        [_transitionView addSubview:selectedVc.view];
    }
    
    if ([_delegate respondsToSelector:@selector(wpTabBarController:didSelectViewController:)]) {
        [_delegate wpTabBarController:self didSelectViewController:selectedVc];
    }
    
}

- (void)setSelectedIndex:(NSInteger)index
{
    [self displayViewAtIndex:index];
    [_tabBar selectTabAtIndex:index];
}

- (NSInteger)selectedIndex
{
    return _selectedIndex;
}

#pragma mark -
#pragma mark WPTabBarDelegete
- (void)tabBar:(WPTabBar *)tabBar didSelectIndex:(NSInteger)index
{
    [self displayViewAtIndex:index];
}


@end
