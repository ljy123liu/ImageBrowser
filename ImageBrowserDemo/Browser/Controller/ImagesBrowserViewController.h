//
//  ImagesBrowserViewController.h
//  Baletu
//
//  Created by LIUYONG on 16/6/3.
//  Copyright © 2016年 朱 亮亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UploadImagesBrowserView;
@interface ImagesBrowserViewController : UIViewController
@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic, assign) NSInteger imageIndex;
@property (nonatomic, strong) UploadImagesBrowserView *uploadView;
@end
