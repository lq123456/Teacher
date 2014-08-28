//
//  AddNoteTextView.h
//  Teacher
//
//  Created by CollegePre on 14-8-6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol delegateTEXT <NSObject>
-(void)textString:(NSString *)text edit:(int)k;
-(void)buttonhidden;
-(void)judge:(NSString *)string;
@end
@interface AddNoteTextView : UIView<UITextViewDelegate,UIAlertViewDelegate>
@property(nonatomic,assign)id <delegateTEXT>delegateTEXT;
@property(nonatomic,strong)NSString *string;

@end
