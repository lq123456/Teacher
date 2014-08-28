//
//  CouseStudentViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContetOrganiztionViewController.h"
#import "HomeWorkOrganitzitionViewController.h"
#import "ActivitiesOrganiztonViewController.h"
#import "SharNoteViewController.h"
#import "OrganViewController.h"
#import "CouseStudentTableViewCell.h"
@protocol messagedelegate <NSObject>
-(void)erroMessage:(NSString *)err;
-(void)iperro:(NSString *)err;
@end
@interface CouseStudentViewController : UIViewController<UITextViewDelegate,UIWebViewDelegate,SharNoteDelegate,OrganViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    int k;
    int TB;
    BOOL  selectBT;
    BOOL  BT;
    int tm;
    int element_order;
    int part_order;
    int activity_order;
    int reference_order;
}
@property (nonatomic,strong) CouseStudentTableViewCell *studentCell;
@property(nonatomic,assign) id<messagedelegate>erromessagedelegate;
@property (nonatomic,strong)  IBOutlet UITableView           * StudentListTableView;
@property (nonatomic ,strong) IBOutlet UIWebView             * wbview;
@property (nonatomic ,strong) UIImageView                    * OrganImageView;
@property (nonatomic,strong)  UIImageView                     * NotesImageView;
@property (nonatomic ,strong) SharNoteViewController         * SharNoteView;
@property (nonatomic ,strong) OrganViewController            * OrganiztionView;
@property (nonatomic,strong)  NSString                       * DateString;
@property (nonatomic,strong)  NSString                       * CouseString;
@property (nonatomic,strong)  NSString                       * PartString;
@property (nonatomic,strong)  NSString                       * Partname;
@property (nonatomic,strong)  NSString                       * Text;

-(IBAction)back:(id)sender;
-(IBAction)Next:(id)sender;
-(IBAction)Prev:(id)sender;
-(void)SocketIp:(NSString *)ipString;

@end
