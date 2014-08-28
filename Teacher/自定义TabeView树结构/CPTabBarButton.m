//
//  CPTarBarButton.m
//  Learner Kit
//
//  Created by Wade on 14-8-7.
//  Copyright (c) 2014年 itcast1. All rights reserved.
//

#import "CPTabBarButton.h"

@implementation CPTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.size = CGSizeMake(100, 100);
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(9, 0, 100,100);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 102, 118, 18);
}

- (void)setHighlighted:(BOOL)highlighted { }


@end
