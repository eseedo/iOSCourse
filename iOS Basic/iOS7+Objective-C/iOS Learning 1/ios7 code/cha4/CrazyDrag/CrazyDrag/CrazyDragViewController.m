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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(id)sender {
    UISlider *slider = (UISlider*)sender;
 
    NSLog(@"滑动条的当前数值是：%f",slider.value);
}

- (IBAction)showAlert:(id)sender {
    
    [[[UIAlertView alloc]initWithTitle:@"您好，苍老师" message:@"听说您的新贴转发了499次" delegate:nil cancelButtonTitle:@"我来帮转1次，你懂的" otherButtonTitles:nil, nil]show];
    
}
@end
