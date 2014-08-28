//
//  CPTabBarView.m
//  Learner Kit
//
//  Created by Wade on 14-8-7.
//  Copyright (c) 2014年 itcast1. All rights reserved.
//

#import "CPTabBarView.h"
#import "CPTabBarButton.h"

@interface CPTabBarView()
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) CPTabBarButton *selectedTabBarButton;
@end

@implementation CPTabBarView
- (NSMutableArray *)tabBarButtons
{
    if (!_tabBarButtons) {
        self.tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


- (void)addTabBarButton:(UITabBarItem *)item
{
    // 创建按钮
    CPTabBarButton *button = [[CPTabBarButton alloc] init];
    [button setTitle:item.title forState:UIControlStateNormal];
    [button setImage:item.image forState:UIControlStateNormal];
    [button setImage:item.selectedImage forState:UIControlStateSelected];
    [button addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    button.tag = self.tabBarButtons.count;
    
    [self addSubview:button];
    
    // 加到数组中
    [self.tabBarButtons addObject:button];
    if (self.tabBarButtons.count == 1) {
        [self tabBarButtonClick:button];
    }
}

/**
 *  点击选项卡按钮
 */
- (void)tabBarButtonClick:(CPTabBarButton *)button
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        int from = self.selectedTabBarButton.tag;
        int to = button.tag;
        [self.delegate tabBar:self didSelectButtonFrom:from to:to];
    }
    
    // 更改按钮状态
    self.selectedTabBarButton.selected = NO;
    button.selected = YES;
    self.selectedTabBarButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 2.设置选项卡按钮的位置和尺寸
    [self setupTabBarButtonFrame];
}

/**
 *  设置选项卡按钮的位置和尺寸
 */
- (void)setupTabBarButtonFrame
{
    int count = self.tabBarButtons.count;
    for (int i = 0; i < count; i++) {
        UIButton *button = self.tabBarButtons[i];
        if (i == 0) {
            button.y = 0;
        }
        else
        {
        button.x = (100 + 60) * i ;
        }
        button.y = 0;
    }
}
@end
