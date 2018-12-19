//
//  AllListsViewController.h
//  Checklists
//
//  Created by Matthijs on 02-10-13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate>


-(void)saveChecklists;


@end
