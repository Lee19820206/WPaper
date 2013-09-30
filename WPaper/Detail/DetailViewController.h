//
//  DetailViewController.h
//  WPaper
//
//  Created by Lee on 13-9-10.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"
#import "WPPhoto.h"

@class DetailViewController;
@protocol DetailViewControllerDelegate <NSObject>

- (NSUInteger)numberOfPhotosInDetailVC:(DetailViewController *)detailVc;
- (WPPhoto *)detailViewController:(DetailViewController*)detailVc photoAtIndex:(NSUInteger) index;

@end
@interface DetailViewController : UIViewController
{
    
}

@property (nonatomic, weak) id <DetailViewControllerDelegate> delegate;

- (id)initWithCurrentIndex:(NSUInteger)currentIndex andTotal:(NSUInteger)total;
@end
