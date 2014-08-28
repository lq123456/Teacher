//
//  AssignHomeworkViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-15.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "AssignHomeworkViewController.h"
@interface AssignHomeworkViewController ()
{
    NSMutableArray *mutab;
    NSMutableArray *studentArry;
    NSMutableArray *studentIdArry;
    NSMutableDictionary *mutableDictionary;
    NSArray *ay;
    int k;
    int m;


}
@end
@implementation AssignHomeworkViewController
@synthesize collcell;
@synthesize AScollView;
@synthesize tableClassView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mutableDictionary=[[NSMutableDictionary alloc] init];
    ay=[[NSArray alloc]init];
    mutab=[[NSMutableArray alloc]init];
    studentIdArry=[[NSMutableArray alloc]init];
    
    static NSString *CellIdentifier = @"AssignTableViewCell";
    UINib *nib = [UINib nibWithNibName:@"AssignTableViewCell" bundle:nil];
    [self.tableClassView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    static BOOL nibsRegistered = NO;
    nibsRegistered = YES;

    [self.AScollView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    self.AScollView.backgroundView.backgroundColor=nil;
    self.AScollView.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)Back:(id)sender
{
    [[self navigationController]popViewControllerAnimated:NO];
}
-(IBAction)Assin:(id)sender
{

    [[self navigationController] popToRootViewControllerAnimated:NO];

}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画
{
    self.navigationController.navigationBarHidden=NO;
}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    self.navigationController.navigationBarHidden=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)SetAssignButton:(id)sender
{
    // studentIdArry
    //calss  _classNum
    NSError *error;
    NSDictionary *dict = @{@"command":@"1030", @"type":@"homework",@"content":@{@"course_id":@"2234ljl234j2kl234j2l",@"lesson_id":@"132342aldfkasdflk123",@"homework":self.sutdentMutableArry,@"learners":studentIdArry}};
    NSLog(@"%@",dict);
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
//    NSLog(@"%@",data);
}
//全选
-(IBAction)SetSelsctAllButton:(id)sender
{
    int t=m++;
    if (t%2==0) {
        
        if (k==0) {
            UIAlertView *al=[[UIAlertView alloc]initWithTitle:nil message:@"请选择班级" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [al show];
        }else{
            for (int i=0; i<k; i++) {
                CollectionCell *cell = (CollectionCell *)[self.view viewWithTag:10223+i];
                cell.backgroundColor = [UIColor grayColor];
                cell.textLable.textColor=[UIColor redColor];
            }
        }
    }else
    {
        if (k==0) {
            UIAlertView *al=[[UIAlertView alloc]initWithTitle:nil message:@"请选择班级" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [al show];
        }else{
            for (int i=0; i<k; i++) {
                CollectionCell *cell = (CollectionCell *)[self.view viewWithTag:10223+i];
                cell.backgroundColor = [UIColor whiteColor];
                cell.textLable.textColor=[UIColor blackColor];
            }
        }
    }

}

-(void)ClassMutableArry:(NSMutableArray *)arr
{
   self.sutdentMutableArry=arr;
    [self.tableClassView reloadData];
    [self.AScollView reloadData];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)addImageViewBackColorImage:(int)indextPatn
{
    _classNum=[NSString stringWithFormat:@"%d",indextPatn];
    
    if (indextPatn==0) {
        k=6;
        [self.AScollView reloadData];
    }else if (indextPatn==1){
        k=15;
        [self.AScollView reloadData];
        
    }else if(indextPatn==2){
        
        k=8;
        [self.AScollView reloadData];
        
    }else if (indextPatn==3)
    {
        k=35;
        [self.AScollView reloadData];
    }
}
-(void)removeImageViewBackColorImage:(int)indextPatn
{

    
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    
//    _classNum=[NSString stringWithFormat:@"%d",indexPath.row];
//    
//     if (indexPath.row==0) {
//        k=6;
//        [self.AScollView reloadData];
//     }else if (indexPath.row==1){
//        k=15;
//        [self.AScollView reloadData];
//    
//     }else if(indexPath.row==2){
//    
//        k=8;
//        [self.AScollView reloadData];
//    
//     }else if (indexPath.row==3)
//     {
//        k=35;
//        [self.AScollView reloadData];
//    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AssignTableViewCell";
    AssignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"AssignTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.contentView.backgroundColor=[UIColor clearColor];
    cell.lable.text=[NSString stringWithFormat:@"Class%d",indexPath.row+1];
    cell.buttonItem.tag=indexPath.row;
    cell.celldelegate=self;
    return cell;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return k;
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}
////UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{


}
-(void)Push:(int)indextPatn
{
    
    NSString *string=[NSString stringWithFormat:@"%d",indextPatn];
    [mutableDictionary  setObject:string forKey:[NSString  stringWithFormat:@"%d",indextPatn]];
//    NSLog(@"%@",mutableDictionary);

}
-(void)buttonItemBackColor:(int)indextPatn;
{
    if ([mutableDictionary count]!=0) {
        NSString *string=[NSString stringWithFormat:@"%d",indextPatn];
        [mutableDictionary removeObjectForKey:string];
    }
//    NSLog(@"%@",mutableDictionary);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.imageView.image=[UIImage imageNamed:@"stu_image.png"];
    cell.textLable.text=[NSString stringWithFormat:@"Student%d",indexPath.row+1];
    cell.Pushdelsgat=self;
    cell.buttonItem.tag=indexPath.row;
    return cell;
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectioView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CollectionCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(130, 150);
}
//
@end
