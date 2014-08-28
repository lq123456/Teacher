//
//  SharNoteViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SharNoteDelegate <NSObject>
-(void)removeSharNoteView;
-(void)SharNoteVieweText:(NSString *)text;
@end
@interface SharNoteViewController : UIViewController<UITextViewDelegate>
@property(nonatomic,strong) IBOutlet UITextView *textView;
@property(nonatomic,assign)id <SharNoteDelegate>Shardelegate;
@end
