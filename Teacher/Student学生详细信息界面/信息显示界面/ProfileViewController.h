//
//  ProfileViewController.h
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (nonatomic,strong) IBOutlet UILabel      *  NameLable;
@property (nonatomic,strong) IBOutlet UILabel      *  ClassLable;
@property (nonatomic,strong) IBOutlet UILabel      *  AgLable;
@property (nonatomic,strong) IBOutlet UILabel      *  EmailLable;
@property (nonatomic,strong) IBOutlet UITextView   *  textView;

@end
