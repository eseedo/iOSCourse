//
//  FirstViewController.h
//  MyLocations
//
//  Created by happybubsy on 1/23/14.
//  Copyright (c) 2014 happybubsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentLocationViewController : UIViewController

@property(nonatomic,weak) IBOutlet UILabel *messageLabel;
@property(nonatomic,weak) IBOutlet UILabel *latitudeLabel;
@property(nonatomic,weak) IBOutlet UILabel *longtitudeLabel;
@property(nonatomic,weak) IBOutlet UILabel *adderssLabel;
@property(nonatomic,weak) IBOutlet UIButton *tagButton;
@property(nonatomic,weak) IBOutlet UIButton *getButton;

-(IBAction)getLocation:(id)sender;

@end
