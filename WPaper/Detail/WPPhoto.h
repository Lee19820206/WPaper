//
//  WPPhoto.h
//  WPaper
//
//  Created by Lee on 13-9-26.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPPhotoProtocol.h"
#import "SDWebImageDecoder.h"
#import "SDWebImageManager.h"

@interface WPPhoto : NSObject <WPPhotoProtocol, SDWebImageManagerDelegate, SDWebImageDecoderDelegate>

- (id)initWithURL:(NSURL *)url;

@end
