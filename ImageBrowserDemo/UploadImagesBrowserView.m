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
    CGFloat buttonW = (DEF_SCREEN_WIDTH - marginX * 5) / 4;
    CGFloat buttonH = buttonW;
    NSInteger col = 4;
//    NSInteger row = 2;
    if (self.images.count < 4) {
        for (int i = 0; i <= self.images.count; i++) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(marginX + i * (buttonW + marginX) , marginY, buttonW, buttonH)];
            [button addTarget:self action:@selector(addImage:) forControlEvents:UIControlEventTouchUpInside];
            if (i < self.images.count) {
                [button setBackgroundImage:self.images[i] forState:UIControlStateNormal];
            }else {
                [button setBackgroundImage:[UIImage imageNamed:@"paizhao"] forState:UIControlStateNormal];
            }
            button.showsTouchWhenHighlighted = NO;
            button.tag = 10 + i;
            [self addSubview:button];
            if (self.images.count == 0 && self.tips.length != 0) {
                CGSize tipsSize = [self.tips sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
                UILabel *tips = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button.frame)+15, button.center.y - tipsSize.height/2, tipsSize.width, tipsSize.height)];
                tips.text = self.tips;
                tips.font = [UIFont systemFontOfSize:12];
                tips.textColor = [UIColor lightGrayColor];
                [self addSubview:tips];
            }
            CGRect rect = self.frame;
            rect.size.height = self.height;
            self.frame = rect;
        }
    }
    else if (self.images.count >= 4 && self.images.count <= 8) {
        CGRect rect = self.frame;
        rect.size.height = 2 * self.height - 15;
        self.frame = rect;
        self.backgroundColor = [UIColor whiteColor];
        for (int i = 0; i <= self.images.count; i++) {
            if (i == 8) {
                return;
            }
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i%col*(buttonW + marginX) + marginX, i/col*(buttonW + marginX)+ marginX , buttonW, buttonH)];
            [button addTarget:self action:@selector(addImage:) forControlEvents:UIControlEventTouchUpInside];
            if (i < self.images.count) {
                [button setBackgroundImage:self.images[i] forState:UIControlStateNormal];
            }else {
                [button setBackgroundImage:[UIImage imageNamed:@"paizhao"] forState:UIControlStateNormal];
            }
            button.tag = 10 + i;
            [self addSubview:button];
        }
    }
}

- (void)addImageFromCameraAndLibrary:(UIImage *)image {
    [self.images addObject:image];
    [self setNeedsLayout];
}

- (void)addImage:(UIButton *)btn {
    
    if ([btn.currentBackgroundImage isEqual:[UIImage imageNamed:@"paizhao" ]]) {
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
