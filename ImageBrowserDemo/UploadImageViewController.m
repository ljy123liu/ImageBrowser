//
//  UploadImageViewController.m
//  Baletu
//
//  Created by LIUYONG on 16/6/2.
//  Copyright © 2016年 朱 亮亮. All rights reserved.
//

#import "UploadImageViewController.h"
#import "BLTNaviBar.h"
#import "UploadImagesBrowserView.h"
#import "CallingCameraAndLibrary.h"
#import "ImagesBrowserViewController.h"
#define DEF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface UploadImageViewController () <BLTNaviBarDelegate,UploadImagesBrowserViewDeleagte,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) UploadImagesBrowserView *uploadView;
@end

@implementation UploadImageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self createUI];
}

- (void)createUI {
    BLTNaviBar *nav = [[BLTNaviBar alloc] initNavibarWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 64) title:@"上传照片" leftItemImage:@"fanhui" rightItemImage:nil];
    nav.delegate = self;
    [self.view addSubview:nav];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, DEF_SCREEN_WIDTH, 40)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    
    NSString *titleStr = @"请上传此房源的真实照片哦～";
    CGSize titleSize = [titleStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, titleSize.width, titleSize.height)];
    title.text = titleStr;
    title.font = [UIFont systemFontOfSize:13];
    title.textColor = [UIColor lightGrayColor];
    title.contentMode = UIViewContentModeBottomLeft;
    [titleView addSubview:title];
    
    self.uploadView = [[UploadImagesBrowserView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), DEF_SCREEN_WIDTH, 120)];
    self.uploadView.delegate = self;
    self.uploadView.tips = @"点击上传房源图片";
    [self.view addSubview:self.uploadView];
    
    UIButton *submit = [[UIButton alloc] initWithFrame:CGRectMake(0, DEF_SCREEN_HEIGHT - 40, DEF_SCREEN_WIDTH, 40)];
    [submit setTitle:@"确定" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submit setBackgroundColor:[UIColor redColor]];
    [submit addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];
}

#pragma mark - EventsResponses

- (void)submit {
    
}

- (void)addimage {
    
    if ([CallingCameraAndLibrary isPhotoLibraryAvailable]) {
        UIImagePickerController *imagePick = [CallingCameraAndLibrary creatUIImagePickerControllerType:ImagePickerTypePhotoLibrary delegate:self];
        [self presentViewController:imagePick animated:YES completion:nil];
    }
}

- (void)checkImage:(UIButton *)btn {
    ImagesBrowserViewController *imagesBrowser = [ImagesBrowserViewController new];
    imagesBrowser.imagesArray = self.uploadView.images;
    imagesBrowser.imageIndex = btn.tag - 10;
    imagesBrowser.uploadView = self.uploadView;
    [self.navigationController pushViewController:imagesBrowser animated:YES];
}

- (void)leftNavigationItemButtonResopnse {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *image = [CallingCameraAndLibrary getImageFromImagePickerControllerWithDict:info];
        [self.uploadView addImageFromCameraAndLibrary:image];
    }];
}

@end
