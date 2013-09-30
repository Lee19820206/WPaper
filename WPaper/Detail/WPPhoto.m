//
//  WPPhoto.m
//  WPaper
//
//  Created by Lee on 13-9-26.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "WPPhoto.h"

@interface WPPhoto()
{
    NSURL *_imgURL;
    
    UIImage *_underlyingImage;
    BOOL _loadingInProgress;
}

@property (nonatomic, strong) UIImage *underlyingImage;
// Methods
- (void)imageDidFinishLoadingSoDecompress;
- (void)imageLoadingComplete;

@end

@implementation WPPhoto
@synthesize underlyingImage = _underlyingImage;

- (id)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        _imgURL = url;
    }
    return self;
}

#pragma mark - Private methods
- (void)imageLoadingComplete
{
    NSAssert([[NSThread currentThread] isMainThread], @"This method must be called on the main thread.");
    _loadingInProgress = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:WPPHOTO_LOADED_DID_END_NOTIFICATION object:self];
}

- (void)imageDidFinishLoadingSoDecompress
{
    NSAssert([[NSThread currentThread] isMainThread], @"This method must be called on the main thread.");
    if (self.underlyingImage) {
        [[SDWebImageDecoder sharedImageDecoder] decodeImage:self.underlyingImage withDelegate:self userInfo:nil];
    }else{
        [self imageLoadingComplete];
    }
}

#pragma mark - MWPhoto Protocol Methods
- (UIImage *)underlyingImage
{
    return _underlyingImage;
}

- (void)loadUnderlyingImageAndNotify
{
    NSAssert([[NSThread currentThread] isMainThread], @"This method must be called on the main thread.");
    _loadingInProgress = YES;
    if (self.underlyingImage) {
        [self imageLoadingComplete];
    }else if (_imgURL){
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        UIImage *cacheImg = [manager imageWithURL:_imgURL];
        if (cacheImg) {
            self.underlyingImage = cacheImg;
            
        }else{
            [manager downloadWithURL:_imgURL delegate:self];
        }
    } else {
        self.underlyingImage = nil;
        [self imageLoadingComplete];
    }
}

- (void)unloadUnderlyingImage
{
    _loadingInProgress = NO;
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
    if (self.underlyingImage && (_imgURL)) {
        self.underlyingImage = nil;
    }
}

#pragma mark - SDWebImage Delegate
// Called on main
- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image {
    self.underlyingImage = image;
    [self imageDidFinishLoadingSoDecompress];
}

// Called on main
- (void)webImageManager:(SDWebImageManager *)imageManager didFailWithError:(NSError *)error {
    self.underlyingImage = nil;
    WPLog(@"SDWebImage failed to download image: %@", error);
    [self imageDidFinishLoadingSoDecompress];
}

// Called on main
- (void)imageDecoder:(SDWebImageDecoder *)decoder didFinishDecodingImage:(UIImage *)image userInfo:(NSDictionary *)userInfo {
    // Finished compression so we're complete
    self.underlyingImage = image;
    [self imageLoadingComplete];
}

@end
