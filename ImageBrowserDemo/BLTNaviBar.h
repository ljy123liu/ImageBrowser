//
//  BLTNaviBar.h
//  Baletu
//
//  Created by LIUYONG on 4/21/16.
//  Copyright © 2016 朱 亮亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLTNaviBar;
@protocol BLTNaviBarDelegate <NSObject>
@optional
- (void)leftNavigationItemButtonResopnse;
- (void)rightNavigationItemButtonResopnse;
@end

@interface BLTNaviBar : UIView
@property (nonatomic ,weak) id <BLTNaviBarDelegate> delegate;
@property (nonatomic ,strong) UIButton *leftNavigationItem;
@property (nonatomic ,strong) UIButton *rightNavigationItem;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UIView *line;

- (instancetype)initNavibarWithFrame:(CGRect)frame
                               title:(NSString *)title
                       leftItemImage:(NSString *)leftItemImageName
                      rightItemImage:(NSString *)rightItemImageName;
@end
