//
//  ShowTexeView.h
//  Teacher
//
//  Created by CollegePre on 14-8-7.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol showdelegate <NSObject>
-(void)Newcoust:(NSString *)couse  Newpart:(NSString *)part  Newnote:(NSString *)note removew:(NSString *)remove;
-(void)removeShowView;
@end
@interface ShowTexeView : UIView<UITextViewDelegate>
@property (nonatomic,strong) NSString *Couse;
@property (nonatomic,strong) NSString *Part;
@property (nonatomic,strong) NSString *Note;
@property (nonatomic,strong) NSString *removeNote;

@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UIButton *saveButton;
@property (nonatomic,strong) UIButton *RemoveButton;
@property(nonatomic,assign)id <showdelegate>showdelegate;
-(void)shoewTextViewtext:(NSString *)couse Part:(NSString *)pare  Note:(NSString *)note;
@end
