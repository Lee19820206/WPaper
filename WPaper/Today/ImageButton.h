//
//  ImageButton.h
//  WPaper
//
//  Created by Lee on 13-9-9.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "ThumbModel.h"
#import "UIButton+WebCache.h"

@class ImageButton;
@protocol ImageButtonDelegate <NSObject>

@optional
- (void)imageBtn:(ImageButton *)btn didPressedWithId:(NSString *)detailId;
@end


static NSUInteger total = 0;

@interface ImageButton : UIView
{
    UIImageView *_cover;
    UIButton *_btn;
    
}

@property (weak) id<ImageButtonDelegate> delegate;
@property (strong, nonatomic) NSString *detailId;
@property (nonatomic, strong) NSString *bodyImgUrl;
@property (nonatomic) int index;
@property (nonatomic) ThumbModel *thumbModel;
+ (NSUInteger)howMany;


@end
