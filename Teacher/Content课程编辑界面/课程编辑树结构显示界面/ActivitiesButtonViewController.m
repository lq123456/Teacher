//
//  ActivitiesButtonViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-5.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ActivitiesButtonViewController.h"

@interface ActivitiesButtonViewController ()

@end

@implementation ActivitiesButtonViewController
@synthesize delegatea;
@synthesize namearry,urlarry;
- (void)viewDidLoad
{
    [super viewDidLoad];


}
-(void)AcName:(NSArray *)name NcUrl:(NSArray *)url
{
//    namearry=name;
//    urlarry=url;
//    [self.tableView reloadData];
}
-(void)Json:(NSDictionary *)dimc
{

    NSDictionary *activities=[dimc  objectForKey:@"activities"];
    namearry=[[NSMutableArray alloc]init];
    urlarry=[[NSMutableArray alloc]init];
    for (NSDictionary *elmeDic  in  activities) {
        NSDictionary *name=[elmeDic  objectForKey:@"name"];
        NSString *English=[name objectForKey:@"English"];
        
        NSDictionary *content=[elmeDic  objectForKey:@"content"];
        NSString *address=[content objectForKey:@"address"];
        [namearry addObject:English];
        [urlarry addObject:address];
    }
    
     [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    if (namearry !=NULL) {
        return [urlarry count];
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (namearry !=NULL) {
            cell.textLabel.text=[namearry objectAtIndex:indexPath.row];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (urlarry !=NULL) {
        NSString *link=[urlarry objectAtIndex:indexPath.row];
        [delegatea AcWepUrl:link];
    }

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
