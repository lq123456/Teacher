//
//  CouseStudentViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "CouseStudentViewController.h"
#define firstUrl @"part_0/core.html"
#import "GCDAsyncSocket.h"
@interface CouseStudentViewController ()<GCDAsyncSocketDelegate>


{
    NSMutableArray *Coureaddress;
    NSMutableArray *PareName;
    NSDictionary *weDic;
    NSMutableArray *CoreUrl;
    GCDAsyncSocket * _socket;
    NSDictionary*stuDic;
    int fm;
    UIImageView *backimageview;
    UIAlertView *al;
    NSDictionary *dicmk;
    NSMutableArray *learnerMutableatty;
}
@property (nonatomic,strong)  UIView *newsPageview;
@property(nonatomic,strong) UITextView *textview;
@property(nonatomic,strong) UIButton *shareButton;
@property (nonatomic, assign) BOOL isSocketReady;
@property (strong, nonatomic) NSTimer *timerHearbeat;
@property (nonatomic, assign) BOOL isSocketConnect;
@property (nonatomic, assign) BOOL isSocket;
@property (nonatomic,strong) NSString *activity_orde;
@property (nonatomic,strong) NSString *element_orde;
@property (nonatomic,strong) NSString *part_orde;

@property (nonatomic,strong) UIActivityIndicatorView *acvi;
@property (nonatomic,strong) UIView *vi;
@property (nonatomic,strong) UILabel *joinLable;
@end


