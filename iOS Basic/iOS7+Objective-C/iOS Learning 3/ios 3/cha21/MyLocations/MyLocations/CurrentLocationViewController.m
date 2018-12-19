//
//  FirstViewController.m
//  MyLocations
//
//  Created by happybubsy on 1/23/14.
//  Copyright (c) 2014 happybubsy. All rights reserved.
//

#import "CurrentLocationViewController.h"
#import "LocationDetailsViewController.h"

@interface CurrentLocationViewController ()

@end

@implementation CurrentLocationViewController{
    CLLocationManager *_locationManager;
    CLLocation *_location;
    
    BOOL _updatingLocation;
    NSError *_lastLocationError;
    
    CLGeocoder *_geocoder;
    CLPlacemark *_placemark;
    BOOL _performingReverseGeocoding;
    NSError *_lastGeocodingError;
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
        _placemark = nil;
        _lastGeocodingError = nil;
        
        [self startLocationManager];
    }

    [self updateLabels];
    [self configureGetButton];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"TagLocation"]){
        UINavigationController *navigationController = segue.destinationViewController;
        LocationDetailsViewController *controller = (LocationDetailsViewController*)navigationController.topViewController;
        
        controller.coordinate = _location.coordinate;
        controller.placemark = _placemark;
        controller.managedObjectContext = self.managedObjectContext;
    }
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if((self = [super initWithCoder:aDecoder])){
        _locationManager = [[CLLocationManager alloc]init];
        _geocoder = [[CLGeocoder alloc]init];
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
    
    CLLocationDistance distance = MAXFLOAT;
    
    if(_location !=nil){
        distance = [newLocation distanceFromLocation:_location];
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
        if(distance >0){
            _performingReverseGeocoding = NO;
        }
        
        if(!_performingReverseGeocoding){
            NSLog(@"*** Going to geocode");
            _performingReverseGeocoding = YES;
            
            [_geocoder reverseGeocodeLocation:_location completionHandler:^(NSArray *placemarks,NSError *error){
                
                NSLog(@"*** Found placemarks: %@, error: %@",placemarks,error);
                
                _lastGeocodingError = error;
                if(error == nil && [placemarks count] >0){
                    _placemark = [placemarks lastObject];
                }else{
                    _placemark = nil;
                }
                
                _performingReverseGeocoding = NO;
                [self updateLabels];
            }];
            
        }
        
    }else if (distance <1.0){
        NSTimeInterval timeInterval = [newLocation.timestamp timeIntervalSinceDate:_location.timestamp];
        if(timeInterval >10){
            NSLog(@"*** 强制完成！");
            [self stopLocationManager];
            [self updateLabels];
            [self configureGetButton];
        }
    }

}
-(NSString*)stringFromPlacemark:(CLPlacemark*)thePlacemark{
    
    return [NSString stringWithFormat:@"%@ %@\n%@ %@ %@",thePlacemark.subThoroughfare,thePlacemark.thoroughfare,thePlacemark.locality,thePlacemark.administrativeArea, thePlacemark.postalCode];
}


-(void)updateLabels{
    
    if(_location !=nil){
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f",_location.coordinate.latitude];
        self.longtitudeLabel.text = [NSString stringWithFormat:@"%.8f",_location.coordinate.longitude];
        self.tagButton.hidden = NO;
        self.messageLabel.text = @"";
        
        if(_placemark !=nil){
            self.adderssLabel.text = [self stringFromPlacemark:_placemark];
        }else if(_performingReverseGeocoding){
            self.adderssLabel.text = @"寻找中...";
        }else if(_lastGeocodingError !=nil){
            self.adderssLabel.text =@"对不住了姐，出错了";
        }else{
            self.adderssLabel.text =@"啥都没找到";
        }
        
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
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didTimeOut:) object:nil];
        [_locationManager stopUpdatingLocation];
        _locationManager.delegate = nil;
        _updatingLocation = NO;
    }
    
}

-(void)didTimeOut:(id)obj{
    
    NSLog(@"*** oops,超时了");
    
    if(_location == nil){
        [self stopLocationManager];
        _lastLocationError  = [NSError errorWithDomain:@"MyLocationsErrorDomain" code:1 userInfo:nil];
        [self updateLabels];
        [self configureGetButton];
    }
}

-(void)startLocationManager{
    
    if([CLLocationManager locationServicesEnabled]){
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        [_locationManager startUpdatingLocation];
        _updatingLocation = YES;
        
        [self performSelector:@selector(didTimeOut:) withObject:nil afterDelay:60];
    }
}



@end
