//
//  UploadImagesBrowserView.m
//  Baletu
//
//  Created by LIUYONG on 16/6/2.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "UploadImagesBrowserView.h"
#define DEF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface UploadImagesBrowserView ()
@property (nonatomic, assign) CGFloat height;
@end
@implementation UploadImagesBrowserView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.height = self.frame.size.height;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    CGFloat marginX = 15;
    CGFloat marginY = 15;
    NSInteger col = 4;
    NSInteger row = 2;
    CGFloat buttonW = (DEF_SCREEN_WIDTH - marginX * (col + 1)) / col;
    CGFloat buttonH = buttonW;
    
    for (int i = 0; i <= self.images.count; i++) {
        if (i == 8) {
            return;
        }
        //改变frame
        CGRect rect = self.frame;
        if (i < col) {
            rect.size.height = self.height;
        }else {
            rect.size.height = 2 * self.height - 15;
        }
        self.frame = rect;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i%col*(buttonW + marginX) + marginX, i/col*(buttonW + marginY)+ marginY , buttonW, buttonH)];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        if (i < self.images.count) {
            [button setBackgroundImage:self.images[i] forState:UIControlStateNormal];
        }else {
            [button setBackgroundImage:[UIImage imageNamed:@"paizhao"] forState:UIControlStateNormal];
        }
        button.tag = 10 + i;
        [self addSubview:button];
        
        //当没有图片的时候添加提示
        if (self.images.count == 0 && self.tips.length != 0) {
            CGSize tipsSize = [self.tips sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
            UILabel *tips = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button.frame)+15, button.center.y - tipsSize.height/2, tipsSize.width, tipsSize.height)];
            tips.text = self.tips;
            tips.font = [UIFont systemFontOfSize:12];
            tips.textColor = [UIColor lightGrayColor];
            [self addSubview:tips];
        }
    }
}

- (void)addImageFromCameraAndLibrary:(UIImage *)image {
    [self.images addObject:image];
    [self setNeedsLayout];
}

- (void)clickButton:(UIButton *)btn {
    
    if ([btn.currentBackgroundImage isEqual:[UIImage imageNamed:@"paizhao"]]) {
        if (self.delegate) {
            [self.delegate addimage];
        }
    }else {
        if (self.delegate) {
            [self.delegate checkImage:btn];
        }
    }
}

- (NSMutableArray *)images {
    if (!_images) {
        _images = [NSMutableArray new];
    }
    return _images;
}

@end