@implementation CouseStudentViewController
{
    
    NSMutableArray * note;
    NSMutableArray *PareNmae;
    NSMutableArray *PartNameArry;
    NSMutableArray *PartUrlArry;
    NSMutableArray *AcNameArry;
    NSMutableArray *AcUrlArry;
    NSMutableArray *HomeNameArry;
    NSMutableArray *HomeUrlArry;
    
    NSMutableArray *autablemun;
    NSString *strNOte;
    NSMutableDictionary *nubeDicArry;
    NSString *lett;
    UIButton *bacbutton;
    NSMutableArray *classArry;
    NSArray *elmesArry;
    NSMutableArray *stateArry;
    NSMutableArray * studentarry;
}
@synthesize OrganImageView;
@synthesize newsPageview;
@synthesize wbview;
@synthesize DateString;
@synthesize CouseString;
@synthesize PartString;
@synthesize Partname;
@synthesize Text;
@synthesize NotesImageView;
@synthesize SharNoteView;
@synthesize OrganiztionView;
@synthesize StudentListTableView;
@synthesize erromessagedelegate;
@synthesize studentCell;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画
{
    self.navigationController.navigationBarHidden=NO;
}
-(void)PromptView
{
    _vi=[[UIView alloc]init];
    _vi.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _vi.alpha=0.9;
    _vi.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_vi];
    _acvi=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _acvi.center=CGPointMake(200.f, 200.f);
    _acvi.backgroundColor=[UIColor clearColor];
    _acvi.frame=CGRectMake(430, 100, 200, 200);
    [_vi addSubview:_acvi];
    [_acvi startAnimating];
    _joinLable=[[UILabel alloc]init];
    _joinLable.text=@"In the land........";
    _joinLable.font=[UIFont systemFontOfSize:30];
    _joinLable.textColor=[UIColor darkGrayColor];
    _joinLable.backgroundColor=[UIColor clearColor];
    _joinLable.frame=CGRectMake(450,200,_vi.frame.size.width-400, 100);
    [_vi addSubview:_joinLable];
}
-(void)addtableview
{
    UIActivityIndicatorView *acvi=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    acvi.center=CGPointMake(100.f, 100.f);
    acvi.backgroundColor=[UIColor clearColor];
    acvi.frame=CGRectMake(5, 150, 100, 100);
    acvi.tag=2001221;
    [self.StudentListTableView addSubview:acvi];
    [acvi startAnimating];



}
-(void)remov
{
    [_vi removeFromSuperview];
    [_acvi stopAnimating];
    [_joinLable removeFromSuperview];
}
-(void)tableremove
{

    UIActivityIndicatorView *acvi=(UIActivityIndicatorView *)[self.view viewWithTag:2001221];
    
    [acvi stopAnimating];
    [acvi removeFromSuperview];

}
- (void)viewDidLoad
{
    static NSString *CellIdentifier = @"CouseStudentTableViewCell";
    UINib *nib = [UINib nibWithNibName:@"CouseStudentTableViewCell" bundle:nil];
    [self.StudentListTableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    static BOOL nibsRegistered = NO;
    nibsRegistered = YES;
    
//    [self PromptView];
    [self addtableview];
    
    stateArry=[[NSMutableArray alloc]init];
    nubeDicArry=[[NSMutableDictionary alloc]init];
    stuDic=[[NSDictionary alloc] init];
    classArry=[[NSMutableArray alloc]init];
    tm=0;
    [self JsonObject];
    [self learnersJson];
    [self NoteImageView];
    [self OrganizationView];
    [self wepUrl:firstUrl number:0];
    [super viewDidLoad];
}
-(void)learnersJson
{
    NSError *error;
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"learners_1.json"];
    NSData *date=[NSData dataWithContentsOfFile:path options:NSUTF8StringEncoding error:&error];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
    learnerMutableatty=[dic objectForKey:@"learners"];
//    NSLog(@"%@",learnerMutableatty);
}
-(void)SocketIp:(NSString *)ipString
{
    NSLog(@"%@",ipString);
    //创建socket
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    //进行连接
    NSLog(@"%@--%d",CPiWBIPAddress,CPIWB_PORT);
    NSError *error;
    if (![_socket connectToHost:ipString onPort:CPIWB_PORT error:&error]) {
        NSLog(@"connectToHostError:%@", error.localizedDescription);
    } else {
        //    NSLog(@"socket连接成功");
        [self listen];
    }
}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    [super viewDidAppear:YES];
    self.navigationController.navigationBarHidden=YES;
}
//心跳
- (void)listen
{
    self.timerHearbeat = [NSTimer scheduledTimerWithTimeInterval:10
                                                          target:self
                                                        selector:@selector(fireTimer) userInfo:nil
                                                         repeats:YES];
    [self.timerHearbeat fire];
}
- (void)fireTimer
{
    //判断  已经连接之后就开始这下一步
    if (self.isSocketConnect) {
        //已经建立连接告诉IWB我在线
        // {“command”:”1003”, “type”:”learner”, “account”:”Alice”, “password”:”xxxx”}
        NSDictionary *dict = @{@"command":@"1003", @"type":@"tutor", @"account": @"Laurie", @"password": @"asda"};
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:&error];
        if (error) {
            NSLog(@"MainVC-fireTimer-error:%@",error);
        }
        NSLog(@"发送HeartBeat!");
        //发送数据
        self.isSocket=NO;
        [_socket writeData:data withTimeout:-1 tag:0];
        //读数据****（从IWB上获得的数据）
    }
    
}
//已经建立连接之后开始这一步login
#pragma mark - GCDAsyncSocketDelegate//如果连接成功self.isSocketConnect = YES
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    self.isSocketConnect = YES;
    // 长连接建立完成后，给服务器发送 account:昵称 通知服务器用户登录
    
    NSDictionary *dict = @{@"command":@"1001", @"type":@"tutor", @"account":@"Laurie", @"password":@"dsa"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    // 将数据写入到输出流，告诉服务器用户登录***同时发送登陆数据
    [_socket writeData:data withTimeout:-1 tag:12];
    [_socket readDataWithTimeout:-1 tag:19];
}
-(void)classStuden
{
    studentarry=[[NSMutableArray alloc] init];
    for (NSDictionary *d in nubeDicArry) {
        NSMutableDictionary *onlinedic=[[NSMutableDictionary alloc]init];
        NSMutableDictionary *offlinedic=[[NSMutableDictionary alloc]init];
        NSString *string=[ d objectForKey:@"learner"];
        NSString *str=[d objectForKey:@"state"];
        if ([str isEqualToString:@"offline"]) {
            [onlinedic setObject:string forKey:@"learner"];
            [onlinedic setObject:str forKey:@"state"];
            [studentarry addObject:onlinedic];
        }if ([str isEqualToString:@"online"]) {
            NSString *st=@"oaline";
            [offlinedic setObject:string forKey:@"learner"];
            [offlinedic setObject:st forKey:@"state"];
            [studentarry addObject:offlinedic];
        }
    }
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"state" ascending:YES]];
    [studentarry sortUsingDescriptors:sortDescriptors];
