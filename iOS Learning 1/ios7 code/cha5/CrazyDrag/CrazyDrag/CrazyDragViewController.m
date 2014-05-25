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
- (IBAction)sliderMoved:(id)sender;

- (IBAction)showAlert:(id)sender;
@end

@implementation CrazyDragViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    currentValue = 50;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(id)sender {
    UISlider *slider = (UISlider*)sender;
    
    currentValue = (int)lroundf(slider.value);
    
 
   // NSLog(@"滑动条的当前数值是：%f",slider.value);
}

- (IBAction)showAlert:(id)sender {
    
    NSString *message = [NSString stringWithFormat:@"滑动条的当前数值是:%d",currentValue];
    
    [[[UIAlertView alloc]initWithTitle:@"您好，苍老师" message:message delegate:nil cancelButtonTitle:@"一师是个好学校" otherButtonTitles:nil, nil]show];
    
}
@end
