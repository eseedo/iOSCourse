//
//  FirstViewController.m
//  MyLocations
//
//  Created by happybubsy on 1/23/14.
//  Copyright (c) 2014 happybubsy. All rights reserved.
//

#import "CurrentLocationViewController.h"

@interface CurrentLocationViewController ()

@end

@implementation CurrentLocationViewController{
    CLLocationManager *_locationManager;
    CLLocation *_location;
    
    BOOL _updatingLocation;
    NSError *_lastLocationError;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateLabels];
    
    [self configureGetButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)getLocation:(id)sender{
    
    if(_updatingLocation){
        [self stopLocationManager];
    }else{
        _location = nil;
        _lastLocationError = nil;
        
        [self startLocationManager];
    }

    [self updateLabels];
    [self configureGetButton];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if((self = [super initWithCoder:aDecoder])){
        _locationManager = [[CLLocationManager alloc]init];
    }
    return self;
}

#pragma mark -CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"定位失败：%@",error);
    
    if(error.code ==kCLErrorLocationUnknown){
        return;
    }
    
    [self stopLocationManager];
    _lastLocationError = error;
    
    [self updateLabels];
    [self configureGetButton];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"已更新坐标，当前位置：%@",newLocation);
    
    if([newLocation.timestamp timeIntervalSinceNow] < -5.0){
        return;
    }
    
    if(newLocation.horizontalAccuracy <0){
        return;
    }
    
    
    if(_location == nil || _location.horizontalAccuracy > newLocation.horizontalAccuracy){
        
        _lastLocationError = nil;
        _location = newLocation;
        [self updateLabels];
        
        if(newLocation.horizontalAccuracy <= _locationManager.desiredAccuracy){
            NSLog(@"***目标诺森德！成功完成定位");
            [self stopLocationManager];
            [self configureGetButton];
        }
        
    }

}

-(void)updateLabels{
    
    if(_location !=nil){
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f",_location.coordinate.latitude];
        self.longtitudeLabel.text = [NSString stringWithFormat:@"%.8f",_location.coordinate.longitude];
        self.tagButton.hidden = NO;
        self.messageLabel.text = @"";
    }else{
        
        self.latitudeLabel.text = @"";
        self.longtitudeLabel.text = @"";
        self.adderssLabel.text = @"";
        self.tagButton.hidden = YES;
        
        NSString *statusMessage;
        if(_lastLocationError != nil){
            
            if([_lastLocationError.domain isEqualToString:kCLErrorDomain] &&_lastLocationError.code == kCLErrorDenied)
            {
                statusMessage = @"对不起，用户禁用了定位功能";
            }else{
                statusMessage =@"对不起，获取位置信息错误";
            }
        }else if(![CLLocationManager locationServicesEnabled]){
            statusMessage =@"对不起，用户禁用了定位功能";
            
        }else if(_updatingLocation){
            statusMessage = @"定位中...";
        }else{
            statusMessage = @"请触碰按钮开始定位";
        }
        self.messageLabel.text = statusMessage;
        
    }
    
    
}


-(void)configureGetButton{
    
    if(_updatingLocation){
        
        [self.getButton setTitle:@"停停停停停" forState:UIControlStateNormal];
    }else{
        
        [self.getButton setTitle:@"获取当前所在位置" forState:UIControlStateNormal];
    }
    
}

-(void)stopLocationManager{
    
    if(_updatingLocation){
        [_locationManager stopUpdatingLocation];
        _locationManager.delegate = nil;
        _updatingLocation = NO;
    }
    
}

-(void)startLocationManager{
    
    if([CLLocationManager locationServicesEnabled]){
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        [_locationManager startUpdatingLocation];
        _updatingLocation = YES;
    }
}



@end
