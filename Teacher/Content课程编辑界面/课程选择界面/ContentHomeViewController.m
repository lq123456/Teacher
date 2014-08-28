//
//  ContentHomeViewController.m
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ContentHomeViewController.h"
#import "oneViewController.h"
@interface ContentHomeViewController ()
@end

@implementation ContentHomeViewController
@synthesize coursebutton;
@synthesize km;
@synthesize m;
@synthesize lablestring;
@synthesize collView;
@synthesize collcell;
@synthesize one=_one ;
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
    [super viewDidDisappear:YES];
    self.navigationController.navigationBarHidden=NO;
    CPTabBarViewController *tab = (CPTabBarViewController *)self.tabBarController;
    tab.customTabBar.hidden = YES;
}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    self.navigationController.navigationBarHidden=YES;
    [super viewDidAppear:YES];
    [UIView animateKeyframesWithDuration:0.25 delay:0.25 options:0 animations:^{
        CPTabBarViewController *tab = (CPTabBarViewController *)self.tabBarController;
        tab.customTabBar.hidden = NO;
    } completion:^(BOOL finished) {
    }];
/*
    if ([m isEqual:@"56"]) {
        
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
            SEL selector = NSSelectorFromString(@"setOrientation:");
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
            [invocation setSelector:selector];
            [invocation setTarget:[UIDevice currentDevice]];
            int val = UIDeviceOrientationPortrait;
            [invocation setArgument:&val atIndex:2];
            [invocation invoke];
        }
    }
    if ([m isEqual:@"78"]) {
  
    }
*/
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

     NSString *s=[NSString  stringWithFormat:@"Couse%d",indexPath.item+1];
     NSLog(@"%@",s);
     _one=[[oneViewController alloc]init];
     [_one Course:s];
     [[self navigationController] pushViewController:_one animated:NO];

    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ContentCell *cell = (ContentCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ContentCell" forIndexPath:indexPath];
    cell.textLable.text=[NSString  stringWithFormat:@"Couse%d",indexPath.item+1];
    cell.imageView.image=[UIImage imageNamed:@"coures_image.png"];
    cell.textLable.font=[UIFont  systemFontOfSize:17];
    return cell;
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectioView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ContentCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(130, 150);
}



- (void)viewDidLoad

{
    [super viewDidLoad];
    [collView registerClass:[ContentCell class] forCellWithReuseIdentifier:@"ContentCell"];
    collView.backgroundView.backgroundColor=nil;
    collView.backgroundColor=[UIColor whiteColor];
    
}

-(void)back
{
    [[self navigationController]  popViewControllerAnimated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