//    NSLog(@"%@",studentarry);
    [self.StudentListTableView  reloadData];
}
//当数据发送成功之后 就会这一项
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    if (tag==12) {
        [_socket readDataWithTimeout:-1 tag:13];
        //心跳判断是否在线
        NSLog(@"------------在线---------");
    }
}
//从服务器获得数据（IWB）进行判断如果dict字典里面的state等于success的时候就登陆成功
//同时IWB向老师端发送指令 老师端接收指令同时也是调用这个方法
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    double best=0.1;
    dispatch_time_t popTime=dispatch_time(DISPATCH_TIME_NOW, (int64_t)(best *NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_socket readDataWithTimeout:-1 tag:16];
    });
    // {“command”:”1001”, “state”:”success”}
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:&error];
    if (tag==16) {
        //心跳返回数据
        if([dict[@"command"] isEqualToString:@"1022"]){
            NSLog(@"%@",dict);
            //        NSLog(@"实时跟新学生在线状态");
            double best=0.1;
            dispatch_time_t popTime=dispatch_time(DISPATCH_TIME_NOW, (int64_t)(best *NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                //NSLog(@"开始解析数据：%@",dict);
                nubeDicArry=[dict objectForKey:@"status"];
                [self classStuden];
            });
        }
    }
    if (tag==19) {
        if ([dict[@"state"] isEqualToString:@"success"]) {
//            double best=0.1;
//            dispatch_time_t popTime=dispatch_time(DISPATCH_TIME_NOW, (int64_t)(best *NSEC_PER_SEC));
           dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//                //NSLog(@"开始解析数据：%@",dict);
//                [self remov];
            });
            //登录成功,电子白板向教师端 app 发送: {“command”:”1001”, “state”:”success”}
            NSLog(@"1-----------登陆成功");
        }
    }
    if (tag==16) {
        if([dict[@"command"]isEqualToString:@"1021"])
        {
            NSLog(@"开始解析数据：%@",dict);
            NSString *activity=dict[@"activity order"];
            NSString *element=dict[@"element order"];
            NSString *part=dict[@"part order"];
            if ([activity isEqualToString:@""]) {
                _activity_orde=NULL;
            }else{
                _activity_orde=activity;
            }
            if ([element isEqualToString:@""]){
                _element_orde=NULL;
            }else{
                _element_orde=element;
            }
            if ([part isEqualToString:@""]) {
                _part_orde=NULL;
            }else{
                _part_orde=part;
            }
            [self  JsonDate:_part_orde Element:_element_orde Activities:_activity_orde];
        }
    }
    if (error!=nil) {
    }
}
-(void)JsonDate:(NSString *)Part Element:(NSString *)element Activities:(NSString *)activities
{
    //   NSLog(@"1-----%@2-----%@3------%@",Part,element,activities);
    NSError *error;
    //==Json文件路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:@"JsonFile.json"];
    //    NSLog(@"%@",Json_path);
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject
    id JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    NSMutableArray *urlarry=[JsonObject objectForKey:@"parts"];
    NSDictionary *core=[urlarry objectAtIndex:[Part integerValue]];
//    NSLog(@"-------------%@",core);
    NSMutableArray *elements=[core objectForKey:@"elements"];
    NSMutableArray *activi=[core objectForKey:@"activities"];
    if (Part!=nil) {
        if (element!=NULL) {
            NSLog(@"elements-0-------%@",elements);
            if ([element integerValue]>[elements count]) {
                
            }else{
                NSDictionary *order=[elements  objectAtIndex:[element integerValue]-1];
                NSString *address=[order objectForKey:@"address"];
                [self WepUrl:address];
            }
            
        }else if (activities!=NULL){
            NSLog(@"activities-0-------%@",activi);
            if ([activities integerValue]>[activi count]) {
                
            }else{
                NSDictionary *order=[[activi  objectAtIndex:[activities integerValue]-1] objectForKey:@"content"];
                NSString *address=[order objectForKey:@"address"];
                [self WepUrl:address];
            }
        }else{
            NSDictionary *fic=[core objectForKey:@"core"];
            NSString *address=[fic objectForKey:@"address"];
            NSLog(@"%@",address);
            [self wepUrl:address number:[Part integerValue]];
        }
    }
}
//点击分享
-(void)removeSharNoteView
{
    NotesImageView.hidden=YES;
}
-(void)removeOrganView
{
    OrganImageView.hidden=YES;
}
//点击分享
-(void)SharNoteVieweText:(NSString
                          *)text
{
    NSString *sst=[NSString stringWithFormat:@"%d",tm];
    NSError *error;
    NSDictionary *dict = @{@"command":@"1030", @"type":@"note",@"content":@{@"course_id":@"2234ljl234j2kl234j2l",@"lesson_id":@"132342aldfkasdflk123",@"part_id":sst,@"note":text}};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   options:0
                                                     error:&error];
    // 将数据写入到输出
    [_socket writeData:data withTimeout:-1 tag:0];
}
-(void)OrganizationView
{
    OrganImageView=[[UIImageView alloc]init];
    OrganImageView.backgroundColor=[UIColor grayColor];
    OrganImageView.frame=self.view.bounds;
    OrganImageView.alpha=0.8;
    OrganImageView.userInteractionEnabled=YES;
    [self.view addSubview:OrganImageView];
    //*********************
    OrganiztionView=[[OrganViewController alloc]init];
    [OrganiztionView PartNameArry:PartNameArry PartUrlArry:PartUrlArry AcNameArry:AcNameArry AcUrlArry:AcUrlArry Part:PareNmae];
    OrganiztionView.Organdelegate=self;
    OrganiztionView.view.frame=CGRectMake(247, 119, 700, 500);
    [OrganImageView addSubview:OrganiztionView.view];
    OrganImageView.hidden=YES;
}
-(void)NoteImageView
{
    NotesImageView=[[UIImageView alloc]init];
    NotesImageView.backgroundColor=[UIColor grayColor];
    NotesImageView.frame=self.view.bounds;
    NotesImageView.alpha=0.8;
    NotesImageView.userInteractionEnabled=YES;
    [self.view addSubview:NotesImageView];
    //**********
    SharNoteView=[[SharNoteViewController alloc]init];
    SharNoteView.view.frame=CGRectMake(247, 119, 700, 500);
    SharNoteView.Shardelegate=self;
    [NotesImageView addSubview:SharNoteView.view];
    NotesImageView.hidden=YES;
}
-(void)JsonObject
{
    NSError *error;
    //==Json文件路径
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:@"Json.json"];
    //    NSLog(@"%@",Json_path);
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject
    
    id JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
