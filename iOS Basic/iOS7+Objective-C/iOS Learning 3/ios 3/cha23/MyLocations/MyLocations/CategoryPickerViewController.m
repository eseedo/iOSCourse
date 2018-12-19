//
//  CategoryPickerViewController.m
//  MyLocations
//
//  Created by Wang Han on 3/13/14.
//  Copyright (c) 2014 happybubsy. All rights reserved.
//

#import "CategoryPickerViewController.h"


@implementation CategoryPickerViewController{
    
    NSArray *_categories;
    NSIndexPath *_selectedIndexPath;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    _categories = @[
                    @"No Category",
                    @"Apple Store",
                    @"Bar",
                    @"BookStore",
                    @"Club",
                    @"Grocery Store",
                    @"Historic Building",
                    @"House",
                    @"Icecream Vendor",
                    @"Landmark",
                    @"Park"
                    ];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_categories count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSString *categoryName = _categories[indexPath.row];
    
    cell.textLabel.text = categoryName;
    
    if([categoryName isEqualToString:self.selectedCategoryName]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row != _selectedIndexPath.row){
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:_selectedIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        _selectedIndexPath = indexPath;
    }
}


#pragma mark -segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"PickedCategory"]){
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        self.selectedCategoryName = _categories[indexPath.row];
    }
}

@end
