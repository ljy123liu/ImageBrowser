//
//  UploadImagesBrowserView.h
//  Baletu
//
//  Created by LIUYONG on 16/6/2.
//  Copyright © 2016年 朱 亮亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UploadImagesBrowserView;
@protocol UploadImagesBrowserViewDeleagte
- (void)addimage;
- (void)checkImage:(UIButton *)btn;
@end

@interface UploadImagesBrowserView : UIView
@property (nonatomic, weak) id <UploadImagesBrowserViewDeleagte> delegate;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) NSString *tips;
- (void)addImageFromCameraAndLibrary:(UIImage *)image;
@end