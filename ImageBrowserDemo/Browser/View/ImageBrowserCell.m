//
//  ImageBrowserCell.m
//  ImageBrowserDemo
//
//  Created by LIUYONG on 16/6/14.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "ImageBrowserCell.h"
#define DEF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation ImageBrowserCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView {
    CGFloat imageViewHeight = DEF_SCREEN_HEIGHT - 64 - 49 - 50;
    CGFloat imageViewWidth = DEF_SCREEN_WIDTH;

    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,(self.frame.size.height - imageViewHeight)/2, imageViewWidth, imageViewHeight)];
        _imageView.contentMode =  UIViewContentModeScaleAspectFit;
    }
    return _imageView;

}

@end
