//
//  ImagesBrowserViewController.m
//  Baletu
//
//  Created by LIUYONG on 16/6/3.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "ImagesBrowserViewController.h"
#import "BLTNaviBar.h"
#import "UploadImagesBrowserView.h"
#import "ImageBrowserCell.h"
#define DEF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ImagesBrowserViewController () <BLTNaviBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) BLTNaviBar *navBar;
@end

static NSString * const identifier = @"collectionView";
@implementation ImagesBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self createUI];
    [self.view addSubview:self.navBar];
    self.navigationController.navigationBar.hidden = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideNavBar)];
    [self.view addGestureRecognizer:tap];
}

- (void)createUI {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 0;
//    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT - 64);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    collectionView.contentOffset = CGPointMake(DEF_SCREEN_WIDTH * self.imageIndex, 64);
    [collectionView registerClass:[ImageBrowserCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:collectionView];
    

}

#pragma mark - EventsResponses
- (void)hideNavBar {
    if (self.navBar.frame.origin.y == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.navBar.transform = CGAffineTransformMakeTranslation(0, -64);
        }];
    }else {
        [UIView animateWithDuration:0.5 animations:^{
            self.navBar.transform = CGAffineTransformIdentity;
        }];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imagesArray.count;
}
#pragma mark - UICollectionViewDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imageView.image = self.imagesArray[indexPath.row];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.imageIndex = scrollView.contentOffset.x /DEF_SCREEN_WIDTH;
    self.navBar.title.text = [NSString stringWithFormat:@"%ld/%lu",(long)self.imageIndex+1,(unsigned long)self.imagesArray.count];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BLTNaviBarDelegate
- (void)leftNavigationItemButtonResopnse {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightNavigationItemButtonResopnse {
    [self.uploadView.images removeObjectAtIndex:self.imageIndex];
    [self.uploadView setNeedsLayout];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Setter And Getter
- (BLTNaviBar *)navBar {
    if (!_navBar) {
        _navBar = [[BLTNaviBar alloc] initNavibarWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 64) title:@"图片浏览器" leftItemImage:@"3fanhui" rightItemImage:@"白色删除按钮.png"];
        _navBar.delegate = self;
        _navBar.line.hidden = YES;
        _navBar.backGroundView.backgroundColor = [UIColor clearColor];
        _navBar.title.textColor = [UIColor whiteColor];
        _navBar.title.text = [NSString stringWithFormat:@"%ld/%lu",(long)self.imageIndex+1,(unsigned long)self.imagesArray.count];
    }
    return _navBar;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
