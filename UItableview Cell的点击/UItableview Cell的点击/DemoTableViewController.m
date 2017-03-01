//
//  DemoTableViewController.m
//  UItableview Cell的点击
//
//  Created by apple on 28/2/17.
//  Copyright © 2017年 mark. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DDSectionModel.h"
#import "DDTableViewHeader.h"
#import "MoreTableViewCell.h"
#import "UIColor+Extension.h"

@interface DemoTableViewController ()


@property (nonatomic,strong) NSArray<DDSectionModel *> *dataSource;

@end

@implementation DemoTableViewController


- (NSArray *)dataSource{

    if (!_dataSource) {
        
        _dataSource = [[NSArray alloc] init];
    }
    
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [DDSectionModel loadData:^(NSArray *models) {
       
        self.dataSource = models;
        
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource[section].isExpanded ? (self.dataSource[section].cellModels.count) : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellID"];
    
    if (!cell) {
        
        cell = [[MoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCellID"];
    }
    cell.cellModel = self.dataSource[indexPath.section].cellModels[indexPath.row];
    // 实际开发中不要这样设置
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    cell.contentView.layer.borderColor = [UIColor defaultColor].CGColor;
    cell.contentView.layer.borderWidth = 0.5;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
 
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    DDTableViewHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    if (!headerView) {
        headerView = [[DDTableViewHeader alloc] initWithReuseIdentifier:@"header"];
    }
    headerView.sectionModel = self.dataSource[section];
    headerView.HeaderClickedBack = ^(BOOL isExpand){
    
        [tableView reloadSections:[[NSIndexSet alloc] initWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    
    return  headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return  50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return  50;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
