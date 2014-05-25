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
     int score;
     int round;
    
}
- (IBAction)sliderMoved:(UISlider*)sender;
@property (strong, nonatomic) IBOutlet UISlider *slider;

@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert:(id)sender;
@end

@implementation CrazyDragViewController
@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

-(void)updateLabels{
    
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",round];
}


-(void)startNewRound{

    round +=1;
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
    
    int difference = abs(currentValue - targetValue);
    
    int points = 100-difference;
    
    score += points;
    
    NSString *message = [NSString stringWithFormat:@"恭喜高富帅，您的得分是：%d",points];
    
    [[[UIAlertView alloc]initWithTitle:@"您好，土豪" message:message delegate:nil cancelButtonTitle:@"朕已知晓，爱卿辛苦了" otherButtonTitles:nil, nil]show];
    [self startNewRound];
    [self updateLabels];
}

@end
