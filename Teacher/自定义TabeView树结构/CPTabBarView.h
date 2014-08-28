//
//  CPTabBarView.h
//  Learner Kit
//
//  Created by Wade on 14-8-7.
//  Copyright (c) 2014年 itcast1. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPTabBarView;

@protocol CPTabBarViewDelegate <NSObject>
@optional
- (void)tabBar:(CPTabBarView *)tabBar didSelectButtonFrom:(int)from to:(int)to;
@end

@interface CPTabBarView : UIView

@property (nonatomic, weak) id<CPTabBarViewDelegate> delegate;
//@property (nonatomic, assign)  BOOL hidden;

- (void)addTabBarButton:(UIBarItem *)item;
@end
