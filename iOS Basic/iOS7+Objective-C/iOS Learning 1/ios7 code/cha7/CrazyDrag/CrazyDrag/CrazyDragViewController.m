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
     int targetValue;
    
}
- (IBAction)sliderMoved:(UISlider*)sender;
@property (strong, nonatomic) IBOutlet UISlider *slider;

@property (strong, nonatomic) IBOutlet UILabel *targetLabel;

- (IBAction)showAlert:(id)sender;
@end

@implementation CrazyDragViewController
@synthesize slider;
@synthesize targetLabel;

-(void)updateLabels{
    
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
}


-(void)startNewRound{

    targetValue = 1+(arc4random()%100);
    currentValue = 50;
    self.slider.value = currentValue;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startNewRound];
    [self updateLabels];
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
    
    NSString *message = [NSString stringWithFormat:@"滑动条的当前数值是:%d，我们的目标数值是：%d",currentValue,targetValue];
    
    [[[UIAlertView alloc]initWithTitle:@"您好，苍老师" message:message delegate:nil cancelButtonTitle:@"本老师知道了" otherButtonTitles:nil, nil]show];
    [self startNewRound];
    [self updateLabels];
}
@end
