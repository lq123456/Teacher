//
//  LinViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-8.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol Logindelegat <NSObject>
-(void)loginHome;
@end
@interface LinViewController : UIViewController<UITextFieldDelegate>
-(IBAction)Login:(id)sender;
-(IBAction)forgot:(id)sender;
@property (nonatomic,strong) IBOutlet UITextField *Username;
@property (nonatomic,strong) IBOutlet UITextField *Password;

@property (nonatomic,assign) id <Logindelegat> Login;

@end
