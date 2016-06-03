//
//  CallingCamera.h
//  Baletu
//
//  Created by LIUYONG on 16/5/30.
//  Copyright © 2016年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ImagePickerType){
    ImagePickerTypeCamera       = 0,
    ImagePickerTypePhotoLibrary = 1
};

@interface CallingCameraAndLibrary : NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/**
 *  判断摄像头是否可用
 *
 *  @return <#return value description#>
 */
+ (BOOL)isCameraAvailable;

/**
 *  判断相册是否可用
 *
 *  @return <#return value description#>
 */
+ (BOOL)isPhotoLibraryAvailable;

/**
 *  创建图片选择控制器（摄像头，图片库）
 *
 *  @param type     枚举值
 *  @param delegate UIImagePickerControllerDelegate，控制器
 *
 *  @return 返回图像控制器
 */
+ (UIImagePickerController *)creatUIImagePickerControllerType:(ImagePickerType)type delegate:(id)delegate;

/**
 *  从图片控制器代理方法返回信息中获取图片
 *
 *  @param info UIImagePickerController代理方法中返回信息
 *
 *  @return 返回图像
 */
+ (UIImage *)getImageFromImagePickerControllerWithDict:(NSDictionary *)info;
@end
