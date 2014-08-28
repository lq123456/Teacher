//
//  NotesViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddNoteDelegate <NSObject>
-(void)removeAddNoteView;
-(void)AddNoteVieweText:(NSString *)text;
@end
@interface NotesViewController : UIViewController<UITextViewDelegate>
@property(nonatomic,assign)id <AddNoteDelegate>Notedelegate;
@property(assign) int indextpah;
@end
