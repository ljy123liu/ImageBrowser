
//
//  BLTNaviBar.m
//  Baletu
//
//  Created by LIUYONG on 4/21/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "BLTNaviBar.h"
#define DEF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@implementation BLTNaviBar
- (instancetype)initNavibarWithFrame:(CGRect)frame
                               title:(NSString *)title
                       leftItemImage:(NSString *)leftItemImageName
                      rightItemImage:(NSString *)rightItemImageName {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 64)];
        self.backGroundView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backGroundView];
        
        if (title) {
            self.title.text = title;
            [self.backGroundView addSubview:self.title];
        }
        
        if (leftItemImageName) {
            [self.leftNavigationItem setImage:[UIImage imageNamed:leftItemImageName] forState:UIControlStateNormal];
            [self.backGroundView addSubview:self.leftNavigationItem];
            
        }
        
        if (rightItemImageName) {
            [self.rightNavigationItem setImage:[UIImage imageNamed:rightItemImageName] forState:UIControlStateNormal];
            [self.backGroundView addSubview:self.rightNavigationItem];
        }
        
        //底部细线
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, DEF_SCREEN_WIDTH, 1)];
        self.line .backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.line ];
    }
    
    return self;
}

#pragma mark - BNaviBarDelegate
- (void)leftButtonResopnse {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftNavigationItemButtonResopnse)]) {
        [self.delegate leftNavigationItemButtonResopnse];
    }
}

- (void)rightButtonResopnse {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftNavigationItemButtonResopnse)]) {
        [self.delegate rightNavigationItemButtonResopnse];
    }
}



#pragma mark - Setter And Getter
- (UILabel *)title {
    
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake((DEF_SCREEN_WIDTH - 200) / 2, 20, 200, 44)];
        _title.font = [UIFont systemFontOfSize:20];
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

- (UIButton *)leftNavigationItem {
    
    if (!_leftNavigationItem) {
        _leftNavigationItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
        [_leftNavigationItem addTarget:self action:@selector(leftButtonResopnse) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftNavigationItem;
}

- (UIButton *)rightNavigationItem {
    
    if (!_rightNavigationItem) {
        _rightNavigationItem = [[UIButton alloc] initWithFrame:CGRectMake(DEF_SCREEN_WIDTH - 44, 20, 44, 44)];
        [_rightNavigationItem addTarget:self action:@selector(rightButtonResopnse) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightNavigationItem;
}



@end
