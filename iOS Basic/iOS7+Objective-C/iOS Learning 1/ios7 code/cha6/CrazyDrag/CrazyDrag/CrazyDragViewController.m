//
//  CrazyDragViewController.m
//  CrazyDrag
//
//  Created by happybubsy on 9/14/13.
//  Copyright (c) 2013 ioslearning. All rights reserved.
//

#import "CrazyDragViewController.h"

@interface CrazyDragViewController (){
    
     int currentValue;
    
}
- (IBAction)sliderMoved:(UISlider*)sender;
@property (strong, nonatomic) IBOutlet UISlider *slider;


- (IBAction)showAlert:(id)sender;
@end

@implementation CrazyDragViewController
@synthesize slider;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    currentValue = self.slider.value;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider*)sender {
 
    currentValue = (int)lroundf(sender.value);
    
}

- (IBAction)showAlert:(id)sender {
    
    NSString *message = [NSString stringWithFormat:@"滑动条的当前数值是:%d",currentValue];
    
    [[[UIAlertView alloc]initWithTitle:@"您好，苍老师" message:message delegate:nil cancelButtonTitle:@"一师是个好学校" otherButtonTitles:nil, nil]show];
    
}
@end
