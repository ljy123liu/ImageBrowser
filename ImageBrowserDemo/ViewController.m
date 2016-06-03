//
//  ViewController.m
//  ImageBrowserDemo
//
//  Created by LIUYONG on 16/6/3.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "ViewController.h"
#import "UploadImageViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    [button setTitle:@"相册浏览器" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick {
    UploadImageViewController *upload = [UploadImageViewController new];
    [self.navigationController pushViewController:upload animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
