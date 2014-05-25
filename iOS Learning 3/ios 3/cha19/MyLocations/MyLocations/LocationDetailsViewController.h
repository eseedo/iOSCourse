//
//  LocationDetailsViewController.h
//  MyLocations
//
//  Created by happybubsy on 2/20/14.
//  Copyright (c) 2014 happybubsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationDetailsViewController : UITableViewController

@property(nonatomic,assign) CLLocationCoordinate2D coordinate;
@property(nonatomic,strong) CLPlacemark *placemark;

@end
