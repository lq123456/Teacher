//
//  AppDelegate.h
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITextFieldDelegate,UITabBarDelegate,UITabBarControllerDelegate,Logindelegat>
@property (strong, nonatomic) LinViewController *login;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIView *view;
-(void)homeView;
@end
