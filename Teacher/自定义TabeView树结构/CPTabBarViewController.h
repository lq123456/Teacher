//
//  CPTabBarViewController.h
//  Learner Kit
//
//  Created by Wade on 14-8-7.
//  Copyright (c) 2014年 itcast1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTabBarView.h"
@class CPTabBarView;
@interface CPTabBarViewController : UITabBarController
@property (nonatomic,strong) CPTabBarView * customTabBar;
@end