//    NSLog(@"%@",JsonObject);
    
    id JsonParts=[JsonObject objectForKey:@"parts"];
//    NSLog(@"%@",JsonParts);
    
    note=[[NSMutableArray alloc]init];
    PartUrlArry=[[NSMutableArray alloc]init];
    PartNameArry=[[NSMutableArray alloc]init];
    AcNameArry=[[NSMutableArray alloc]init];
    AcUrlArry=[[NSMutableArray alloc]init];
    CoreUrl=[[NSMutableArray alloc] init];
    PareNmae=[[NSMutableArray alloc]init];
    for (NSDictionary *ob in JsonParts)
    {
        NSDictionary *name=[ob objectForKey:@"name"];
        NSString *sreing=[name objectForKey:@"English"];
        NSDictionary *co=[ob objectForKey:@"core"];
        NSString *dress=[co objectForKey:@"address"];
        NSMutableArray *coredress=[[NSMutableArray alloc]init];
        [coredress addObject:dress];
        [CoreUrl addObject:dress];
        NSMutableArray*mu=[[NSMutableArray alloc]init];
        NSString *stringaddress=@" Core";
        [mu addObject:stringaddress];
        NSDictionary *elements=[ob objectForKey:@"elements"];
        for (NSDictionary *dicm  in elements) {
            NSDictionary *elementename=[dicm objectForKey:@"name"];
            NSString *s=[elementename objectForKey:@"English"];
            NSString *Elementstring=[dicm objectForKey:@"address"];
            [mu addObject:s];
            [coredress addObject:Elementstring];
        }
        NSString *no=[ob objectForKey:@"note"];
        [note addObject:no];
        NSDictionary *activities=[ob objectForKey:@"activities"];
        NSMutableArray *acti=[[NSMutableArray alloc]init];
        NSMutableArray *actiadress=[[NSMutableArray alloc]init];
        for (NSDictionary *ac in activities) {
            NSDictionary *activitiesname=[ac objectForKey:@"name"];
            NSString *mm=[activitiesname objectForKey:@"English"];
            NSDictionary *dress=[ac objectForKey:@"content"];
            NSString *s=[dress objectForKey:@"address"];
            [acti addObject:mm];
            [actiadress addObject:s];
        }
        [PartNameArry addObject:mu];
        [PartUrlArry addObject:coredress];
        [AcUrlArry addObject:actiadress];
        [AcNameArry addObject:acti];
        [PareNmae addObject:sreing];
    }
}
-(IBAction)Organiztaionbutton:(id)sender
{
    OrganImageView.hidden=NO;
}
-(IBAction)Notesbutton:(id)sender
{
    if ([strNOte length]==0) {
        [self SharNoteTextView:0 nss:nil];
    }else{
        [self SharNoteTextView:k nss:strNOte];
    }
}
-(void)SharNoteTextView:(int)num nss:(NSString *)not
{
    if (not==nil) {
        NotesImageView.hidden=NO;
        NSString *t=[note objectAtIndex:0];
        //        NSLog(@"%@",t);
        SharNoteView.textView.text=t;
    }else{
        NSString *t=[note objectAtIndex:num];
        if ([t length]==0) {
            UIAlertView *am=[[UIAlertView alloc]initWithTitle:nil
                                                      message:@"The festival does not note"
                                                     delegate:self
                                            cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [am show];
        }else{
            SharNoteView.textView.text=t;
            NotesImageView.hidden=NO;
        }
    }
}
-(IBAction)back:(id)sender
{
    [_socket disconnect];
    [[self navigationController] popToRootViewControllerAnimated:NO];
}
-(void)wepLink:(NSString *)string
{
    // 获取程序Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",string]];
    [wbview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}
-(void)wepUrl:(NSString *)string number:(int)num
{
    NSLog(@"%d",num);
    tm=num;
    // 获取程序Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",string]];
    [wbview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
    
    //    NSString *sr=[NSString stringWithFormat:@"%d",num];
    //    NSLog(@"1-----%@",sr);
    
}
-(void)WepUrl:(NSString *)url
{
    // 获取程序Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",url]];
    //    NSLog(@"%@",path);
    [wbview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
    OrganImageView.hidden=YES;
}
-(void) OrganContetswich:(int)indextpah
{
    tm=indextpah;
    k=indextpah;
    strNOte=[NSString stringWithFormat:@"%d",indextpah];
}

-(void)Contetelement:(NSArray *)url element:(int)number part:(int)partnumber
{
    
    elmesArry=url;
    element_order=number;
    part_order=partnumber;
    /*
    NSLog(@"-----%d----%d---",partnumber,number);
    //{“command”:”1023”, “part order”:”1”, “reference order”:””, “element order”:””, “activity order”:””}
    NSError *error;
    NSDictionary *dict = @{@"command":@"1023", @"part order":[NSString  stringWithFormat:@"%d",partnumber],@"element order":[NSString  stringWithFormat:@"%d",number],@"reference order":@"",@"activity order":@""};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   options:0
                    
                    
                                                     error:&error];
    NSLog(@"%@",data);
    // 将数据写入到输出
    [_socket writeData:data withTimeout:-1 tag:0];
    */
}
-(void)Activities:(int)oder part:(int)der
{
    /*
    NSError *error;
    NSDictionary *dict = @{@"command":@"1023", @"part order":[NSString  stringWithFormat:@"%d",der],@"element order":@"",@"reference order":@"",@"activity order":[NSString  stringWithFormat:@"%d",oder]};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   options:0
                                                     error:&error];
    // 将数据写入到输出
    [_socket writeData:data withTimeout:-1 tag:0];
     */
}
-(void)Homeworkoder:(int)oder
{
    
    /*    NSError *error;
        NSDictionary *dict = @{@"command":@"1023", @"part order":[NSString  stringWithFormat:@"%d",der],@"element order":[NSString  stringWithFormat:@"%d",oder],@"reference order":@"",@"activity order":@""};
       NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:&error];
       // 将数据写入到输出
        [_socket writeData:data withTimeout:-1 tag:0];
     */
    
}
-(IBAction)Next:(id)sender
{
    int f=tm++;
    int nub=f+1;
    if (nub>=[CoreUrl count]) {
        UIAlertView *af=[[UIAlertView alloc]initWithTitle:nil message:@"The last section" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [af show];
        tm=[CoreUrl count]-1;
    }else{
        NSLog(@"%@",sender);
        NSString *url=[CoreUrl objectAtIndex:nub];
        //        NSLog(@"1---------%@",url);
        [self wepLink:url];
        [self wepUrl:url number:nub];
        NSError *error;
        NSDictionary *dict = @{@"command":@"1023", @"part order":[NSString  stringWithFormat:@"%d",nub],@"element order":@"",@"reference order":@"",@"activity order":@""};
        NSLog(@"%@",dict);
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                        
                        
                                                         error:&error];
        // 将数据写入到输出
        [_socket writeData:data withTimeout:-1 tag:0];
        k=nub;
        strNOte=[NSString stringWithFormat:@"%d",nub];
    }
    
}
-(IBAction)Prev:(id)sender
{
    int w=tm--;
    int num=w-1;
    if (num==-1) {
        UIAlertView *ak=[[UIAlertView alloc]initWithTitle:nil message:@"Is already in the first quarter" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [ak show];
        tm=0;
    }else{
        
        NSLog(@"%d",num);
        NSString *url=[CoreUrl objectAtIndex:num];
        [self wepUrl:url number:num];
        NSError *error;
        NSDictionary *dict = @{@"command":@"1023", @"part order":[NSString  stringWithFormat:@"%d",num],@"element order":@"",@"reference order":@"",@"activity order":@""};
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                        
                        
                                                         error:&error];
        NSLog(@"%@",dict);
        // 将数据写入到输出
        [_socket writeData:data withTimeout:-1 tag:0];
        k=num;
        strNOte=[NSString stringWithFormat:@"%d",num];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)OrganViewNoteVieweText:(NSString *)text
{
    
    
    
}
#pragma StudentListTableView
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([studentarry count]==0) {
        return [learnerMutableatty count];
    }else{
        
        return [studentarry count];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CouseStudentTableViewCell";
    CouseStudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"CouseStudentTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        //        nibsRegistered = YES;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryNone;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    if ([studentarry count]!=0) {
        cell.studentName.text=[[studentarry objectAtIndex:indexPath.row] objectForKey:@"learner"];
        NSString *str=[[studentarry objectAtIndex:indexPath.row] objectForKey:@"state"];
        if ([str isEqualToString:@"offline"]) {
            cell.studentImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@1_2.png",[[studentarry objectAtIndex:indexPath.row] objectForKey:@"learner"]]];
        }else{
            cell.studentImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@1.png",[[studentarry objectAtIndex:indexPath.row] objectForKey:@"learner"]]];
            [self  tableremove];
        }
    }
    if ([studentarry count]==0) {
        cell.studentName.text=[[learnerMutableatty objectAtIndex:indexPath.row]objectForKey:@"name"];
         cell.studentImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@1_2.png",[[learnerMutableatty objectAtIndex:indexPath.row] objectForKey:@"name"]]];
    }
     return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSString *link=[urlarry objectAtIndex:indexPath.row];
    //    [delegateurl Homelink:link];
}


@end
