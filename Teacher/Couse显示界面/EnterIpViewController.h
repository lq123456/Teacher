//
//  EnterIpViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol IPdelegate <NSObject>
-(void)IPString:(NSString *)ip;
@end
@interface EnterIpViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
@property (nonatomic,strong) IBOutlet UITextField *texfield;
@property (nonatomic,strong) NSString *IPsing;
@property(nonatomic,assign) id<IPdelegate>delegate;
@property (nonatomic,strong) UIAlertView *AlView;

@end
